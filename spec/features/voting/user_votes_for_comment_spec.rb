# As a user
# I want to click on the upvote arrow on a comment
# And ensure that the comment has been upvoted by me

feature "User votes on a course" do
  background do
    @user = Fabricate(:user)
    @user2 = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user.id)
    @comment = Fabricate(:comment, course_id: @course.id, user_id: @user.id)
    login_as @user2
  end

  scenario "Happy Path - Upvote" do
    visit '/'
    click_on "Comments"
    find('.up-arrow-link').click
    @comment.get_likes.size.should eq 1
    (@user2.voted_for? @comment).should eq true
    (@user2.voted_up_on? @comment).should eq true
     within('.comment_likes') { expect(page).to have_content(1) }
  end

  scenario "Happy Path - Downvote" do
    visit '/'
    click_on "Comments"
    find('.down-arrow-link').click
    @comment.get_dislikes.size.should eq 1
    (@user2.voted_for? @comment).should eq true
    (@user2.voted_down_on? @comment).should eq true
    within('.comment_likes') { expect(page).to have_content(0) }
  end
end
