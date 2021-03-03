(define (problem problem_name) (:domain domain_name)
(:objects 
    P0000 P1300 P0014 P1314 P9999 - location 
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (in P0000)
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

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
