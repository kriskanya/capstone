# As a user
# When I enter a url for a course that is incorrect
# I want the form to tell me it is incorrect and have me re-enter it

feature "User enters a URL for a course" do
  background do
    @user = Fabricate(:user)
    login_as @user
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
    current_path.should == course_comments_path(@course)
    within("#course_details") do
      page.should have_content("Programming 101 with Udacity")
    end
  end

  scenario "URL format is incorrect" do
    visit '/'
    click_on "Post a Course"
    fill_in "Name", with: "Programming 101 with Udacity"
    fill_in "Url", with: "www.udacity.com/course/cs101"
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
    page.should have_content("must be formatted correctly")
    page.should have_content("Course could not be posted")
    current_path.should == courses_path
    # This is courses_path (and not new_course_path) because that's the url for the 'create' action
    # See more here: http://stackoverflow.com/questions/14490098/in-rails-3-when-a-resource-create-action-fails-and-calls-render-new-why-must
  end
end
