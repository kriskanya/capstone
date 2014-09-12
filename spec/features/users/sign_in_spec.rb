# As a user
# I want my credentails to be authenticated
# In order to log in to the site

feature "User Signs In" do
  background do
    Fabricate(:user, name: "testuser", email: "testuser@example.com", password: "password")
  end

  scenario "with correct credentials" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
    current_path.should == root_path
  end

  scenario "with an email that hasn't been registered" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "unregisteredemail@aol.com"
    fill_in "Password", with: "password"
    click_button "Sign in"
    page.should have_content("Invalid email address or password.")
    field_labeled("Email")[:value].should include("unregisteredemail@aol.com")  # check for the error message
    field_labeled("Password")[:value].should be_blank
  end

  scenario "with the incorrect password" do
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: "testuser@example.com"
    fill_in "Password", with: "wrongpassword"
    click_button "Sign in"
    page.should have_content("Invalid email or password.")
    field_labeled("Email")[:value].should include("testuser@example.com")  # check for the error message
    field_labeled("Password")[:value].should be_blank
  end

  scenario "with blank form" do
    visit '/'
    click_link "Sign in"
    click_button "Sign in"
    page.should have_content("Invalid email or password.")
  end
end






# # Feature: Sign in
# #   As a user
# #   I want to sign in
# #   So I can visit protected areas of the site
# feature 'Sign in', :devise do
#
#   # Scenario: User cannot sign in if not registered
#   #   Given I do not exist as a user
#   #   When I sign in with valid credentials
#   #   Then I see an invalid credentials message
#   scenario 'user cannot sign in if not registered' do
#     signin('test@example.com', 'please123')
#     expect(page).to have_content I18n.t 'devise.failure.not_found_in_database'
#   end
#
#   # Scenario: User can sign in with valid credentials
#   #   Given I exist as a user
#   #   And I am not signed in
#   #   When I sign in with valid credentials
#   #   Then I see a success message
#   scenario 'user can sign in with valid credentials' do
#     user = FactoryGirl.create(:user)
#     signin(user.email, user.password)
#     expect(page).to have_content I18n.t 'devise.sessions.signed_in'
#   end
#
#   # Scenario: User cannot sign in with wrong email
#   #   Given I exist as a user
#   #   And I am not signed in
#   #   When I sign in with a wrong email
#   #   Then I see an invalid email message
#   scenario 'user cannot sign in with wrong email' do
#     user = FactoryGirl.create(:user)
#     signin('invalid@email.com', user.password)
#     expect(page).to have_content I18n.t 'devise.failure.not_found_in_database'
#   end
#
#   # Scenario: User cannot sign in with wrong password
#   #   Given I exist as a user
#   #   And I am not signed in
#   #   When I sign in with a wrong password
#   #   Then I see an invalid password message
#   scenario 'user cannot sign in with wrong password' do
#     user = FactoryGirl.create(:user)
#     signin(user.email, 'invalidpass')
#     expect(page).to have_content I18n.t 'devise.failure.invalid'
#   end
#
# end
