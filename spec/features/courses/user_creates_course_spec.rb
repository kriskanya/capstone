# As a user
# When I go to the new page and I fill in the form inputs
# and hit submit, I should see a flash notice saying "you created a post".
#
# When I go to the index page, I should see the course that
# I just created

feature "User Creates a Course" do
  background do
    @user = Fabricate(:user)
    login_as @user  # this can be found in authentication.rb
  end

  scenario "Happy Path" do
    visit '/'
    click_on "Post a Course"
    fill_in "Name", with: "Programming 101 with Udacity"
    fill_in "Url", with: "https://www.udacity.com/course/cs101"
    fill_in "Description", with: "Introduction to programming"
    select "Beginner", :from => "Level" #this should be a dropdown
    select "2014", :from => "course[date(1i)]"
    select "October", :from => "course[date(2i)]"
    select "20", :from => "course[date(3i)]"
    fill_in "Cost", with: "Free" # default should be "free"
    fill_in "Instructor", with: "David Evans"
    fill_in "Institution", with: "Udacity"
    fill_in "Duration", with: "3 months"

    click_on "Post Course"
    page.should have_content("Programming 101 with Udacity has been posted")
    @course = Course.last
    current_path.should == course_path(@course)
    within("#course_details") do
      page.should have_content("Programming 101 with Udacity")
    end
  end
end
