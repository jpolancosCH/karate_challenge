Feature: Delete User on reqres.in

  Scenario: Delete a user
    * call read("../post/user-post-snippets.feature@Create")
    Given url "https://reqres.in" + "/api/users/" + contactId
    When method delete
    Then status 204