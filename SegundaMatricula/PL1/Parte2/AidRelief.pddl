 ;Header and description

(define (domain AidRelief)

    ;remove requirements that are not needed
    (:requirements :strips :typing :action-costs)

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
       (total-cost)- number
       (fly-cost ?l1 ?l2 - localization) - number
    )

    (:action take-crate
        :parameters (?d - drone ?c - crate ?l - localization)
        :precondition (and (empty ?d)
            (crate-in ?c ?l)
            (drone-in ?d ?l)
        )
        :effect (and (loaded ?d)
            (not (empty ?d))
            (crate-taken-by ?c ?d)
            (not (crate-in ?c ?l)))
    )

    (:action move-drone
        :parameters (?d - drone ?l1 ?l2 - localization)
        :precondition (and (drone-in ?d ?l1))
        :effect (and (drone-in ?d ?l2)
            (not (drone-in ?d ?l1))
            (increase (total-cost) (fly-cost ?l1 ?l2))
            )
    )

    (:action deliver-crate
        :parameters (?d - drone ?c - crate ?cont - content ?l - localization ?p - person)
        :precondition (and (loaded ?d)
            (drone-in ?d ?l)
            (person-in ?p ?l)
            (contains ?c ?cont)
            (crate-taken-by ?c ?d)
        )
        :effect (and (empty ?d)
            (not (loaded ?d))
            (has ?p ?cont)
            (not (crate-taken-by ?c ?d))
        )
    )

    (:action load-carrier
        :parameters (?r - carrier ?d - drone ?c - crate ?l - localization ?n1 ?n2 - num)
        :precondition (and (crate-taken-by ?c ?d)
                            (drone-in ?d ?l)
                            (carrier-in ?r ?l)
                            (ocuppancy ?r ?n1)
                            (next ?n1 ?n2)
        )
        :effect (and (crate-loaded ?c ?r)
                     (not (crate-in ?c ?l))
                     (not (ocuppancy ?r ?n1))
                     (ocuppancy ?r ?n2)
        )
    )
    
    (:action unload-carrier
        :parameters (?r - carrier ?d - drone ?c - crate ?l - localization ?p - person ?cont - content ?n1 ?n2 - num)
        :precondition (and (drone-in ?d ?l)
                            (crate-loaded ?c ?r)
                            (person-in ?p ?l)
                            (carrier-in ?r ?l)
                            (contains ?c ?cont)
                            (next ?n2 ?n1)
                            (ocuppancy ?r ?n1)
        )
        :effect (and (not (crate-loaded ?c ?r))
                    (not (ocuppancy ?r ?n1))
                    (ocuppancy ?r ?n2)
                    (crate-in ?c ?l)
        )
    )
    
   (:action move-carrier
       :parameters (?d - drone ?r - carrier ?l1 ?l2  - localization)
       :precondition (and (drone-in ?d ?l1)
                          (carrier-in ?r ?l1)
                          (empty ?d))
       :effect (and (drone-in ?d ?l2)
                    (not (drone-in ?d ?l1))
                    (carrier-in ?r ?l2)
                    (not (carrier-in ?r ?l1))
                    (increase (total-cost) (fly-cost ?l1 ?l2)))
   )
   
    


)