(define (problem Pizzeria1) (:domain Pizzeria)
(:objects 
    tienda - pizzeria
    casa1 casa2 casa3 - casa
    pep - peperoni
    ques - queso
    tab - tabasco
    anch - anchoas
    pest - pesto
    pin - anana
    chick - pollo

    mac - macarrones
    pan - panAjo
    ala - alitas
    nug - nuggets
    tend - tendies

    masa1 masa2 masa3 - dough
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (in tienda)
)

(:goal (and
    ;todo: put the goal condition here
    (delivered mac casa1)
    (delivered pan casa2)
    (delivered tend casa3)

    (hasTopping masa1 pep)
    (delivered masa1 casa1)
    
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
