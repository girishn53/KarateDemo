@demo
Feature: Calculates the bmi and return the scale

  @first
  Scenario Outline: Happy Path
    Calculates bmi with provided user details , validates that API is returning 200 status code

    Given url 'https://body-mass-index-bmi-calculator.p.rapidapi.com/'
    And path 'imperial'
    And header x-rapidapi-key = '<header1>'
    And header x-rapidapi-host = '<header2>'
    And params {"weight":<weight>,"height":<height>}
    When method GET
    Then status 200

    Examples: 
      | header1                                            | header2                                       | weight | height |
      | 90c7289887mshb28ec34d1e725f9p1e2b2bjsn2750baf594bd | body-mass-index-bmi-calculator.p.rapidapi.com |    200 |     68 |

  @second
  Scenario Outline: Interface validation
    Validate the status codes by passing accepted and not accepted values of the headers

    Given url 'https://body-mass-index-bmi-calculator.p.rapidapi.com/'
    And path 'imperial'
    And header x-rapidapi-key = '<header1>'
    And header x-rapidapi-host = '<header2>'
    And params {"weight":<weight>,"height":<height>}
    When method GET
    Then status <status>

    Examples: 
      | header1                                            | header2                                       | weight | height | status |
      | null                                               | body-mass-index-bmi-calculator.p.rapidapi.com |     20 |     68 |    403 |
      | 90c7289887mshb28ec34d1e725f9p1e2b2bjsn2750baf594bd | null                                          |     20 |     68 |    404 |
      | 90c7289887mshb28ec34d1e725f9p1e2b2bjsn2750baf594bd | body-mass-index-bmi-calculator.p.rapidapi.com |     20 |     68 |    200 |

  @third
  Scenario Outline: Schema validation
    Validate the status codes by passing accepted and not accepted values of the headers

    Given url 'https://body-mass-index-bmi-calculator.p.rapidapi.com/'
    And path 'imperial'
    And header x-rapidapi-key = '<header1>'
    And header x-rapidapi-host = '<header2>'
    And params {"weight":<weight>,"height":<height>}
    When method GET
    Then print response
    And match response.weight == '#string'
    And match response.bmi == '#number'
    And match response.height == '#string'

    Examples: 
      | header1                                            | header2                                       | weight | height |
      | 90c7289887mshb28ec34d1e725f9p1e2b2bjsn2750baf594bd | body-mass-index-bmi-calculator.p.rapidapi.com |     20 |     68 |

  @fourth
  Scenario Outline: Business validation
    Validate all the business flows

    Given url 'https://body-mass-index-bmi-calculator.p.rapidapi.com/'
    And path 'imperial'
    And header x-rapidapi-key = '<header1>'
    And header x-rapidapi-host = '<header2>'
    And params {"weight":<weight>,"height":<height>}
    When method GET
    Then print response
    And match response.weight == '#present'
    And match response.bmi == '#notnull'
    And match response.height == '#present'

    Examples: 
      | header1                                            | header2                                       | weight | height |
      | 90c7289887mshb28ec34d1e725f9p1e2b2bjsn2750baf594bd | body-mass-index-bmi-calculator.p.rapidapi.com |     20 |     68 |
