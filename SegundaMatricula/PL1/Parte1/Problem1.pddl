(define (problem Problem1) (:domain AidRelief)
(:objects 
    wareh - warehouse
    l1 - localization
    p1 - person
    d1 - drone
    c1 - crate
    food medcine - content
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (drone-in d1 wareh)
    (crate-in c1 wareh)
    (person-in p1 l1)
    (empty d1)
    (contains c1 food)
)

(:goal (and
    ;todo: put the goal condition here
    (has p1 food)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
