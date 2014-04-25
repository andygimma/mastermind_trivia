When(/^I visit the show questions page$/) do
  visit questions_path
end

Then(/^I should see the show questions page$/) do
  expect(page).to have_content("See All Questions")
end
