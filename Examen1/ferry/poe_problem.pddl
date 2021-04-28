(define (problem ferry1) (:domain ferry)
(:objects 
       Baleria GNL - ferry
       Marsella Rotterdam Sicilia - place
       Seat1 Seat2 BMW - auto
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (at-ferry Baleria Marsella)
    (at-ferry GNL Marsella)

    (at Seat1  Marsella)
    (at Seat2 Marsella)
    (at BMW Sicilia)
 
 	(= (capacidad Baleria) 3)
 	(= (capacidad GNL) 3)
 	(= (speed Baleria) 10)
 	(= (speed GNL) 10)
 	(= (distance Marsella Rotterdam) 10)
 	(= (distance Marsella Sicilia) 20)
 	(= (distance Rotterdam Sicilia) 30)
  	(= (distance Rotterdam Marsella) 10)
 	(= (distance Sicilia Marsella) 20)
 	(= (distance Sicilia Rotterdam) 30)
 	(= (boarding_time) 2)
)

(:goal (and
    ;todo: put the goal condition here
    (at Seat1 Rotterdam)
    (at Seat2 Marsella)
    (at BMW Sicilia)
))

(:constraints (and
       (sometime(at-ferry GNL Sicilia)) 
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
