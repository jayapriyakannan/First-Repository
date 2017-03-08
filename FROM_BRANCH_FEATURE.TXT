Feature: Logging

  Scenario: Login user to collections page after logging in
    Given I am on the login page
    And I login with username "jayapriya.kannan@bauerxcel.co.uk" and password "Muruga4*"                                                                                     # features/step_definitions/Login_steps.rb:1
    And I press "Sign in"                                                                                            # features/step_definitions/Login_steps.rb:17
    Then I should be on the home page
