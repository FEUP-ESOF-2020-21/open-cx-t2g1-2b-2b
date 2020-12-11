Feature: Open World Map

    As a user
    I want to open up the map
    So that I can see all the available conferences next to me.

    Scenario: User Taps Open World Map button
        Given There is a "See World Map" button
        When I tap the "See World Map" button
        Then The world map will open
        And I will see all conferences represented by pinpoints