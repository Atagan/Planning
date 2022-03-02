 ;Header and description

(define (domain AidRelief)

    ;remove requirements that are not needed
    (:requirements :strips :typing)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        person crate content drone localization - object
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
    )

    (:action take
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

    (:action move
        :parameters (?d - drone ?l1 ?l2 - localization)
        :precondition (drone-in ?d ?l1)
        :effect (and (drone-in ?d ?l2)
            (not (drone-in ?d ?l1)))
    )

    (:action deliver
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

    ;define actions here

)