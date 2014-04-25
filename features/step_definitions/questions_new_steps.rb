When(/^I visit the new question page$/) do
  visit new_questions_path
end

Then(/^I should see the new question page$/) do
  expect(page).to have_content("Add a question")
end
