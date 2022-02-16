(define (domain blocks)
  (:requirements :strips :typing) 
  (:types block)
  (:predicates 
         (on ?x ?y - block)
         (ontable ?x - block)
         (clear ?x - block)
         (handempty)
         (holding ?x - block)
         )
         
  (:action pick-up ;coje x de la mesa
       :parameters (?x - block)
       :precondition (and (clear ?x) (ontable ?x) (handempty))
       :effect (and (not (ontable ?x))
                    (not (clear ?x))
                    (not (handempty))
                    (holding ?x))
   )
  (:action unstack;quita x de y 
       :parameters (?x ?y - block)
       :precondition (and (on ?x ?y) (clear ?x) (handempty))
       :effect (and (holding ?x)
                    (clear ?y)
                    (not (clear ?x))
                    (not (handempty))
                    (not (on ?x ?y)))
   )  
  (:action stack ;pone x sobre y
       :parameters (?x ?y - block)
       :precondition (and (clear ?y) (holding ?x))
       :effect (and (handempty)
                    (not (clear ?y))
                    (clear ?x)
                    (on ?x ?y)
                    (not (holding ?x))
       )
   )
  (:action put-down ;pone x en la mesa
       :parameters (?x - block)
       :precondition (holding ?x)
       :effect (and (ontable ?x)
                    (not (holding ?x))
                    (handempty)
                    (clear ?x)
                )
   )  
)