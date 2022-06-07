---- MODULE naschr_function ----
EXTENDS Naturals, Sequences

VARIABLE Occupation
VARIABLE NumEntered
VARIABLE NumExited

CONSTANT RoadLength

TypeOK == 
    /\ Occupation \in [ 1..RoadLength -> {TRUE, FALSE} ]
    /\ NumEntered \in 0..10
    /\ NumExited \in 0..50

Init == 
    /\ Occupation = [ i \in 1..RoadLength |-> i = 1 ]
    /\ NumEntered = 1
    /\ NumExited = 0
    
BoolToInt(b) == IF b THEN 1 ELSE 0
    
NumObjects(oc) == BoolToInt(oc[1]) + BoolToInt(oc[2]) + BoolToInt(oc[3]) + BoolToInt(oc[4]) + BoolToInt(oc[5])
    
Crash == NumObjects(Occupation) /= NumEntered - NumExited

NoCrashEver == Crash = FALSE

MoveCar(n) ==
     /\ Occupation[n] = TRUE
     /\ Occupation[n+1] = FALSE
     /\ Occupation' = [Occupation EXCEPT ![n] = FALSE, ![n+1] = TRUE]
     /\ NumEntered' = NumEntered
     /\ NumExited' = NumExited

EnterCar == 
    /\ NumEntered < 10
    /\ Occupation[1] = FALSE
    /\ Occupation' = [Occupation EXCEPT ![1] = TRUE]
    /\ NumEntered' = NumEntered + 1
    /\ NumExited' = NumExited
    
ExitCar == 
    /\ Occupation[RoadLength] = TRUE
    /\ Occupation' = [Occupation EXCEPT ![RoadLength] = FALSE]
    /\ NumEntered' = NumEntered
    /\ NumExited' = NumExited + 1

Idle ==
    /\ \A i \in 1..Len(Occupation): Occupation[i] = FALSE
    /\ Occupation' = Occupation
    /\ NumEntered' = NumEntered
    /\ NumExited' = NumExited

Next == 
    \/ MoveCar(1)
    \/ MoveCar(2)
    \/ MoveCar(3)
    \/ MoveCar(4)
    \/ ExitCar
    \/ EnterCar
    \/ Idle
    

====