Feature: GameObject
    As a GameObject
    I want to be setted
    So that I can use it

    Background: prepare
        Given prepare register
        When set gameObject contribute
        And create and set the gameObject state

    Scenario: create a gameObject
        Then createGameObject should create a gameObject

    Scenario: get all gameObjects
        When create two gameObjects
        Then getAllGameObjects should return them

    Rule: handle with component

        Background: prepare components and create
            When register transform contribute
            And create and set transform state
            And register pbrMaterial contribute
            And create and set pbrMaterial state
            And register geometry contribute
            And create and set geometry state
            And register arcballCameraController contribute
            And create and set arcballCameraController state
            And register basicCameraView contribute
            And create and set basicCameraView state
            And register perspectiveCameraProjection contribute
            And create and set perspectiveCameraProjection state
            And register directionLight contribute
            And create and set directionLight state
            And create a gameObject as g1
            And create a transform as t1
            And create a pbrMaterial as p1
            And create a geometry as geo1
            And create a arcballCameraController as a1
            And create a basicCameraView as b1
            And create a perspectiveCameraProjection as pcp1
            And create a directionLight as d1
            And add t1 to g1
            And add p1 to g1
            And add geo1 to g1
            And add a1 to g1
            And add b1 to g1
            And add pcp1 to g1
            And add d1 to g1

        Scenario: defer dispose gameObject
            When defer dispose g1
            Then mark g1 as need dispose
            And mark t1 as need dispose
            And mark p1 as need dispose
            And mark geo1 as need dispose
            And mark a1 as need dispose
            And mark b1 as need dispose
            And mark pcp1 as need dispose
            And mark d1 as need dispose

        Scenario: get need disposed gameObjects
            When defer dispose g1
            Then get need disposed gameObjects should return them

        Scenario: dispose gameObjects
            When dispose [g1]
            Then mark g1 as disposed
            And mark t1 as disposed
            And mark p1 as disposed
            And mark geo1 as disposed
            And mark a1 as disposed
            And mark b1 as disposed
            And mark pcp1 as disposed
            And mark d1 as disposed

        Scenario: clone gameObject
            When clone 2 gameObjects of g1
            Then mark g1 as cloned
            And mark t1 as cloned
            And mark p1 as cloned
            And mark geo1 as cloned
            And mark a1 as cloned
            And mark b1 as cloned
            And mark pcp1 as cloned
            And mark d1 as cloned