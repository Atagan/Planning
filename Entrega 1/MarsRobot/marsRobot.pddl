;Header and description

(define (domain marsRobot)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    location    
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (hasSample ?x - location)
    (hasPicture ?x - location)
    (hasAnalysis ?x - location)
    (hasComunicated ?x - location)
    (in ?x - location)
)

(:functions ;todo: define numeric functions here
)

;define actions here
(:action move
    :parameters (?x ?y - location)
    :precondition (and (not (= ?x ?y))
                       (not (in ?y)))
    :effect (and (in ?y)
                 (not (in ?x))
                 )
)

(:action takePhoto
    :parameters (?x - location)
    :precondition (and (in ?x)
                       (not (hasPicture ?x))
                )
    :effect (hasPicture ?x)
)

(:action drill
    :parameters (?x - location)
    :precondition (and (in ?x)
                       (not (hasSample ?x))
                )
    :effect (hasSample ?x)
)

(:action analize
    :parameters (?x - location)
    :precondition (and (in ?x)
                       (not (hasAnalysis ?x))
                  )
    :effect (hasAnalysis ?x)
)

(:action comunicate
    :parameters (?x - location)
    :precondition (in ?x)
    :effect (hasComunicated ?x)
)


)