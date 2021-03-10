;Header and description

(define (domain Pizzeria)

;remove requirements that are not needed
(:requirements :strips :fluents :durative-actions :timed-initial-literals :typing :conditional-effects :negative-preconditions :duration-inequalities :equality)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    dough plato - comida
    queso peperoni tabasco anchoas pesto anana pollo 
         - ingrediente
    macarrones panAjo alitas nuggets tendies
         - plato
    casa pizzeria - location
    
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (isKneaded ?x - dough)
    (topped ?x - dough)
    (hasTopping ?x - dough ?y - ingrediente)
    (cooked ?x - comida)
    (loaded ?x - comida)
    (delivered ?c - comida ?l - casa)
    (in ?x - location)
    (collected ?c - comida)
)


(:functions ;todo: define numeric functions here
)

;define actions here
(:action kneadDough
    :parameters (?x - dough)
    :precondition (not (isKneaded ?x) )
    :effect (and(isKneaded ?x ))
)

(:action addTopping
    :parameters (?x - dough ?y - ingrediente)
    :precondition (and (isKneaded ?x) (not(topped ?x)))
    :effect  (and (topped ?x ) (hasTopping ?x ?y))
)

(:action bake
    :parameters (?x - dough)
    :precondition (and (isKneaded ?x) (topped ?x) (not (cooked ?x)))
    :effect (cooked ?x)
)

(:action cook
    :parameters (?x - plato)
    :precondition (not (cooked ?x))
    :effect (cooked ?x)
)

(:action load
    :parameters (?x - comida ?l - pizzeria)
    :precondition (and (not (loaded ?x)) (in ?l) (cooked ?x))
    :effect (loaded ?x)
)

(:action go
    :parameters (?l1 - pizzeria ?l2 - casa)
    :precondition (in ?l1)
    :effect (and (in ?l2) (not (in ?l1)))
)

(:action comeBack
    :parameters (?l1 - casa ?l2 - pizzeria)
    :precondition (in ?l1)
    :effect (and (in ?l2) (not (in ?l1)))
)


(:action collectOrder
    :parameters (?c - comida ?l - casa)
    :precondition (and (loaded ?c) (not (collected ?c)) (in ?l) (not (delivered ?c ?l)))
    :effect (collected ?c)
)

(:action deliverOrder
    :parameters (?c - comida ?l - casa)
    :precondition (and (collected ?c) (in ?l) (not (delivered ?c ?l)))
    :effect (delivered ?c ?l)
)

)