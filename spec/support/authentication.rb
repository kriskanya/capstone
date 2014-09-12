def login_as(user)
 if Capybara.current_driver == Capybara.javascript_driver
    visit '/'
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Sign in"
 else
    page.driver.follow(:post, user_session_url, { user: { email: user.email, password: "password"} })
 end
end
