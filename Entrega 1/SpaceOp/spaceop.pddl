;Header and description

(define (domain spaceop)

;remove requirements that are not needed
(:requirements :strips :fluents :typing :negative-preconditions :equality)

(:types satellite direction instrument mode)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (calibrated ?i - instrument)
    (on_board ?i - instrument ?s - satellite)
    (supports ?i - instrument ?m - mode)
    (power_on ?i - instrument)
    (pointing ?s - satellite ?d - direction)
    (maintenance ?s - satellite)
    (have_image ?d - direction ?m - mode)
)


(:functions ;todo: define numeric functions here
)

;define actions here
(:action turn_to
    :parameters (?s - satellite ?d1 ?d2 - direction)
    :precondition (and (not (pointing ?s ?d2))
                       (not (= ?d1 ?d2))    
                )
    :effect (pointing ?s ?d2)
)

(:action switch_on
    :parameters (?i - instrument ?s - satellite)
    :precondition  (and (on_board ?i ?s)
                        (not (power_on ?i))
                    )
    :effect (and (power_on ?i)
                 (not (calibrated ?i))
            )
)

(:action switch_off
    :parameters (?i - instrument ?s - satellite)
    :precondition (and (on_board?i ?s)
                        (power_on ?i))
    :effect (not (power_on ?i))
)

(:action calibrate
    :parameters (?s - satellite ?i - instrument ?d - direction)
    :precondition (and (pointing ?s ?d)
                        (power_on ?i)
                        (on_board ?i ?s))
    :effect (calibrated ?i)
)

(:action perform_maintenance
    :parameters (?s - satellite)
    :precondition (not (maintenance ?s))
    :effect (maintenance ?s)
)

(:action take_image
  :parameters (?s - satellite ?d - direction ?i - instrument ?m - mode)
  :precondition (and (calibrated ?i)
                     (on_board ?i ?s)
                     (supports ?i ?m)
                     (power_on ?i)
                     (pointing ?s ?d)
                     (maintenance ?s))
  :effect (and (have_image ?d ?m) 
               (not (maintenance ?s))
            )
)

)