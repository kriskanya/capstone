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
