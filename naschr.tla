---- MODULE naschr ----
EXTENDS Naturals

VARIABLE Occupation
VARIABLE NumEntered
VARIABLE NumExited

TypeOK == 
    /\ Occupation \in [ { 1, 2, 3, 4, 5 } -> BOOLEAN ]
    /\ NumEntered \in 0..10
    /\ NumExited \in 0..50

Init == 
    /\ Occupation = <<TRUE, FALSE, FALSE, FALSE, FALSE>>
    /\ NumEntered = 1
    /\ NumExited = 0
    
BoolToInt(b) == IF b THEN 1 ELSE 0
    
NumObjects(oc) == BoolToInt(oc[1]) + BoolToInt(oc[2]) + BoolToInt(oc[3]) + BoolToInt(oc[4]) + BoolToInt(oc[5])
    
Crash == NumObjects(Occupation') /= NumEntered' - NumExited'

NoCrashEver == [][Crash = FALSE]_<<Occupation, NumEntered, NumExited>>

MoveCar(n) ==
     /\ Occupation[n] = TRUE
     /\ Occupation[n+1] = FALSE
     /\ Occupation' = [Occupation EXCEPT ![n] = FALSE, ![n+1] = TRUE]
     /\ NumEntered' = NumEntered
     /\ NumExited' = NumExited

MoveCar1 == 
    /\ MoveCar(1)

MoveCar2 ==
    /\ MoveCar(2)

MoveCar3 == 
    /\ MoveCar(3)

MoveCar4 == 
    /\ MoveCar(4)
    
EnterCar == 
    /\ NumEntered < 10
    /\ Occupation[1] = FALSE
    /\ Occupation' = [Occupation EXCEPT ![1] = TRUE]
    /\ NumEntered' = NumEntered + 1
    /\ NumExited' = NumExited
    
ExitCar == 
    /\ Occupation[5] = TRUE
    /\ Occupation' = [Occupation EXCEPT ![5] = FALSE]
    /\ NumEntered' = NumEntered
    /\ NumExited' = NumExited + 1

Idle ==
    /\ \A i \in 1..5: Occupation[i] = FALSE
    /\ Occupation' = Occupation
    /\ NumEntered' = NumEntered
    /\ NumExited' = NumExited

Next == 
    \/ MoveCar1
    \/ MoveCar2
    \/ MoveCar3
    \/ MoveCar4
    \/ ExitCar
    \/ EnterCar
    \/ Idle
    

====