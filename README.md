ScalableTranslationStatistics
=================

The ScalableTranslationStatistics library was developed as a contribution to the PHyMoS  project [Proper Hybrid Models for Smarter Vehicles](https://phymos.de/) funded by the German Federal Ministry for Economic Affairs and Climate Action.
The ScalableTranslationStatistics library offers Modelica models of different complexities fully parametrizable by the user. It is intended to be a baseline to surrogate complex partitions of a Modelica model by AI-methods. 

## Library description

The ScalableTranslationStatistics Library was inspired by the [ScalableTestSuite](https://github.com/casella/ScalableTestSuite). The ScalableTestSuite is a great tool for testing specific aspects of Modelica models. But, it does not provide means to scale specific aspects of the equation system within one model (e.g. size of nonlinear systems of equations). 

This is the aim of ScalableTranslationStatistics: It offers one principal Modelica model to scale the metrics given in Dymola's translation statistics, such as linear and nonlinear systems of equations or continuous time states. Their number of occurrences in the model are fully parametrizable by the user of the model. This makes it possible to scale for example the equation system in different aspects evoking different numerical behavior.

![Principle structure of the scalable mechanical model](https://github.com/ltx-simulation/ScalableTranslationStatistics/blob/main/ScalableTranslationStatistics/Resources/Example_ScalableModel.png)

In addition several add-Ons for the model are offered, regarding further topics of model-complexity such as sparsity, stiffness, external code, events, etc. .

The library is developed in Dymola but also works in other Modelica tools (tested for OpenModelica).


## Current release

2.0.0 

Release Notes:

- adding scalable models from the physical domain of fluid-mechanics to the library. Therefore the library is split into the two major subpackages "Mechanics" and "Fluid".
- A scalable fluid model can look like this:
- ![Principle structure of the scalable fluid model](https://github.com/ltx-simulation/ScalableTranslationStatistics/blob/main/ScalableTranslationStatistics/Resources/Example_FluidModel.png)



## Development and contribution
The library was developed by LTX Simulation GmbH

Contributors:
- Matthias Schaefer

You may report any issues with using the [Issues](https://github.com/ltx-simulation/ScalableTranslationStatistics/issues) button.

Contributions as [Pull Requests](https://github.com/ltx-simulation/ScalableTranslationStatistics/pulls) are always welcome.

## Legal
For the conditions of usage of the ScalableTransationStatistics library please see [License Conditions](./License.md)
