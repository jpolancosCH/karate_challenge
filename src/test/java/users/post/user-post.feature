Feature: Post User on reqres.in

  Background:
    * url "https://reqres.in"
    * path "api/users"
    * request {"name": "#(name)","job": "#(Job)" }

  Scenario Outline: Post a user
    When method post
    Then status 201
    Examples:
      | name   | job     |
      | Julian | QA      |
      | Andres | leader  |
      | Andrea | teacher |


  Scenario: Post a user without name
    Given request {"name": "","job": "QA" }
    When method post
    Then status 201

  Scenario: Post a user without job
    Given request {"name": "Julian","job": "" }
    When method post
    Then status 201

  Scenario: Post a user with invalid name
    Given request {"name": "#$%&#$&","job": "" }
    When method post
    Then status 201