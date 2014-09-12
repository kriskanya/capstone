# As a user
# I want the ability to sign up
# In order to post new courses and comments
#
# Acceptance Criteria:
#
# Able to input username, email, password, and password verify
# Validate that email and password are present
# User accont should be saved to the database
# User password should be encrypted

feature "User signs up" do
  scenario "Happy Path, Sign Up and subsequent Sign In, redirect to home" do
    visit '/'
    click_link "Sign up"
    fill_in "Name", with: "person1"
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_button "Sign up"
    # current_path.should == root_path
    page.should have_content("Welcome! You have signed up successfully.")
    page.should_not have_content("Sign up")
    page.should_not have_content("Sign in")

    click_link "Sign out"
    current_path.should == root_path
    click_link "Sign in"
    fill_in "Email", with: "person@example.com"
    fill_in "Password", with: "password1"
    click_button "Sign in"
    page.should have_content("Signed in successfully")
  end

  scenario "Does not enter email and password" do
    visit '/'
    click_link "Sign up"
    click_button "Sign up"
    # page.should have_error("can't be blank", on: "Email")
    # page.should have_error("can't be blank", on: "Password")
    page.should have_content("Email can't be blank")
    page.should have_content("Password can't be blank")
  end
end




# # Feature: Sign up
# #   As a visitor
# #   I want to sign up
# #   So I can visit protected areas of the site
# feature 'Sign Up', :devise do
#
#   # Scenario: Visitor can sign up with valid email address and password
#   #   Given I am not signed in
#   #   When I sign up with a valid email address and password
#   #   Then I see a successful sign up message
#   scenario 'visitor can sign up with valid email address and password' do
#     sign_up_with('test@example.com', 'please123', 'please123')
#     expect(page).to have_content I18n.t 'devise.registrations.signed_up'
#   end
#
#   # Scenario: Visitor cannot sign up with invalid email address
#   #   Given I am not signed in
#   #   When I sign up with an invalid email address
#   #   Then I see an invalid email message
#   scenario 'visitor cannot sign up with invalid email address' do
#     sign_up_with('bogus', 'please123', 'please123')
#     expect(page).to have_content 'Email is invalid'
#   end
#
#   # Scenario: Visitor cannot sign up without password
#   #   Given I am not signed in
#   #   When I sign up without a password
#   #   Then I see a missing password message
#   scenario 'visitor cannot sign up without password' do
#     sign_up_with('test@example.com', '', '')
#     expect(page).to have_content "Password can't be blank"
#   end
#
#   # Scenario: Visitor cannot sign up with a short password
#   #   Given I am not signed in
#   #   When I sign up with a short password
#   #   Then I see a 'too short password' message
#   scenario 'visitor cannot sign up with a short password' do
#     sign_up_with('test@example.com', 'please', 'please')
#     expect(page).to have_content "Password is too short"
#   end
#
#   # Scenario: Visitor cannot sign up without password confirmation
#   #   Given I am not signed in
#   #   When I sign up without a password confirmation
#   #   Then I see a missing password confirmation message
#   scenario 'visitor cannot sign up without password confirmation' do
#     sign_up_with('test@example.com', 'please123', '')
#     expect(page).to have_content "Password confirmation doesn't match"
#   end
#
#   # Scenario: Visitor cannot sign up with mismatched password and confirmation
#   #   Given I am not signed in
#   #   When I sign up with a mismatched password confirmation
#   #   Then I should see a mismatched password message
#   scenario 'visitor cannot sign up with mismatched password and confirmation' do
#     sign_up_with('test@example.com', 'please123', 'mismatch')
#     expect(page).to have_content "Password confirmation doesn't match"
#   end
#
# end
