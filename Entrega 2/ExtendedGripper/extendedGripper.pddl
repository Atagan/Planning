;Header and description

(define (domain domain_name)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    room
    ball 
    gripper
)
(:predicates (at-robby ?r - room)
            (at-ball ?b -ball ?r -room)
            (free ?g - gripper)
            (carry ?g - gripper ?b -ball)
            (dur-ball ?b - ball)
)
(:functions
    (dur-ball ?b - ball)
)

(:action move
    :parameters (?x ?y - room)
    :precondition (at-robby ?x)
    :effect (and (at-robby ?y)
                (not (at-robby ?x))
            )
)
(:durative-action pick-up
    :parameters (?ball - ball ?room - room ?gripper - gripper)
    :duration (= ?duration (dur-ball ?ball))
    :condition (and (at start (at-ball ?ball ?room))
                    (at start (at-robby ?room))
                    (at start (free ?gripper)))
                
    :effect (and (at end (carry ?gripper ?ball))
                 (at start (not (at-ball ?ball ?room))) 
                 (at start (not (free ?gripper)))
            )
)
(:durative-action drop
    :parameters (?ball - ball ?room - room ?gripper - gripper)
    :duration (= ?duration (dur-ball ?ball))
    :condition (and (at start (carry ?gripper ?ball))
                    (at start (at-robby ?room))
                    )
    :effect (and (at end (at-ball ?ball ?room))
                 (at end (free ?gripper))
                 (at start (not (carry ?gripper ?ball)))
            )
)
)