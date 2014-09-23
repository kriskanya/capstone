# As a user
# When I click the delete button on a comment
# I want that comment to be deleted from the DB and also disappear from the page

feature "User deletes a comment" do
  background do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user1.id)
    @comment = Fabricate(:comment, user_id: @user1.id, course_id: @course.id, comment_text: "Test Comment Text")
  end

  scenario "Happy path" do
    login_as @user1
    visit '/'
    click_on "Comments"
    expect(page).to have_content("Test Comment Text")
    click_on "Delete"
    expect(page).to have_content("Your comment has been successfully deleted.")
    current_path.should eq course_comments_path(@course)
    expect(page).to_not have_content("Test Comment Text")
    expect(Comment.count).to eq 0
  end

  scenario "Tries to delete comment that another user created" do
    login_as @user2
    visit '/'
    click_on "Comments"
    within('.delete-spec') { expect(page).to_not have_content("Delete") }
    expect(page).to have_content("Test Comment Text")
    current_path.should eq course_comments_path(@course)
    expect(Comment.count).to eq 1
  end

  scenario "Tries to delete comment that another user created - by just putting in the url" do
    login_as @user2

    # documentation for the following code: http://stackoverflow.com/questions/9228831/how-to-make-capybara-do-a-delete-request-in-a-cucumber-feature
    page.driver.submit :delete, "/courses/#{@course.id}/comments/#{@comment.id}", {}

    page.should have_content("You are not authorized to access this page.")
    page.should have_content("Test Comment Text")
    current_path.should eq course_comments_path(@course)
    expect(Comment.count).to eq 1
  end
end
