 ;Header and description

(define (domain drone-domain)

    ;remove requirements that are not needed
    (:requirements :strips :typing)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        depo - localizacion
        person crate content drone
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (caja-en ?c - crate ?l - localizacion)
        (dron-en ?d - drone ?l - localizacion)
        (persona-en ?p - person ?l - localizacion)
        (caja-cogida ?c - crate ?d - drone)
        (vacio ?d - drone)
        (cargado ?d - drone)
        (tiene ?p - person ?cont - content)
        (contiene ?c - crate ?cont - content)
    )

    (:action coger
        :parameters (?d - drone ?c - crate ?l - localizacion)
        :precondition (and (vacio ?d)
            (caja-en ?c ?l)
            (dron-en ?d ?l)
        )
        :effect (and (cargado ?d)
            (not (vacio ?d))
            (caja-cogida ?c ?d)
            (not (caja-en ?c ?l)))
    )

    (:action mover
        :parameters (?d - drone ?l1 ?l2 - localizacion)
        :precondition (and (dron-en ?d ?l1))
        :effect (and (dron-en ?d ?l2)
            (not (dron-en ?d ?l1)))
    )

    (:action entregar
        :parameters (?d - drone ?c - crate ?cont - content ?l - localizacion ?p - person)
        :precondition (and (cargado ?d)
            (dron-en ?d ?l)
            (persona-en ?p ?l)
            (contiene ?c ?cont)
            (caja-cogida ?c ?d)
        )
        :effect (and (vacio ?d)
            (not (cargado ?d))
            (tiene ?p ?cont)
            (not (caja-cogida ?c ?d))
        )
    )

    ;define actions here

)