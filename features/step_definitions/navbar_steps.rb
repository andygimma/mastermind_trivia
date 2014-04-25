Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I click on the "(.*?)" button in the navigation$/) do |action|
  within('.nav') do
    click_on action
  end
end
