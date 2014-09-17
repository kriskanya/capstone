# As a user
# I want to be able to post a comment
# And have that comment show up on a particular course

feature "User posts a comment" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course)
    login_as @user
  end

  scenario "Happy Path" do
    visit '/'
    click_on "Comments"
    fill_in "Comment", with: "This is a comment for testing."
    click_button "Submit"
    page.should have_content "Comment has been posted."
    Course.last.comments.last.comment_text.should eq "This is a comment for testing."
    page.should have_content "This is a comment for testing."
  end

  scenario "Commenting is unsuccessful" do
    visit '/'
    click_on "Comments"
    fill_in "Comment", with: ""
    click_button "Submit"
    page.should have_content "Comment could not be posted."
  end
end
