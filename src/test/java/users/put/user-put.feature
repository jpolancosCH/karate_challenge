Feature: Put User on reqres.in

  Scenario: Put a user
    Given url "https://reqres.in" + "/api/users/" + "3"
    And request { "name": "Julian", "job": "QA" }
    When method put
    Then status 200
    And match $.name == "Julian"