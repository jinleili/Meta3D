Feature: UIVisual
    As a UIVisual
    I want to run app
    So that I can see

    Background: prepare
        Given prepare

    Scenario: if not loaded, show loading
        When not loaded and render
        Then should show loading

    Scenario: if loaded, show the canvas
        Given prepare the canvas
        And set its width, height
        When loaded and render
        Then should show the canvas

    Scenario: get and set visual extension
        Given generate visual extension v1 with old version
        And generate visual extension v2 with newest version
        And publish v1, v2
        When get and set visual extension
        Then should dispatch SetVisualExtension action with v2

    Scenario: render app
        Given prepare flag
        And generate empty element contribute element1
        And get visual extension v
        And generate extension ui
        And generate contribute c1
        And select ui
        And select c1
        When render app with ui, c1, v
        Then build app with ui, v and c1
        And v should be inited and updated


    Rule: build element middle represent and generate element contribute string

        Scenario: build element middle represent with two buttons generate element contribute string
            Given generate ui control button b1, b2
            And select b1, b2
            And prepare b1's, b2's inspector data
            When build element middle represent with b1, b2 and their inspector data
            And generate element contribute string
            Then should build correct result
            And generate correct result
