#|Ejercicio 10
a)
modelo: string
año: number
patente: string
combustible: string
rendimiento: number
|#
(define-struct auto [modelo año patente combustible rendimiento])

#|
1)----------------------Constructor: 
----make-auto: String Number String String Number -> Auto

2)----------------------Selector:
----auto-modelo Auto -> string
----auto-año: Auto -> number
----auto-patente: Auto -> string
----auto-combustible: Auto -> string
----auto-rendimiento: Auto -> number

3)----------------------Predicado:
----auto?: Any -> Bool
; Any: cualquier tipo de objeto
|#

(define punto (make-posn 3.14 2.98))
;Ejemplo1
(define Fangio1 (make-auto "Forol" 1943 "FX3-14" "Diesel" 0))
(define Fangio2 (make-auto "Foro2" 1944 "FX3-14" "Diesel" 0))
;(auto-año Fangio)

;Ejemplo2
(define schumadher (make-auto "Jeep" 1978 "JEE-298" "Diesel" 0))

;Ejemplo3
(define miprimo (make-auto "Meriva" 2016 "MP-680" "Nafta" 0))


;define igual-patentamiento, compara la patente de dos autos 
; Auto Auto -> Boolean
;string=? o equal?
(define (igual-patentamiento auto1 auto2) 
  (string=? (auto-patente auto1) (auto-patente auto2)))

(check-expect (igual-patentamiento Fangio1 Fangio2) true)
(check-expect (igual-patentamiento Fangio1 miprimo) false)
(check-expect (igual-patentamiento schumadher miprimo) false)

#|Tarea: realizar el diseño de las siguientes funciones para la estructara auto
1)auto-mas-viejo: dado dos autos determina cual es el mas viejho y lo devuelve
2)auto-clasifica: dado un auto determina si el mismo es familiar, 
de aventura o de carrera utilizando el 
campo modelo y la siguiente tabla

tipo---------------------------------------------------
Familiar: meriva, palio, ford fiesta, ferol-weekend

Aventura: ranger, jeep, f-100, amarok

Carrera: ford-f1, ferrari, lamborghini

|#
(define (auto-mas-viejo auto1 auto2)
  (cond
    [(< (auto-año auto2) (auto-año auto1)) auto1]
    [(< (auto-año auto1) (auto-año auto2)) 
     (auto-modelo auto2)]
    [(= (auto-año auto1) (auto-año auto2)) "Iguales"]))

(auto-mas-viejo Fangio1 Fangio2)
