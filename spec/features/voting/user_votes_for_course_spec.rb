# As a user
# I want to click on the upvote arrow on a course
# And ensure that the course has been upvoted by me

feature "User upvotes a course" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course)
    login_as @user
  end

  scenario "Happy Path" do
    visit '/'
    click_on "up arrow"
    @course.get_likes.size.should eq 1
    (@user.voted_for? @course).should eq true
    @user.voted_up_on?.should eq true
    # page should show a tally of 1
    # arrow button should turn green
  end
end
