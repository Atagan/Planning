;Header and description

(define (domain robotMotion)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality :disjunctive-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    room 
    caja
    luz
    door
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (robotEn ?x - room)
    (cajaEn ?x - caja ?y - room)
    (luzEn ?l - luz ?r - room)
    (encendida ?l - luz)
    (robotSobreCaja)
    (connected ?x ?y - room)
    (conects ?x ?y - room ?z - door)
    (opened ?d - door)
)


(:functions ;todo: define numeric functions here
)

(:action move
    :parameters (?d - door ?r1 ?r2 - room)
    :precondition (and (opened ?d) 
                        (not (= ?r1 ?r2)) 
                        (robotEn ?r1)
                        (conects ?r1 ?r2 ?d) 
                        (not (robotSobreCaja)))
    :effect (and (not (robotEn ?r1)) (robotEn ?r2))
)

(:action open
    :parameters (?d - door ?r1 ?r2 - room)
    :precondition (and (or (robotEn ?r1) (robotEn ?r2)) (conects ?r1 ?r2 ?d))
    :effect (opened ?d)
)


(:action push
    :parameters (?c - caja ?r1 ?r2 - room ?d - door)
    :precondition   (and (opened ?d) 
                    (cajaEn ?c ?r1) 
                    (not (= ?r1 ?r2)) 
                    (robotEn ?r1)
                    (conects ?r1 ?r2 ?d) 
                    (not (robotSobreCaja)))
    :effect (and (robotEn ?r2) (cajaEn ?c ?r2))
)

(:action climbUp
    :parameters (?c - caja ?r - room)
    :precondition (and (robotEn ?r) (cajaEn ?c ?r) (not (robotSobreCaja)))
    :effect (robotSobreCaja)
)

(:action climbDown
    :parameters (?c - caja ?r - room)
    :precondition (and (robotEn ?r) (cajaEn ?c ?r) (robotSobreCaja))
    :effect (not( robotSobreCaja))
)

(:action turnOn
    :parameters (?l - luz ?r - room)
    :precondition (and (robotEn ?r) (not (encendida ?l)) (robotSobreCaja) (luzEn ?l ?r))
    :effect (encendida ?l)
)

(:action turnOff
    :parameters (?l - luz ?r - room)
    :precondition (and (robotEn ?r) (encendida ?l) (robotSobreCaja) (luzEn ?l ?r))
    :effect (not (encendida ?l))
)




;define actions here

)