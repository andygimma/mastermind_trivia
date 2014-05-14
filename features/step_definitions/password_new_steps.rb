When(/^I visit the new password page$/) do
  visit new_user_password_path
end

Then(/^I should see the new password page$/) do
  expect(page).to have_content("Forgot your password")
end

