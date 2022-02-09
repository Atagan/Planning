(define (problem spaceop2) (:domain spaceop)
(:objects 
    satellite1 - satellite
    instrument1 - instrument
    star0 DirStar5 phenomenon3 DirPhenomenon4 DirPhenomenon6 - direction
    spectrograph2 Mode_thermograph0 - mode
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (on_board instrument1 satellite1)
    (supports instrument1 Mode_thermograph0) 
    (supports instrument1 spectrograph2)
    (pointing satellite1 star0)
)

(:goal (have_image phenomenon3 spectrograph2)
    ;todo: put the goal condition here
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
