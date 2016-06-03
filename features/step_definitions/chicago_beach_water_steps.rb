Given(/^I am a public user$/) do
end

When(/^I go to "([^"]*)"$/) do |path|
  visit path
end

Then(/^I will see current water data for all chicago beaches$/) do
  expect(page.body).to have_content("Current Water Temperatures")
end

