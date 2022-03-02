(define (problem Problem1) (:domain AidRelief)
(:objects 
    wareh - warehouse
    l1 l2 - localization
    p1 p2 - person
    d1 - drone
    c1 c2 c3 - crate
    food medicine - content
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (drone-in d1 wareh)
    (crate-in c1 wareh)
    (crate-in c2 wareh)
    (crate-in c3 wareh)
    (person-in p1 l1)
    (person-in p2 l2)
    (empty d1)
    (contains c1 food)
    (contains c2 food)
    (contains c3 food)
)

(:goal (and
    ;todo: put the goal condition here
        (has p1 food)
        (has p2 food))
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
