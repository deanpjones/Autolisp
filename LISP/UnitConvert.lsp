;Pressure Units
;6.895 kPa = 1.0 psi = 16 oz./in2 = 27.7" W.C.(in) = 0.06895 bar = 69 mbar

;-----------------------------------------------------------
;ERCB, SWEET < 10 ppm < SOUR
;ERCB, SWEET < 0.01 mol/kmol < SOUR
;ERCB, SWEET < 0.001 % < SOUR

;1000 ppm = 1 mol/kmol
;1 ppm = 0.001 mol/kmol

;10 % = 1 mol/kmol
;1 % = 0.1 mol/kmol

;10,000 ppm = 1 %
;1 ppm = 0.0001 %
;-----------------------------------------------------------

;mVal = 1.0, mVal = '(10.0 20.0 30.0)
;1.0 HP = 0.74569987 kW (kilowatt)(Piping Guide)
;1.0 psi = 6.8947572 kPa (* mVal 6.89475720)
;1.0 psi = 16oz (Ounces per square inch) (* (/ mVal 16.00000000) 6.89475720)
;(strcat (rtos (* (/ mVal 16.00000000) 6.89475720) 2 4) " kPag")

(defun UnitConvert (mVal / )

;6 mcf(1000 cubic feet of gas) = 1 BOE (barrel of oil equivalent)

;Convert volume "Barrel(bbl) Petroleum" to "Cubic Meters(m^3)"
;(setq mVal 200)
(strcat "" (rtos mVal) " BBL = " (rtos (cvunit mVal "bbl" "meter^3")) " m3")
;Convert volume "Cubic Meters(m^3)" to "Barrel(bbl) Petroleum"
(strcat "" (rtos mVal) " m3 = " (rtos (cvunit mVal "meter^3" "bbl")) " BBL")

;Conver volume "Gallon(gal)(US)" to "Cubic Meters(m^3)"
(cvunit mVal "gal" "meter^3")

;Convert temperature "Celsius" to "Fahrenheit"
(cvunit mVal "celsius" "fahrenheit")

(cvunit mVal "in" "mm")
(cvunit mVal "ft" "mm")

(princ)
)