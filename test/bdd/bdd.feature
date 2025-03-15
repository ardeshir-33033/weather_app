Feature: Transactions
  Scenario: Opening the app and seeing basic app ui
    Given the app is running
    Then I see {Icons.date_range} icon
    Then I see {"همه"} text
    Then I see {"پرداخت"} text
