When(/^I visit the about page$/) do
  visit about_path
end

Then(/^I should see the about page$/) do
  expect(page).to have_content("about")
end
