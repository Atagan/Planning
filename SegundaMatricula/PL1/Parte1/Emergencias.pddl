 ;Header and description

(define (domain Emergencias)

    ;remove requirements that are not needed
    (:requirements :strips :typing)

    (:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
        almacen - localizacion
        persona caja contenido dron
    )

    ; un-comment following line if constants are needed
    ;(:constants )

    (:predicates ;todo: define predicates here
        (caja-en ?c - caja ?l - localizacion)
        (dron-en ?d - dron ?l - localizacion)
        (persona-en ?p - persona ?l - localizacion)
        (caja-cogida ?c - caja ?d - dron)
        (vacio ?d - dron)
        (cargado ?d - dron)
        (tiene ?p - persona ?cont - contenido)
        (contiene ?c - caja ?cont - contenido)
    )

    (:action coger
        :parameters (?d - dron ?c - caja ?l - localizacion)
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
        :parameters (?d - dron ?l1 ?l2 - localizacion)
        :precondition (and (dron-en ?d ?l1))
        :effect (and (dron-en ?d ?l2)
            (not (dron-en ?d ?l1)))
    )

    (:action entregar
        :parameters (?d - dron ?c - caja ?cont - contenido ?l - localizacion ?p - persona)
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