---- MODULE naschr ----
VARIABLE Occupation1
VARIABLE Occupation2
VARIABLE Occupation3
VARIABLE Occupation4
VARIABLE Occupation5

TypeOK == 
    /\ Occupation1 \in { TRUE, FALSE }
    /\ Occupation2 \in { TRUE, FALSE }
    /\ Occupation3 \in { TRUE, FALSE }
    /\ Occupation4 \in { TRUE, FALSE }
    /\ Occupation5 \in { TRUE, FALSE }

Init == 
    /\ Occupation1 = FALSE
    /\ Occupation2 = FALSE
    /\ Occupation3 = FALSE
    /\ Occupation4 = FALSE
    /\ Occupation5 = FALSE

MoveCar1 == 
    /\ Occupation1 = TRUE
    /\ Occupation2 = FALSE
    /\ Occupation1' = FALSE
    /\ Occupation2' = TRUE
    /\ Occupation3' = Occupation3
    /\ Occupation4' = Occupation4
    /\ Occupation5' = Occupation5

MoveCar2 == 
    /\ Occupation1' = Occupation1
    /\ Occupation2 = TRUE
    /\ Occupation3 = FALSE
    /\ Occupation2' = FALSE
    /\ Occupation3' = TRUE
    /\ Occupation4' = Occupation4
    /\ Occupation5' = Occupation5

MoveCar3 == 
    /\ Occupation1' = Occupation1
    /\ Occupation2' = Occupation2
    /\ Occupation3 = TRUE
    /\ Occupation4 = FALSE
    /\ Occupation3' = FALSE
    /\ Occupation4' = TRUE
    /\ Occupation5' = Occupation5

MoveCar4 == 
    /\ Occupation1' = Occupation1
    /\ Occupation2' = Occupation2
    /\ Occupation3' = Occupation3
    /\ Occupation4 = TRUE
    /\ Occupation5 = FALSE
    /\ Occupation4' = FALSE
    /\ Occupation5' = TRUE

MoveCar5 == 
    /\ Occupation2' = Occupation2
    /\ Occupation3' = Occupation3
    /\ Occupation4' = Occupation4
    /\ Occupation5 = TRUE
    /\ Occupation1 = FALSE
    /\ Occupation5' = FALSE
    /\ Occupation1' = TRUE

Idle ==
    /\ Occupation1 = FALSE
    /\ Occupation2 = FALSE
    /\ Occupation3 = FALSE
    /\ Occupation4 = FALSE
    /\ Occupation5 = FALSE
    /\ Occupation1' = FALSE
    /\ Occupation2' = FALSE
    /\ Occupation3' = FALSE
    /\ Occupation4' = FALSE
    /\ Occupation5' = FALSE

Next == 
    \/ MoveCar1
    \/ MoveCar2
    \/ MoveCar3
    \/ MoveCar4
    \/ MoveCar5
    \/ Idle

====