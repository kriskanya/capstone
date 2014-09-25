# As a user
# When I go to edit my previous course posting and fill in the form
# I should see a prepopulated form and be able to submit changes

feature "User Edits a Course" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user.id, name: "TestName", url: "http://www.yahoo.com", description: "TestDescription", level: "Beginner", date: "2014-09-12", cost: 0, instructor: "Smith", institution: "UCLA", duration: "10 weeks")
    login_as @user  # this can be found in authentication.rb
  end

  scenario "Happy Path" do
    visit '/'
    page.should have_css('.glyphicon-edit')
    click_on "Edit"
    expect(page).to have_field('Name', with: 'TestName')
    expect(page).to have_field('Url', with: 'http://www.yahoo.com')
    expect(page).to have_field('Description', with: 'TestDescription')
    expect(page).to have_field('Level', with: 'Beginner')
    expect(page).to have_field('course[date(1i)]', with: '2014')
    expect(page).to have_field('course[date(2i)]', with: '9')
    expect(page).to have_field('course[date(3i)]', with: '12')
    expect(page).to have_field('Cost', with: '0')
    expect(page).to have_field('Instructor', with: 'Smith')
    expect(page).to have_field('Institution', with: 'UCLA')
    expect(page).to have_field('Duration', with: '10 weeks')

    fill_in "Name", with: "NewName"
    fill_in "Url", with: "http://www.google.com"
    expect(page).to have_field('Name', with: "NewName")
    expect(page).to have_field('Url', with: "http://www.google.com")
    click_on "Save Edit"
    page.should have_content("Course NewName has been updated.")
  end

  scenario "Blank form inputs" do
    visit '/'
    click_on "Edit"
    fill_in "Name", with: ""
    fill_in "Url", with: ""
    expect(page).to have_field('Name', with: '')
    expect(page).to have_field('Url', with: '')
    click_on "Save Edit"
    page.should have_content("Your changes could not be saved.")
    page.should have_error("can't be blank", on: "Name")
    page.should have_error("can't be blank", on: "Url")
  end
end

feature "User does not own course and therefore cannot edit" do

  scenario "Happy path" do
    @user1 = Fabricate(:user)
    @user2 = Fabricate(:user)
    @course = Fabricate(:course, user_id: @user1.id)
    login_as @user2
    visit '/'
    page.should_not have_css('.glyphicon-edit')
    within('.edit-spec') { expect(page).to_not have_content("Edit") }

    visit "/courses/#{@course.id}/edit"
    page.should have_content("You are not authorized to access this page.")
  end
end
