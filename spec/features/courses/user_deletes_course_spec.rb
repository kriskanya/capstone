# As a user
# When I click the icon next to a specific course to delete it
# I want the course to be deleted from the page and from the db

feature "User deletes a course" do
  background do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @course = Fabricate(:course, name: "Test Course", user_id: @user1.id) # course created by @user1
  end

  scenario "Happy Path" do
    login_as @user1
    visit '/'
    click_on "Delete"
    page.should have_content("Your course has been deleted.")
    page.should_not have_content("Test Course")
    current_path.should eq courses_path
    expect(Course.count).to eq 0
  end

  scenario "Tries to delete course that another user created" do
    login_as @user2
    visit '/'
    within('.delete-spec') { expect(page).to_not have_content("Delete") }
    expect(Course.count).to eq 1
  end

  scenario "Tries to delete course that another user created - by just putting in the url" do
    login_as @user2
    
    # documentation for the following code: http://stackoverflow.com/questions/9228831/how-to-make-capybara-do-a-delete-request-in-a-cucumber-feature
    page.driver.submit :delete, "/courses/#{@course.id}", {}

    page.should have_content("You are not authorized to access this page.")
    expect(Course.count).to eq 1
  end
end
