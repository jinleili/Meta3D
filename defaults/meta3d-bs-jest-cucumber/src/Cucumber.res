type parsedFeature

type stepFunction = unit => unit
// type stepFunction1 = unit => Js.Promise.t<unit>

type defineStepFunction = (string, stepFunction) => unit
// type defineStepFunction1 = (string, stepFunction1) => unit
// Js.Promise.t<unit>

type stepsDefinitionCallbackOptions = {
  given: defineStepFunction,
  \"when": defineStepFunction,
  then: defineStepFunction,
  \"and": defineStepFunction,
  but: defineStepFunction,
}

type stepsDefinitionCallbackFunction = stepsDefinitionCallbackOptions => unit

type defineScenarioFunctionWithAliases = (. string, stepsDefinitionCallbackFunction) => unit

type scenariosDefinitionCallbackFunction = defineScenarioFunctionWithAliases => unit

@module("jest-cucumber")
external loadFeature: string => parsedFeature = "loadFeature"

@module("jest-cucumber")
external defineFeature: (parsedFeature, scenariosDefinitionCallbackFunction) => unit =
  "defineFeature"
