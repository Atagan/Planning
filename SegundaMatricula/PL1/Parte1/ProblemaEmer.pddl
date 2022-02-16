(define (problem ProblemaEmer) (:domain Emergencias)
(:objects 
    alm - almacen
    l1 - localizacion
    p1 - persona
    d1 - dron
    c1 - caja
    comida medicina - contenido
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (dron-en d1 alm)
    (caja-en c1 alm)
    (persona-en p1 l1)
    (vacio d1)
    (contiene c1 comida)
)

(:goal (and
    ;todo: put the goal condition here
    (tiene p1 comida)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
