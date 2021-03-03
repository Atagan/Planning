;Header and description

(define (domain robotMotion)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    room
    caja
    luz
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (robotEn ?r - room)
    (cajaEn ?c - caja ?r - room)
    (luzOn -l - luz)
    (robotSobreCaja)
)


(:functions ;todo: define numeric functions here
)

(:action move
    :parameters (?r1 ?r2 -room)
    :precondition (and (robotEn ?r1) (not (= ?r1 ?r2)))
    :effect (and (not (robotEn ?r1)) 
                 (robotEn ?r2)
            )
)

(:action push
    :parameters (?c - caja ?r1 ?r2 - room)
    :precondition (and (robotEn ?r1) (cajaEn ?r1) )
    :effect (and)
)

(:action climbUp
    :parameters (?c - caja)
    :precondition (and )
    :effect (and )
)


;define actions here

)