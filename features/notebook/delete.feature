@notebook
Feature: Homepage
    In order to keep my notes organized
    As an authenticated user
    I need to be able to delete notebooks list
	
    Background:
        Given there are following users:
            | username | password |
            | Greg     | a        |
            | Katie    | a        |
	
#    Scenario: User should can delete notebook
#              and be redirected to notebook list
#              that does not contain deleted notebook.
#

#    Scenario: User should can cancel notebook deletion
#              and be redirect back to notebook list
#              and notebook should still exists.
#
