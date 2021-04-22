;Header and description

(define (domain extendedMarsRobot)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    safeLocation dangerousLocation - location    
    rover
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (hasSample ?x - location)
    (hasPicture ?x - location)
    (hasAnalysis ?x - location)
    (hasComunicated ?x - location)
    (in ?x - location ?r - rover)
)

(:functions ;todo: define numeric functions here
    (battery ?r -rover)
    (distance ?l1 ?l2 - location)
)

;define actions here
(:durative-action move-fast
    :parameters (?x ?y - location ?r - rover)
    :duration (= ?duration (distance ?x ?y))
    :condition (and 
        (at start (and (in ?x ?r)
                       (not (= ?x ?y))
                       (not (in ?y ?r))
                       (>= (battery ?r) (* 2 (distance ?x ?y)))
        ))
    )
    :effect (and 
        (at end (and (in ?y ?r)
                     (decrease (battery ?r) (* 2 (distance ?x ?y)))
        ))
    )
)

(:durative-action move-slow
    :parameters (?x ?y - location ?r - rover)
    :duration (= ?duration (* 2 (distance ?x ?y)))
    :condition (and 
        (at start (and (in ?x ?r)
                       (not (= ?x ?y))
                       (not (in ?y ?r))
                       (>= (battery ?r)  (distance ?x ?y))
        ))
    )
    :effect (and 
        (at end (and (in ?y ?r)
                     (decrease (battery ?r)  (distance ?x ?y))
        ))
    )
)

(:durative-action recharge
    :parameters (?r - rover)
    :duration (= ?duration 20)
    :effect (at end (increase (battery ?r) 20))
)

(:durative-action takePhoto
    :parameters (?x - location ?r - rover)
    :duration (= ?duration 5)
    :condition (and 
        (at start (and (in ?x ?r)
                       (not (hasPicture ?x))
                       (>= (battery ?r) 5)
        ))
    )
    :effect
        (at end (and(decrease (battery ?r) 5)
                    (hasPicture ?x)
        ))
)

(:durative-action drill
    :parameters (?x - location ?r - rover)
    :duration (= ?duration 20)
    :condition (and 
        (at start (and (in ?x ?r)
                  (not (hasSample ?x))
                  (>= (battery ?r) 20)
                ))
    )
    :effect (at end
                (and (hasSample ?x)
                (decrease (battery ?r) 20))
    )
)

(:durative-action analize
    :parameters (?x - location ?r - rover)
    :duration (= ?duration 10)
    :condition (at start (and (in ?x ?r)
                         (not (hasAnalysis ?x))
                         (>= (battery ?r) 10)
                ))
    :effect (at end 
                (and (hasAnalysis ?x)
                (decrease (battery ?r) 10))
    )
)

(:durative-action comunicate
    :parameters (?x - location ?r - rover)
    :duration (= ?duration 1)
    :condition (at start(and (in ?x ?r)
                        (>= (battery ?r) 1)
                ))
    :effect (at end
                (and (hasComunicated ?x)
                (decrease (battery ?r) 1))
    )
)

)