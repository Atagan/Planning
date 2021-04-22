(define (problem extendedPizzeria1) (:domain extendedPizzeria)
(:objects 
    pizzeria - local
    repsol - gasStation
    casa1 casa2  - house
    lasagna macarrones - dish
    pizza1 - pizza
    vespa - moto
)

(:init

    (= (cantidad_gasolina vespa) 180) ; in liters 
    (= (gasolina_requerida pizzeria casa1) 20) ; in liters
    (= (gasolina_requerida pizzeria casa2) 25)
    ...
   
    (= (distancia pizzeria casa1) 2) ; in kms
    (= (distancia pizzeria casa2) 3)
    ...
    

    (= (dur_Knead) 3) ; in min
    (= (dur_addTop) 1) ; in min
    (= (dur_cook lasagna) 40) ; in min
    (= (dur_cook macarrones) 35) ; in min
    (= (dur_bake) 15) ; in min
    (= (dur_collect) 1) ; in min
    (= (dur_deliver) 1) ; in min
    ...
    
    (= (velocidad vespa) 35) ; in km/h 
    ...    
    (= (umbral_gasolina) 20) ; refuel the motorcycle when the tank has a capacity of 20 liters or below

    (at pizzeria vespa) 

    (= (capacidad_moto vespa) 3) 
    (= (carga_actual vespa) 0) 

)
(:goal 
(and
    (entregado pizza1 casa1) 
    ...
))

(:metric minimize (total-time)) 
)