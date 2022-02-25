(define (problem drone_problem_d1_r0_l1_p1_c2_g2_ct2)
(:domain drone-domain)
(:objects
	drone1 - dron
	almacen - localizacion
	loc1 - localizacion
	crate1 - caja
	crate2 - caja
	food - contenido
	medicine - contenido
	person1 - persona
	comida medicina - contenido
)
(:init
	(dron-en drone1 almacen)
	(vacio drone1)
	(caja-en crate1 almacen)
	(caja-en crate2 almacen)
	(contiene crate1 food)
	(contiene crate2 medicine)
)
(:goal (and

	(dron-en drone1 almacen)
	(tiene person1 food)
	(tiene person1 medicine)
	))
)
