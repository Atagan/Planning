 ;Header and description

(define (domain AidRelief)

    ;remove requirements that are not needed
    (:requirements :strips :typing :durative-actions :fluents)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        person crate content drone carrier num - object 
        warehouse - localization
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (crate-in ?c - crate ?l - localization)
        (drone-in ?d - drone ?l - localization)
        (person-in ?p - person ?l - localization)
        (crate-taken-by ?c - crate ?d - drone)
        (empty ?d - drone)
        (loaded ?d - drone)
        (has ?p - person ?cont - content)
        (contains ?c - crate ?cont - content)
        (next ?n1 ?n2 - num)
        (crate-loaded ?c - crate ?r - carrier)
        (carrier-in ?r - carrier ?l - localization)
        (ocuppancy ?r - carrier ?n - num); TODO: pensar un nombre mejor
    )

    (:functions
        (distance ?l1 ?l2 - localization)
    )

    (:durative-action take-crate
        :parameters (?d - drone ?c - crate ?l - localization)
        :duration (= ?duration 1)
        :condition (and 
            (at start (and 
                (empty ?d)
                (crate-in ?c ?l)
                (drone-in ?d ?l)
                )
            )
        )
        :effect (and 
                (at start (and 
                    (not (crate-in ?c ?l))
                    )
                )
                
                (at end 
                    (and (loaded ?d)
                    (not (empty ?d))
                    (crate-taken-by ?c ?d)
                    )
                )
            )
        )
    
    

    (:durative-action move-drone
        :parameters (?d - drone ?l1 ?l2 - localization)
        :duration (= ?duration (distance ?l1 ?l2))
        :condition  
            (at start (drone-in ?d ?l1))
        :effect (and 
            (at start (not (drone-in ?d ?l1)))
            (at end (drone-in ?d ?l2))
        )
    )
    
    (:durative-action deliver-crate
        :parameters (?d - drone ?c - crate ?cont - content ?l - localization ?p - person)
        :duration (= ?duration 1)
        :condition (and 
            (at start (and 
                (loaded ?d)
                (person-in ?p ?l)
                (contains ?c ?cont)
                (crate-taken-by ?c ?d)
            ))
            (over all (drone-in ?d ?l))
        )
        :effect 
            (at end (and 
                (empty ?d)
                (not (loaded ?d))
                (has ?p ?cont)
                (not (crate-taken-by ?c ?d))
            )
        )
    )
    
    (:durative-action load-carrier
        :parameters (?r - carrier ?d - drone ?c - crate ?l - localization ?n1 ?n2 - num)
        :duration (= ?duration 1)
        :condition (and
            (at start (and 
                (crate-taken-by ?c ?d)
                (ocuppancy ?r ?n1)
                (next ?n1 ?n2)
            ))
            (over all (and
                (drone-in ?d ?l)
                (carrier-in ?r ?l)
            ))
        )
        :effect (and 
            (at start (and 
                (not (crate-in ?c ?l))
                (not (ocuppancy ?r ?n1))
            ))
            (at end (and 
                (crate-loaded ?c ?r)
                (ocuppancy ?r ?n2)
            ))
        )
    )
    
    (:durative-action unload-carrier
        :parameters (?r - carrier ?d - drone ?c - crate ?l - localization ?p - person ?cont - content ?n1 ?n2 - num)
        :duration (= ?duration 1)
        :condition (and 
            (at start (and 
                (crate-loaded ?c ?r)
                (next ?n2 ?n1)
                (ocuppancy ?r ?n1)
            ))
            (over all (and 
                (drone-in ?d ?l)
                (person-in ?p ?l)
                (carrier-in ?r ?l)
                (contains ?c ?cont)
            ))
        )
        :effect 
            (at end (and 
                (not (crate-loaded ?c ?r))
                (not (ocuppancy ?r ?n1))
                (ocuppancy ?r ?n2)
                (crate-in ?c ?l)
            )
        )
    )
    
    
    (:durative-action move-carrier
        :parameters (?d - drone ?r - carrier ?l1 ?l2  - localization)
        :duration (= ?duration (distance ?l1 ?l2))
        :condition (and 
            (at start (and 
            ))
            (over all (and 
                (drone-in ?d ?l1)
                (carrier-in ?r ?l1)
                (empty ?d))
            ))
            (at end (and 
            ))
        )
        :effect (and 
            (at start (and 
                (not (drone-in ?d ?l1))
                (not (carrier-in ?r ?l1)))
            ))
            (at end (and 
                (drone-in ?d ?l2)
                (carrier-in ?r ?l2)
            ))
        )
    )
)