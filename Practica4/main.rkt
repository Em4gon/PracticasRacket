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

;(auto-mas-viejo Fangio1 Fangio2)


#|make-posn, llamado constructor. Es el que nos permite crear objetos de la clase posn.

posn-x y posn-y, llamados selectores. Nos permiten acceder a cada uno de los campos de la estructura.

posn?, llamado el predicado de la estructura. Dado un objeto cualquiera, devuelve #true si su argumento es un objeto de tipo posn.|#
(define p (make-posn 3 4))
(define q (make-posn -2 0.5))
(define pta (make-posn 10 20))
(define ptb (make-posn 9 25))

;(posn-x p)
;(- (posn-y p) (posn-y q))
;(posn-y (make-posn (posn-x p) (posn-x q)))

;ejercicio 3
(define (dist-origen punto) (sqrt (floor [abs (+ (sqr (posn-x punto)) (sqr (posn-y punto)) )]) ))

;(dist-origen p)

;Diseñe una función distancia, que dado dos puntos en el plano calcule la distancia entre ellos. Extienda la definción para que, en caso que alguno de los argumentos no sea de tipo posn, muestre el mensaje "Tipos incorrectos para la función."

(define (distancia pt1 pt2)
  (if [and (posn? pt1) (posn? pt2)]
      {abs [- (dist-origen pt1) (dist-origen pt2)]}
            "Tipos incorrectos para la funcion"))

(distancia pta ptb)
      
