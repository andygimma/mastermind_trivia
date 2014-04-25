Given(/^I do have a web application$/) do
end

When(/^I visit the home page$/) do
	visit root_path 
end 

Then(/^I should see the home page$/) do
  expect(page).to have_content("Welcome to")
end