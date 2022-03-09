(define (problem drone_problem_d1_r1_l5_p5_c5_g5_ct2)
(:domain AidRelief)
(:objects
	drone1 - drone

	wareh - localization
	loc1 - localization
	loc2 - localization
	loc3 - localization
	loc4 - localization
	loc5 - localization

	crate1 - crate
	crate2 - crate
	crate3 - crate
	crate4 - crate
	crate5 - crate

	food - content
	medicine - content

	person1 - person
	person2 - person
	person3 - person
	person4 - person
	person5 - person

	carrier1 - carrier

	num0 - num
	num1 - num
	num2 - num
	num3 - num
	num4 - num
)
(:init
	(drone-in drone1 wareh)
	(empty drone1)

	(carrier-in carrier1 wareh)
	(ocuppancy carrier1 num0)

	(crate-in crate1 wareh)
	(crate-in crate2 wareh)
	(crate-in crate3 wareh)
	(crate-in crate4 wareh)
	(crate-in crate5 wareh)

	(next num0 num1)
	(next num1 num2)
	(next num2 num3)
	(next num3 num4)

	(contains crate1 food)
	(contains crate2 food)
	(contains crate3 medicine)
	(contains crate4 medicine)
	(contains crate5 medicine)

	(person-in person1 loc2)
	(person-in person2 loc1)
	(person-in person3 loc4)
	(person-in person4 loc5)
	(person-in person5 loc5)
)
(:goal (and

	(drone-in drone1 wareh)

	(has person1 medicine)
	(has person3 food)
	(has person3 medicine)
	(has person4 food)
	(has person5 medicine)
	))
)
