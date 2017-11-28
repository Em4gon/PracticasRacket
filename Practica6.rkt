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
(make-list 100 1)

;cons y empty son los constructores de las listas, tal como la suma y el cero son los constructores de los numeros naturales

;cual es el tipo de make-list
#|(


Definamos por nuestra cuenta la función copiar que se comporta como make-list:

    ; copiar: N String -> Lista-de-Strings 
    ; El propósito de la función copiar es crear una lista de
    ; n copias de una cadena s
     
    (check-expect (copiar 2 "hola") (list "hola" "hola"))
    (check-expect (copiar 0 "hola") '())

|#

;Así, el cuerpo de la función tendrá una expresión cond con dos cláusulas:

(define (copiar n s) (cond [(zero? n) '()]
                           [(positive? n) (cons s (copiar (sub1 n) s))]))


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
