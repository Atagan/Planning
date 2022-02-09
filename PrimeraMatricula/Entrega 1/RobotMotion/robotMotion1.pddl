(define (problem robotMotion1) (:domain robotMotion)
(:objects 
    r1 r2 r3 - room
    l1 l2 l3 l4 - luz
    caja1 - caja
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (robotEn r3)
    
    (luzEn l1 r1)
    (luzEn l2 r2)
    (luzEn l3 r3)
    (luzEn l4 r3)

    (cajaEn caja1 r1)
)

(:goal (and
    ;todo: put the goal condition here
    (encendida l1)
    (encendida l2)
    (encendida l3)
    (encendida l4)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
