Feature: Chicago beaches water data
  As any person
  I want to be able to get current water data about chicago beaches
  So I can better inform my beach-going experience

  Scenario: User visits homepage
    Given I am a public user
    When I go to "/"
    Then I will see current water data for all chicago beaches
