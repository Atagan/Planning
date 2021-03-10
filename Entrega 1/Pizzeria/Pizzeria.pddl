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
    location
    
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (isKneaded ?x - dough)
    (topped ?x - dough)
    (hasTopping ?x - dough ?y - ingrediente)
    (baked ?x - dough)
    (cooked ?x - plato)
    (loaded ?x - comida)
    (inStore)
)


(:functions ;todo: define numeric functions here
)

;define actions here
(:action kneadDough
    :parameters (?x - dough)
    :precondition (not (isKneaded ?x) )
    :effect (and(isKneaded ?x ) (topped ?x))
)

(:action addTopping
    :parameters (?x - dough ?y - ingrediente)
    :precondition (and (isKneaded ?x) (not(topped ?x)))
    :effect  (and (topped ?x ) (hasTopping ?x ?y))
)

(:action bake
    :parameters (?x - dough)
    :precondition (and (isKneaded ?x) (topped ?x) (not (baked ?x)))
    :effect (baked ?x)
)

(:action cook
    :parameters (?x - plato)
    :precondition (not (cooked ?x))
    :effect (cooked ?x)
)

(:action load
    :parameters (?x - comida)
    :precondition (and(not (loaded ?x)) (inStore))
    :effect (loaded ?x)
)

(:action move
    :parameters ()
    :precondition (and )
    :effect (and )
)

)