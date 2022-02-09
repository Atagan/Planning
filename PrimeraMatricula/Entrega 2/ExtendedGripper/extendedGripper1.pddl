(define (problem extendedGripper1) (:domain extendedGripper)
(:objects 
    kitchen living bathroom - room
    Z1 Z2 - ball
    left right - gripper
)

(:init
    ;todo: put the initial state's facts and numeric values here
 	(= (dur-ball Z1) 3)
 	(= (dur-ball Z2) 4)
    (at-robby kitchen)
    (free left)         
    (free right)
    (at-ball Z1 kitchen)
    (at-ball Z2 kitchen)
)

(:goal (and
    ;todo: put the goal condition here
        (at-ball Z1 living)
        (at-ball Z2 living)
))
(:constraints (and
    (at end (at-robby living))
    ;(sometime (at-robby bathroom))
))
;un-comment the following line if metric is needed
(:metric minimize (total-time))
)
