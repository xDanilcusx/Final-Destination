//Stuff that doesn't fit into any category goes here

/obj/item/stock_parts/circuitboard/aicore
	name = T_BOARD("AI core")
	origin_tech = list(TECH_DATA = 4, TECH_BIO = 2)
	board_type = "other"

/obj/item/stock_parts/circuitboard/magnetic_accelerator
	name = T_BOARD("magnetic accelerator")
	build_path = /obj/machinery/magnetic_accelerator
	board_type = "machine"
	req_components = list(
		/obj/item/stock_parts/smes_coil/weak = 1,
		/obj/item/stock_parts/capacitor = 1
	)

/obj/item/stock_parts/circuitboard/mag_table
	name = T_BOARD("magnetic table")
	icon_state = "mainboard"