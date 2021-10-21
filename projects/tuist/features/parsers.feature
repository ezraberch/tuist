Feature: Generate a new project using Tuist with parsed files.

  Scenario: The project is an iOS application with resources (ios_app_with_resources)
    Given that tuist is available
    And I have a working directory
    Then I copy the fixture ios_app_with_resources into the working directory
    Then tuist generates the project
    Then I should be able to build for iOS the scheme App
    Then I should be able to test for iOS the scheme App
