(define (problem spaceop1) (:domain spaceop)
(:objects 
    satellite1 - satellite
    instrument1 - instrument
    star0 DirStar5 phenomena3 DirPhenomenon4 DirPhenomenon6 - direction
    spectrograph3 Mode_thermograph0 - mode
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (on_board instrument1 satellite1)
    (supports instrument1 Mode_thermograph0) 
    (pointing satellite1 star0)
)

(:goal (and
    ;todo: put the goal condition here
        (have_image DirPhenomenon4 Mode_thermograph0)
        (have_image DirStar5 Mode_thermograph0)
        (have_image DirPhenomenon6 Mode_thermograph0)
        )
)

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
