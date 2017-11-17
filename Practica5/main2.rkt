;--------------------------------------------------------------------

;ejemplo con sqr, funcionamiento de map

(define lista1 (list 2 4 5 10))

(define (cuadrados l)
 	(cond
	[(empty? l) empty]
 	[(cons? l)
	(cons (sqr (first l)) (cuadrados (rest l)))]))


(define cuadradosmap (map sqr lista1))

(check-expect (equal? (cuadrados lista1) cuadradosmap) #t)

;Ejercicio 20. Diseñe una función distancias que tome una lista de puntos del plano y devuelva una lista con la distancia al origen de cada uno.

(define (distanciab x)
  (sqrt (+ (sqr (posn-x x)) (sqr (posn-y x)))))

(check-expect (map distanciab (list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))) (list 5 4 13))

;Ejercicio 21. Diseñe una función anchos que tome una lista de imágenes y devuelva una lista con el ancho de cada una.

(check-expect (map image-width  
    (list (circle 30 "solid" "red") (rectangle 10 30 "outline" "blue")))
     (list 60 10))

#|
Uso de map: probar en la linea de comando interacciones que sucede con la aplicacion de las siguientes expreciones.
Diseñe luego funciones para cadauna de ellas.

a) (map empty? (list '() 5 2 '() '()))
b) (map sin (list 0 pi 1 (* 2 pi)))
c) (map round (list 12.5 1.1 3.14 2.98 3.21 0.0 14.01 88.99 99.88 0.001 0.5555556 ))
d) (map zero? (list 1 2 0 1 0 0 5 -1))
e) (map number->string (list 1 5 0 -1 3.14 2398 9.81))
f) (map dibuja-circulos (list 10 50 12 11 100 1))
g) (map random (list 3 10 2 100 14 50))
|#

(check-expect 
     (map empty? (list '() 5 2 '() '())) 
     (list true false false true true))

(check-expect
        (map round (list 12.5 1.1 3.14 2.98 3.21 0.0 14.01 88.99 99.88 0.001 0.5555555555555555555 0.00000004 ))
        (list 12 1 3 3 3 0 14 89 100 0 1 0))

(check-expect (map zero? (list 1 2 0 1 0 0 5 -1)) 
              (list false false true false true true false false))
;====================================================================================
(define (esempty? l)
  (cond
    [(empty? l) empty]
    [else
      (cons (empty? (first l)) (esempty? (rest l)))]))

(check-expect
 (esempty? (list '() 5 2 '() '()))
 (map empty? (list '() 5 2 '() '())))
 (check-expect 
 (esempty? '())
(map empty? '()))
;==================================================================================
(define (eszero? l)
  (cond
    [(empty? l) empty]
    [else
     (cons (zero? (first l)) (eszero? (rest l)))]))
  
(check-expect 
 (eszero?
  (list 1 2 0 1 0 0 5 -1))
(map zero? (list 1 2 0 1 0 0 5 -1)))
  ;====================================================================================

(define (lista-number-string l)
  (cond
    [(empty? l) empty]
    [else
     (cons (number->string (first l)) (lista-number-string (rest l)))]))

(check-expect (lista-number-string (list 1 5 0 -1 3.14 2398 9.81))
              (map number->string (list 1 5 0 -1 3.14 2398 9.81)))

;=====================================================================
(list (make-posn 3 4) (make-posn 0 4) (make-posn 12 5))

;Filter P list) -> lista que cumpla con predicado p


;=========================================================================


;Ejercicio 5. Diseñe una función sumcuad que dada una lista de números devuelve la suma de sus cuadrados. Para la lista vacía, devuelve 0.

;sumcuado
;lista numeros; cons


#;(
Diseño de datos!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

ListaNum es
;- empty ('())
;-(cons Number ListaNum)

;Interpretacion:
ListadeNum es una lista de numbero enteros

   )

;sumCuad: ListaNum -> Number
;Declaracion de proposito: dado una lista de numberos, sumcuad calcula la sumade la misma

#;(
   Ejemplos
   (sumCuad empty) = 0
   (sumCuad (list 1 2 3)) = 14
   (sumCuad (list 4)) = 16
   )

(define (sumCuad l)
  (cond
    [(empty? l) 0]
    [else
     (+ (sqr (first l)) (sumCuad (rest l)))]))

    (check-expect (sumCuad empty) 0)
(check-expect (sumCuad (list 1 2 3)) 14)
(check-expect (sumCuad (list 4)) 16)


(define (mf-sumCuad l) (foldr + 0 (map sqr l)))
(check-expect  (mf-sumCuad empty) 0)
(check-expect (mf-sumCuad (list 1 2 3)) 14)
(check-expect (mf-sumCuad (list 4)) 16)

#| variantes para practica
----suma de las raices de los elementos de una lista
----producto de los cuadrados de los elemmentos de una nota
|#

;TIPO!!!!! Sumaraices: listanumb -> number
;----recibe una lista de numeros y devuelve el la suma de las raices de sus elementos
(define (Sumaraices l)
  (cond
    [(empty? l) 0]
    [else
     (+ (sqrt (first l)) (Sumaraices (rest l)))]))

(check-expect (Sumaraices (list 1 4 9)) 6)
(check-expect (Sumaraices empty) 0)
(check-expect (Sumaraices (list 100)) 10)


;CON FOLD Y MAP
(define (mf-Sumaraices l) (foldr + 0 (map sqrt l)))

(check-expect (mf-Sumaraices (list 1 4 9)) 6)
(check-expect (mf-Sumaraices empty) 0)
(check-expect (mf-Sumaraices (list 100)) 10)

;Multiplocuad: listanumb -> number    (tipo)
;----recibe una lista de numeros y devuelve el producto del cuadrado de sus elementos

(define (Multiplocuad l)
  (cond
    [(empty? l) 1]
    [else
     (* (sqr (first l)) (Multiplocuad (rest l)))]))

(check-expect (Multiplocuad (list 1 2 3)) 36)
(check-expect (Multiplocuad empty) 1)
(check-expect (Multiplocuad (list 100)) 10000)


;CON FOLD Y MAP
(define (mf-Multiplocuad l) (foldr * 1 (map sqr l)))

(check-expect (mf-Multiplocuad (list 1 2 3)) 36)
(check-expect (mf-Multiplocuad empty) 1)
(check-expect (mf-Multiplocuad (list 100)) 10000)

#;(
   Ejercicio 6. Diseñe la función sumdist, que dada una lista l de estructuras posn, devuelve la suma de las distancias al origen de cada elemento de l. Por ejemplo:
          
          (check-expect (sumdist (list (make-posn 3 4) (make-posn 0 3)))
                  8)
   )


#|
Diseño de datos
ListaCoord es
-empty ('())
-(cons posn ListaCoord)

;interpretacion: lista coord es una lista de puntos en el plano. utilizando la estreuctura posn para representar un punto

;TIPO
Sundist

listaCoord -> number

;descripcion
declaracion de proposito: calcula la suma de las distancias al origen de los puntos en la lista
|#

;distancia: posn -> number
(define (distancia p)
  (sqrt (+ (sqr (posn-x p)) (sqr (posn-y p))))) 

;b) map foldr en linea


(define (mf-sumdist l)  (foldr + 0 (map distancia l)))



(check-expect (mf-sumdist (list (make-posn 3 4) (make-posn 0 3)))
                  8)
(check-expect (mf-sumdist empty) 0)
(check-expect (mf-sumdist (list (make-posn 0 25) )) 25)

;a) sin map y foldr
(define (sumdist l)
  (cond
    [(empty? l) 0]
    [else
     (+ (distancia (first l)) (sumdist (rest l)))]))

(check-expect (sumdist (list (make-posn 3 4) (make-posn 0 3)))
                  8)
(check-expect (sumdist empty) 0)
(check-expect (sumdist (list (make-posn 0 25) )) 25)

;c) map-fold por partes
;TIPO: list-distancia: listacoord -> listanum
(define (list-distancia l)
  (map distancia l))

;list-suma: listnum->num

(define (list-suma l)
  (foldr + 0 l))

(define
  (mf-p-sumdist l)
  (list-suma (list-distancia l)))

(check-expect (mf-p-sumdist (list (make-posn 3 4) (make-posn 0 3)))
                  8)
(check-expect (mf-p-sumdist empty) 0)
(check-expect (mf-p-sumdist (list (make-posn 0 25) )) 25)



;========================ejercicio 7

#|
Ejercicio 7. Diseñe una función multPos, que dada una lista de números, multiplique los números positivos de l.

    (check-expect (multPos (list 3 -2 4 0 1 -5))
                  12)

|#

;multiPos: ListaNum -> Num
;declaracion: calcula el producto de los elementos postivos de la lista
