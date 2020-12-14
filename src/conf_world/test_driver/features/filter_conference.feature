Feature: Filter Conferences

    As a user
    I want to search for conferences that match my interests
    so that I can better find what I'm looking for.

    Scenario: User filter Conferences
        Given I am on the Filtering Menu
        When I tap the "Filter by Type" button
        And I select a conference type
        Then The world map will only show pinpoints with conferences regarding the selected type
        And I will be able to select the conference