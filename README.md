# TLA+ Spec for the Nagel-Schreckenberg Model
---------------------------------------------

This TLA+ spec describes the behavior of a cellular automaton called the Nagel-Schreckenberg model, which is used as a basic model for single-lane highway traffic flow. 

https://en.wikipedia.org/wiki/Nagel%E2%80%93Schreckenberg_model

This spec attempts to encode the NaSchr CA dynamics, and to verify the property that the model should not allow any vehicles to collide. 

Right now, there is some room for improvement:
 * The maximum vehicle speed is 1; implement Vmax speed
 * The collision criteria is too loose; it would not be violated by a simultaneous collision and duplication in another location. The collision criteria should take spatial/locality criteria into account.