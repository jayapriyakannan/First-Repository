

Given(/^I am on the login page$/) do
  visit "/"
end

Given(/^I login with username "([^"]*)" and password "([^"]*)"$/) do |username, password|
    @login_page.username.set username
    @login_page.password.set password
end

Given(/^I press "([^"]*)"$/) do |arg1|
  click_button(arg1)
end

Then(/^I should be on the home page$/) do
  expect(page).to have_content("Radio")
end
