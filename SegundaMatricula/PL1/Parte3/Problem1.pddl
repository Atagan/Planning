(define (problem drone_problem_d2_r2_l3_p3_c3_g3_ct2)
(:domain AidRelief)
(:objects
	drone1 - drone
	drone2 - drone

	wareh - localization
	loc1 - localization
	loc2 - localization
	loc3 - localization

	crate1 - crate
	crate2 - crate
	crate3 - crate

	food - content
	medicine - content

	person1 - person
	person2 - person
	person3 - person

	carrier1 - carrier
	carrier2 - carrier

	num0 - num
	num1 - num
	num2 - num
	num3 - num
	num4 - num
)
(:init
	(drone-in drone1 wareh)
	(empty drone1)
	(drone-in drone2 wareh)
	(empty drone2)

	(carrier-in carrier1 wareh)
	(ocuppancy carrier1 num0)
	(carrier-in carrier2 wareh)
	(ocuppancy carrier2 num0)

	(crate-in crate1 wareh)
	(crate-in crate2 wareh)
	(crate-in crate3 wareh)

	(next num0 num1)
	(next num1 num2)
	(next num2 num3)
	(next num3 num4)

	(contains crate1 food)
	(contains crate2 food)
	(contains crate3 medicine)

	(person-in person1 loc1)
	(person-in person2 loc1)
	(person-in person3 loc1)

	(=(distance loc1 wareh) 28)
	(=(distance wareh loc1) 28)
	(=(distance loc2 wareh) 123)
	(=(distance wareh loc2) 123)
	(=(distance loc3 wareh) 161)
	(=(distance wareh loc3) 161)
	(=(distance loc1 loc1) 1)
	(=(distance loc1 loc2) 96)
	(=(distance loc1 loc3) 134)
	(=(distance loc2 loc1) 96)
	(=(distance loc2 loc2) 1)
	(=(distance loc2 loc3) 42)
	(=(distance loc3 loc1) 134)
	(=(distance loc3 loc2) 42)
	(=(distance loc3 loc3) 1)
)
(:goal (and

	(drone-in drone1 wareh)

	(drone-in drone2 wareh)

	(has person2 food)
	(has person2 medicine)
	(has person3 food)
	))
)
