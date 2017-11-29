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

#|
Ejercicio 7. Diseñe una función list-fibonacci que dado un número n devuelve una lista con los primeros n+1 valores de la serie de fibonacci, ordenados de mayor a menor. Es decir, (list-fibonacci n) = (list (fib n) (fib (- n 1)) ... (fib 0))
|#

(define (intervalo-fib n)
  (cond
    [(zero? n) (list 1)]
    [(positive? n) (cons (fibnat n) (intervalo-fib (sub1 n)))]))


(check-expect (intervalo-fib 4)
              (list 5 3 2 1 1))
(check-expect (intervalo-fib 0)
              (list 1))


#|
Ejercicio 9. Diseñe una función multiplos que tome dos naturales n y m, y devuelva una lista con los primeros n múltiplos positivos de m, en orden inverso: m * n ,m * (n-1) ,... ,m * 2 ,m.

Ejemplo:

    (multiplos 4 7) = (list 28 21 14 7)
    (multiplos 0 11) = '()
|#

;multiplos: natural natural -> lista de naturales

(define (multiplos c n)
  (cond
    [(zero? c) empty]
    [else
     (cons (* c n) (multiplos (sub1 c) n))]))

(check-expect (multiplos 4 7) (list 28 21 14 7))
(check-expect (multiplos 0 11) empty)
#|
Ejercicio 10. Diseñe una función circulos que tome un número natural m y devuelva una imagen de 200 x 200 con m círculos azules centrados en el centro de la imagen y radios: m2 , (m-1)2, ... , 12.
|#
;circulos: N image-> image
;dibuja un circulo azul concentrico para un natural dado
;el natural va a servir apra calcular el radio pero tambien para contar las imagenes

(define (dibujo-circulo r)
  (circle r "outline" "blue"))
(define ANCHO 200)
(define ALTO 200)


(define (circulos m img)
  (cond
    [(zero? m) img]
    [(positive? m) (circulos (sub1 m)
                             (place-image (dibujo-circulo (fibnat m))
                              (/ ANCHO 2)
                              (/ ALTO 2)
                              img))]))

(circulos 14 (empty-scene ANCHO ALTO))

#|
Ejercicio 11. Diseñe una función cuadrados que tome un número natural m y un ángulo ang y devuelva una imagen de 200 x 200 con m cuadrados azules centrados en el centro de la imagen. Los lados de los cuadrados serán lados: m2 , (m-1)2, ... , 12. El ángulo ang indica la rotación del cuadrado de mayor dimensión. El ángulo que corresponde al cuadrado de lado (m-1)2 debe ser 20 grados más que el que le corresponde al cuadrado de lado m2, para cualquier valor de m mayor o igual a 1.
|#
(define (un-cuadrado m ang)
  (rotate ang (square m "outline" "blue")))

(define FONDITO (empty-scene ANCHO ALTO))
;cuadrados: natural natural -> imagen

(define (cuadrados m ang img)
  (cond
    [(zero? m) img]
    [(positive? m) (cuadrados (sub1 m) (+ 20 ang)
                              (place-image (un-cuadrado (sqr m) (+ 20 ang))
                                           (/ ANCHO 2)
                                           (/ ALTO 2)
                                           img))]))

(cuadrados 10 20 FONDITO)



#|
Ejercicio 12. Una persona solicita un préstamo a una entidad bancaria y se compromete a devolver el importe total del préstamo más intereses en n cuotas mensuales crecientes, con una tasa de interés del i% anual. La cuota j, para cada valor de j en {1, ..., n}, se calcula sumando dos valores:

    la parte correspondiente a la devolución del préstamo, que se calcula así: total/n;

    la parte correspondiente a los intereses de la cuota, que se calcula así: (total/n) * (i/ (100*12)) * j;

Diseñe una función cuotas que dado un importe de un préstamo, total, un valor correspondiente al número de cuotas, n, y una tasa de interés, i, devuelva una lista con las cuotas a pagar ordenadas de forma creciente. Por ejemplo:

    (check-expect (cuotas 10000 0 18) '())
    (check-expect (cuotas 10000 1 12) (list 10100))
    (check-expect (cuotas 30000 3 12) (list 10100 10200 10300))
    (check-expect (cuotas 100000 4 18) (list 25375 25750 26125 26500))
|#

;cuotas: total n i -> ListaDeNumeros
;total, n, i : numbers
;total: monto a pagar
;n: numero de cuotas
;i: interes

;dato aparte        siendo j la cuota que se esta pagando      j -> (total/n) * (i/ (100*12)) * j
;(define j 0)

#;(ESTA NO ANDA-----------------------------------------------------------
   define (quotas total n i
                )
  (cond
    [(zero? n) empty]
    [(positive? n)
     (cons (+ (/ total n) (* (/ total n) (/ i (* 100 12)) (+ j 1))) (quotas (* (+ 2 j) (/ total n)) (sub1 n) i))])-------------------------------------------------------------)

(define (cuotas total n i j )
  (cond
    [(equal? j n) empty]
    [(zero? n) empty]
    [(positive? n)
     (cons (+ (/ total n) (* (/ total n) (/ i (* 100 12)) (+ j 1)))
           (cuotas total n i (add1 j)))]))

 (cuotas 10000 0 18 0)
  (cuotas 30000 3 12 0)
(cuotas 10000 1 12 0)
(cuotas 100000 4 18 0)
"Aca termina el ejercicio 12"
"---------------------------------"
;----------------------------------------

#|
Ejercicio 13. Según la profesora de probabilidad y estadística, al tirar muchas veces un dado -si este no está cargado- la frecuencia con la que ocurre cada número tiende a ser la misma. Es decir, si tiramos un dado seis millones de veces y anotamos los resultados, es de esperar que cada número del 1 al 6 aparezca aproximadamente un millón de veces.

Como no todos los dados tienen 6 caras, comenzamos definiendo una constante para este valor:

    (define CARAS 6)

    Diseñe una función simular-dado, que reciba un número natural n y devuelva una lista con n números aleatorios entre 1 y CARAS.
|#

(define CARAS 6)

;simular-dado: number -> ListaDeNumeros
(define (random-acotado inf sup)
         (let ( [rand (random sup)])
              (if
               (and (< rand sup) (> rand inf))
               rand ;si esta en el intervalo, devuelve ese valor
               (let
                   ( [rand (random sup)])
                 (cond
                   [(and (< rand sup) (> rand inf)) rand]
                   [else (random-acotado inf sup)]))
               )  ;if 
           ); let
)

(define (simular-dado n)
  (cond
    [(zero? n) empty]
    [else
     (cons (random-acotado 0 (+ 1 CARAS)) (simular-dado (sub1 n)))]))

(simular-dado 9)

#|
Considere ahora las siguientes definiciones:
|#
    (define MAX 60000)
    (define EXPERIMENTO (simular-dado MAX))
    (define VALORES (intervalo CARAS))
#|
La lista EXPERIMENTO tendrá MAX números aleatorios entre 1 y CARAS. La lista VALORES usa un ejercicio previo, y es simplemente (list 1 2 ... CARAS).

    Diseñe la función frecuencia, que dado un número natural n y una lista de naturales, devuelve la cantidad de veces que n aparece en la lista. Es decir, su frecuencia absoluta.
|#

;frecuencia: natural ListaDeNumeros -> number


;(define (frecuencia n lista)
 ; (filter (equal? n) lista))

(define (frecuencia n lista)
  (cond
    [(empty? lista) 0]
    [else (if (equal? n (first lista))
              (+ 1 (frecuencia n (rest lista))) (frecuencia n (rest lista)))]))


#|
Utilizando esta función, podemos calcular la frecuencia relativa de un valor en una lista. Esto es, la proporción de veces que aparece:
|#
    (define (frecuencia-relativa n l) (/  (frecuencia n l) (length l)))

;La función frec-rel-exp nos devuelve la frecuencia relativa de un valor en nuestro EXPERIMENTO:

    (define (frec-rel-exp n) (frecuencia-relativa n EXPERIMENTO))

    (define FRECUENCIAS-RELATIVAS (map frec-rel-exp VALORES))

;PREGUNTAS
;LA FUNCION FRECUENCIA SE PUEDE REALIZAR CON FILTER?
;EN EL EJ 12 SE PUEDE HACER LA FUNCION SIN USAR J?
;ejercicio 8
