(define (problem problem_name) (:domain domain_name)
(:objects 
    kitchen living bathroom - room
    Z1 Z2 - ball
    left right - gripper
)

(:init
    ;todo: put the initial state's facts and numeric values here
    
)

(:goal (and
    ;todo: put the goal condition here

))
(:constraints (and
    (at end (at-robby living))
    (sometime (at-robby bathroom))
))
;un-comment the following line if metric is needed
(:metric minimize (total-time))
)
