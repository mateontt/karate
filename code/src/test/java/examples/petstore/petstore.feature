Feature: PetStore sample CRUD with Karate

  Background:
    * configure ssl = true
    * url 'https://petstore.swagger.io/v2/pet'


  Scenario: Create new Pet

    * def newPet = 
    """
    {
      "id": 987,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "Alan Parson",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """

    Given request newPet
    When method POST
    Then status 200

    Given path 987
    When method GET
    Then status 200

  Scenario: Update Pet
    * def newPet = 
    """
    {
      "id": 987,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "Mike Oldfield",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """

    Given request newPet
    When method PUT
    Then status 200

    Given path 987
    When method GET
    Then status 200

  Scenario: Get Pet by ID
    Given path 987
    When method GET
    Then status 200
    * match response.name == "Mike Oldfield"

  Scenario: Delete Pet by ID
    # Delete pet for first time
    Given path 987
    When method DELETE
    Then status 200

    # Delete again, should returns 404
    When method DELETE
    Then status 405

  

    