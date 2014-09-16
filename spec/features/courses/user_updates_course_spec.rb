# As a user
# When I go to edit my previous course posting and fill in the form
# I should see a prepopulated form and be able to submit changes

feature "User Edits a Course" do
  background do
    @user = Fabricate(:user)
    @course = Fabricate(:course)
    login_as @user  # this can be found in authentication.rb
  end

  scenario "Happy Path" do
    visit '/'
    click_on "Edit"
    expect(page).to have_field('Name', with: 'course0')
    expect(page).to have_field('Url', with: 'url0.com')
    expect(page).to have_field('Description', with: 'description0')
    expect(page).to have_field('Level', with: 'Beginner')
    expect(page).to have_field('course[date(1i)]', with: '2014')
    expect(page).to have_field('course[date(2i)]', with: '9')
    expect(page).to have_field('course[date(3i)]', with: '12')
    expect(page).to have_field('Cost', with: '0')
    expect(page).to have_field('Instructor', with: 'instructor0')
    expect(page).to have_field('Institution', with: 'institution0')
    expect(page).to have_field('Duration', with: '10 weeks')
    click_on "Save Edit"
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
