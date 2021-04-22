(define (problem extendedMarsRobot1) (:domain extendedMarsRobot)
(:objects 
    P0000 P1300 P0014 P1314 P9999 - safeLocation
    r1 - rover
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (= (battery r1) 0)
    (in P0000 r1)

    (=(distance P0000 P1300) 10)
    (=(distance P0000 P1300) 10)

    (=(distance P1300 P0014) 20)
    (=(distance P0014 P1300) 20)

    (=(distance P0014 P1314) 15)
    (=(distance P1314 P0014) 15)

    (=(distance P1314 P9999) 1)
    (=(distance P9999 P1314) 1)

)

(:goal (and
    ;todo: put the goal condition here
    (hasAnalysis P0000)
    (hasComunicated P1300)
    (hasPicture P0014)
    (hasSample P1314)
    (hasPicture P9999)
    (hasComunicated P0000)
))

(:constraints (and
    (always (> (battery r1) 20))
))
;un-comment the following line if metric is needed
(:metric minimize (total-time))
)