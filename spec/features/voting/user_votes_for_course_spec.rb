# As a user
# I want to click on the upvote arrow on a course
# And ensure that the course has been upvoted by me

feature "User votes on a course" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course)
    login_as @user
  end

  scenario "Happy Path - Upvote" do
    visit '/'
    find('.up-arrow-link').click
    @course.get_likes.size.should eq 1
    (@user.voted_for? @course).should eq true
    (@user.voted_up_on? @course).should eq true
    within('.course_likes') { expect(page).to have_content(1) }
    # arrow button should turn green
  end

  scenario "Happy Path - Downvote" do
    visit '/'
    find('.down-arrow-link').click
    @course.get_dislikes.size.should eq 1
    (@user.voted_for? @course).should eq true
    (@user.voted_down_on? @course).should eq true
    within('.course_likes') { expect(page).to have_content(0) }
  end
end
