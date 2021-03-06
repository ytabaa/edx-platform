Feature: Overview Toggle Section
	In order to quickly view the details of a course's section or to scan the inventory of sections
    As a course author
    I want to toggle the visibility of each section's  subsection details in the overview listing

	Scenario: The default layout for the overview page is to show sections in expanded view
		Given I have a course with multiple sections
    When I navigate to the course overview page
    Then I see the "Collapse All Sections" link
    And all sections are expanded

	Scenario: Expand /collapse for a course with no sections
		Given I have a course with no sections
    When I navigate to the course overview page
    Then I do not see the "Collapse All Sections" link

	Scenario: Collapse link appears after creating first section of a course
		Given I have a course with no sections
    When I navigate to the course overview page
    And I add a section
    Then I see the "Collapse All Sections" link
    And all sections are expanded

    # Skipped because Ubuntu ChromeDriver hangs on alert
    @skip
	Scenario: Collapse link is not removed after last section of a course is deleted
		Given I have a course with 1 section
    And I navigate to the course overview page
    When I press the "section" delete icon
    And I confirm the alert
		Then I see the "Collapse All Sections" link

	Scenario: Collapsing all sections when all sections are expanded
		Given I navigate to the courseware page of a course with multiple sections
		And all sections are expanded
		When I click the "Collapse All Sections" link
		Then I see the "Expand All Sections" link
		And all sections are collapsed

	Scenario: Collapsing all sections when 1 or more sections are already collapsed
		Given I navigate to the courseware page of a course with multiple sections
		And all sections are expanded
		When I collapse the first section
		And I click the "Collapse All Sections" link
		Then I see the "Expand All Sections" link
		And all sections are collapsed

	Scenario: Expanding all sections when all sections are collapsed
		Given I navigate to the courseware page of a course with multiple sections
		And I click the "Collapse All Sections" link
		When I click the "Expand All Sections" link
		Then I see the "Collapse All Sections" link
		And all sections are expanded

	Scenario: Expanding all sections when 1 or more sections are already expanded
		Given I navigate to the courseware page of a course with multiple sections
		And I click the "Collapse All Sections" link
		When I expand the first section
		And I click the "Expand All Sections" link
		Then I see the "Collapse All Sections" link
		And all sections are expanded
