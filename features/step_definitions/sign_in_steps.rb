When(/^I visit the sign in page$/) do
  visit new_user_session_path
end

Then(/^I should see the sign in page$/) do
  expect(page).to have_content("Sign in")
end
