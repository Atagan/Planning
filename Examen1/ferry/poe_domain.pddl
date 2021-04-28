;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; typed version of the ferry domain
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain ferry)
  (:requirements :strips :equality :typing :negative-preconditions :fluents :durative-actions)
  (:types auto place ferry)
  (:predicates (at-ferry ?f - ferry ?l - place)
               (at ?x - auto  ?y - place)
               (empty-ferry ?f)
               (on ?x - auto ?f - ferry)
               (permiso ?f - ferry ?x - place)
       )
  (:functions
         (carga_actual ?f - ferry)
         (capacidad ?f - ferry)
         (boarding_time)
         (distance ?x ?y - place)
         (speed ?f - ferry)
  )

  (:durative-action board
      :parameters (?x - auto ?y - place ?f - ferry)
      :duration (= ?duration (boarding_time))
      :condition (and 
          (at start (and (at ?x ?y) (at-ferry ?f ?y) (not(>= (carga_actual ?f) (capacidad ?f)))))
      )
      :effect (and 
          (at start (and (on ?x ?f) (not (empty-ferry ?f)) (increase (carga_actual ?f) 1)
          ))
          (at end (and (on ?x ?f)
          ))
      )
  )

  (:durative-action sail
      :parameters (?x ?y - place ?f - ferry)
      :duration (= ?duration (/ (distance ?x ?y) (speed ?f)))
      :condition (and 
          (at start (and (at-ferry ?f ?x) (not (= ?x ?y)) (permiso ?f ?x)
          ))
      )
      :effect (and 
          (at start (and (not (at-ferry ?f ?x))
          ))
          (at end (and (at-ferry ?f ?x)
          ))
      )
  )
       
  (:action debark
         :parameters (?x - auto ?y - place ?f - ferry)
         :precondition (and (on ?x ?f)(at-ferry ?f ?y))
         :effect (and (not (on ?x ?f))
                           (at ?x ?y)
                           (decrease (carga_actual ?f) 1)
                           (empty-ferry ?f)
              )
       )

  (:action controlPuerto
      :parameters (?f - ferry ?x - place)
      :precondition (and (not (permiso ?f ?x)) (at-ferry ?f  ?x) )
      :effect (and (permiso ?f ?x))
  )
  
)