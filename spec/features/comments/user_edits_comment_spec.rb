feature "User edits a comment" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user.id)
    @comment = Fabricate(:comment, course_id: @course.id, user_id: @user.id)
    login_as @user
  end

  scenario "Happy path" do
    visit '/'
    click_on "Comments"
    # Capybara.exact = true
    page.should have_css('.glyphicon-edit')
    click_on "Edit"
    expect(page).to have_field("Comment", with: "commenttext0")
    click_on "Save Edit"
    current_path.should eq course_comment_path(@comment, @course)
    click_on "Back to Comments"
    current_path.should eq course_comments_path(@course)
  end

  scenario "Leaves text field blank" do
    visit '/'
    click_on "Comments"
    # Capybara.exact = true
    click_on "Edit"
    expect(page).to have_field("Comment", with: "commenttext1")
    fill_in "Comment", with: ""
    click_on "Save Edit"
    page.should have_content("Your changes could not be saved.")
    page.should have_error("can't be blank", on: "Comment")
  end
end

feature "User does not own comment and therefore cannot edit" do

  scenario "Happy path" do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user2.id)
    @comment = Fabricate(:comment, user_id: @user1.id, course_id: @course.id)
    login_as @user2
    visit "/courses/#{@course.id}/comments"
    page.should_not have_css('.glyphicon-edit')
    within('.edit-spec') { expect(page).to_not have_content("Edit") }

    visit "/courses/#{@course.id}/comments/#{@comment.id}/edit"
    page.should have_content("You are not authorized to access this page.")
  end
end
