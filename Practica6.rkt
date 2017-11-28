;practica 6
#|Lista de numeros es
-'() (empty)
-(cons Numero ListaDeNumeros)


ListaStrings es 
-'() (empty)
-(cons Numero ListaDeNumeros)

|#

;crear listas con el operador make-list para los tipos imagenes estructuras y numeros
(make-list 2 "hola")
(make-list 0 "hola")
;(make-list 100 1)

;cons y empty son los constructores de las listas, tal como la suma y el cero son los constructores de los numeros naturales

;cual es el tipo de make-list



;Naturales
;diseño de datos
;N es
; -0
; -(add1 N)
;interpretacion: N es un numero natural

;Listas
;diseño de datos
;Lista x es:
;- '()
; - (cons x Lista x)
;interpretacion: una lista de x

;----------Naturales-----------------------------|-----------------------Listas---------------------------
;      Constructores                             |        Constructores
;      -0                                        |        -'() (empty)
;      - add1                                    |        -cons
;------------------------------------------------|----------------------------------------------------
;       Predicados                               |         Predicados
;       -zero?                                   |        -empty?
;       -positive?                               |        -cons?
;------------------------------------------------|-------------------------------------------------------
;       Selectores                               |        Selectores
;       -sub1                                    |        -first
;                                                |        -rest


#|
;Tipos/signaturas
;----------Naturales-----------------------------|-----------------------Listas---------------------------
            - 0 : N                              |      -'() : Lista X
            -add1: N -> N                        |      -cons: X lista x -> ListaX
            -zero? N -> Boolean                  |      -empty?: listaX -> boolean
            -positive? N -> boolean              |      -first : ListaX -> X
            -sub1: N -> N                        |      -rest : ListaX -> ListaX

|#





#|(


Definamos por nuestra cuenta la función copiar que se comporta como make-list:

    ; copiar: N String -> Lista-de-Strings 
    ; El propósito de la función copiar es crear una lista de
    ; n copias de una cadena s
     
    
|#

;Así, el cuerpo de la función tendrá una expresión cond con dos cláusulas:

;ListaDeStrings (diseño de datos)
; -'()
; (cons string ListaDeStrings)
;ListaDeStrings es una lista compuesta por strings

;Naturales
;diseño de datos
;N es
; -0
; -(add1 N)
;interpretacion: N es un numero natural

;copiar: Natural strings -> ListaDeStrings
;n : Natural
;s : strings
;recibe un numero natural, un string y devuelve una lista de n copias de s
(define (copiar n s) (cond [(zero? n) '()]
                           [(positive? n) (cons s (copiar (sub1 n) s))]))

(check-expect (copiar 2 "hola") (list "hola" "hola"))
(check-expect (copiar 0 "hola") '())


;Ejercicio 1. Diseñe la función sumanat que toma dos números naturales y sin usar + devuelve un natural que es la suma de ambos. Use el evaluador paso a paso para evaluar (sumanat 3 2).

;sumanat: natural natural -> natural
;suma dos numeros N dados

#| esta no, demora mucho mas
(define (sumanat m n)
  (cond
    [(zero? n) m]
    [(positive? n) (if (zero? (sub1 n)) (add1 m) (sumanat (add1 m) (sub1 n)))]))
|#

;hecho en clase, este es el que va!
(define (sumanat m n)
  (cond
   [(zero? m) n]
   [(positive? m) (sumanat (sub1 m) (add1 n))]))
              

(check-expect (sumanat 0 0) 0)
(check-expect (sumanat 0 1) 1)
(check-expect (sumanat 1 0) 1)
(check-expect (sumanat 1 1) 2)
(check-expect (sumanat 1 3) 4)
(check-expect (sumanat 3 1) 4)
(check-expect (sumanat 3 3) 6)


#|
(check-expect (sumanat2 0 0) 0)
(check-expect (sumanat2 0 1) 1)
(check-expect (sumanat2 1 0) 1)
(check-expect (sumanat2 1 1) 2)
(check-expect (sumanat2 1 3) 4)
(check-expect (sumanat2 3 1) 4)
(check-expect (sumanat2 3 3) 6)
|#

#|

Ejercicio 2. Diseñe la función multiplicar. Esta función debe tomar como entrada dos números naturales y debe multiplicarlos sin usar *. Use el evaluador paso a paso para evaluar (multiplicar 3 2).
|#

;recibe dos numeros naturales
(define (multiplicar m n)
  (cond 
    [(zero? m) 0]
    [(positive? m) (sumanat n (multiplicar (sub1 m) n ))]))

(check-expect (multiplicar 0 0) 0)
(check-expect (multiplicar 0 1) 0)
(check-expect (multiplicar 1 0) 0)
(check-expect (multiplicar 2 2) 4)
(check-expect (multiplicar 1 9) 9)
(check-expect (multiplicar 9 1) 9)
(check-expect (multiplicar 5 5) 25)

#|
Ejercicio 3. Diseñe la función powernat que toma dos números naturales y devuelve el resultado de elevar el primero a la potencia del segundo. Use la función multiplicar definida en el ejercicio anterior. Use el evaluador paso a paso para evaluar (powernat 4 2).
|#

;powernat : natural natural -> natural
(define (powernat m n)
  (cond
    [(zero? n) 1]
    [(positive? n) (multiplicar m (powernat m (sub1 n)))]))


(check-expect (powernat 9 0) 1)


#|
Ejercicio 4. Diseñe la función intervalo, que dado un número natural n, devuelve la lista [1 ,2 ,... ,n]. Para 0 devuelve empty.
|#

;natural -> ListaDeNaturales

(define (intervalo n)
  (cond
    [(zero? n) empty]
    [(positive? n) (cons n (intervalo (sub1 n)))]))

(define (intervalo-crec n)
  (reverse (intervalo n)))

(check-expect (intervalo-crec 7) (list 1 2 3 4 5 6 7))

#|
Ejercicio 5. Diseñe la función factnat que toma un número natural y devuelve su factorial. El factorial de un número natural n se calcula haciendo 1 x 2 x ... x n. Use el evaluador paso a paso para evaluar (factnat 4).
|#

(define (fact n)
  (cond
    [(zero? n) 1]
    [(positive? n) (multiplicar n (fact (sub1 n)))]))

(check-expect (fact 4) 24)
(check-expect (fact 5) 120)
(check-expect (fact 0) 1)
(check-expect (fact 1) 1)


#|
Ejercicio 6. Diseñe la función fibnat que toma un número natural y devuelve el valor correspondiente a la secuencia de Fibonacci para ese valor: fibnat (0) = 1 ,fibnat (1) =1 ,fibnat (n+2) = fibnat (n) + fibnat (n+1). Use el evaluador paso a paso para calcular (fibnat 5).
|#

;fibnat: natural -> natural
;calcula el fibonacci de un n dado
;casos base fib 0 = 1
; fib 1 = 1

(define (fibnat n)
  (cond
    [(zero? n) 1]
    [(equal? n 1) 1]
    [(>= n 2)         (+
                       (fibnat (sub1 n))
                       (fibnat (sub1 (sub1 n))))
     ]))

(check-expect (fibnat 0) 1)
(check-expect (fibnat 1) 1)
(check-expect (fibnat 2) 2)
(check-expect (fibnat 3) 3)
(check-expect (fibnat 4) 5)
(check-expect (fibnat 5) 8)
(check-expect (fibnat 6) 13)
(check-expect (fibnat 7) 21)
