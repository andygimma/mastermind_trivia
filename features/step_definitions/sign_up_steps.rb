When(/^I visit the sign up page$/) do
  visit new_user_registration_path
end

Then(/^I should see the sign up page$/) do
  expect(page).to have_content("Sign up")
end
