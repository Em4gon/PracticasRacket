(require picturing-programs) ;paquete del cual se usaran un par de funciones


;GROSORDECIRCULOS constante que afecta al tamaño de los circulos, las estrellas y los triangulos
(define GROSORDECIRCULOS 25)


;ColorAzar: la funcion no recibe ningun dato y genera un color aleatorio de tono verde-azul, no esta definida como constante para asi poder generar colores distintos cuando se la llame
(define (ColorAzar a)  (make-color (random 55) (random 255) (random 255)))

;Circulo: funcion, recibe un numero que se multiplicara por la constante GROSORDECIRCULOS y usa la funcion ColorAzar
(define (Circulo r) (circle (* GROSORDECIRCULOS r) "solid"
                            (ColorAzar 0)))

;COMBINACIONDECIRCULOS: constante, ubica 25 circulos uno abajo del otro
(define FONDOCIRCULOS
  (underlay/align
   "middle"
   "middle"
   (Circulo 30)
   (Circulo 29)
   (Circulo 28)
   (Circulo 27)
   (Circulo 26)
   (Circulo 25)
   (Circulo 24)
   (Circulo 23)
   (Circulo 22)
   (Circulo 21)
   (Circulo 20)
   (Circulo 19)
   (Circulo 18)
   (Circulo 17)
   (Circulo 16)
   (Circulo 15)
   (Circulo 14)
   (Circulo 13)
   (Circulo 12)
   (Circulo 11)
   (Circulo 10)
   (Circulo 9)
   (Circulo 8)
   (Circulo 7)
   (Circulo 6)
   ))

;ALTURA, ANCHO: constantes de la que depende las dimenciones de la constante FONDOVACIO (e imagen final)
(define ALTURA 1000)
(define ANCHO 1000)

;FONDOVACIO, constante que encuadrara a la imagen 

(define FONDOVACIO
  (empty-scene ANCHO ALTURA))



;AZARESTRELLA, constante que complementa a la constante COLORAZARESTRELLAS
(define AZARESTRELLA (random 255))

;COLORAZARESTRELLAS, constante, genera el color de las estrellas, en todo de grises 
(define COLORAZARESTRELLAS
  (make-color AZARESTRELLA AZARESTRELLA AZARESTRELLA))

;Estrella, funcion, no recibe datos, usa las constantes GROSORDECIRCULOS para determinar el tamaño y COLORAZARESTERLLAS para el color, cada vez que se la llama genera la imagen de una estrella con una rotacion diferente

(define (Estrella t)
  (rotate
   (random 359)
   (star (* GROSORDECIRCULOS 2) "solid" COLORAZARESTRELLAS)))

;ALTOESTRELLA y ANCHOESTRELLA, constantes que calculan el alto y ancho de la imagen 
(define ALTOESTRELLA (image-height (Estrella 1)))
(define ANCHOESTRELLA (image-width (Estrella 1)))

;MedidaX y MedidaY funciones que calculan en donde se posicionara la estrella, en el eje x y en el eje y. Se usan en las constantes LINEAESTRELLA y FONDOESTRELLADO
(define (MedidaX x) (+ (* (* GROSORDECIRCULOS 4) x) ANCHOESTRELLA))
(define (MedidaY y) (+ (* (* GROSORDECIRCULOS 4) y) ALTOESTRELLA))

;LINEAESTRELLA, funcion que forma una imagen rectangular de estrellas alineadas y colocadas en el eje x segun la funcion MedidaX. No es una constante para luego llamarla repetidas veces y las estrellas de cada hilera no tengan la misma rotacion
(define (LineaEstrella l)
  (overlay/offset
   (overlay/offset
    (overlay/offset
     (overlay/offset
      (Estrella 1)
      (MedidaX 1) 0 (Estrella 2))
     (MedidaX 2) 0 (Estrella 3))
    (MedidaX 3) 0 (Estrella 4))
   (MedidaX 4) 0 (Estrella 5))
  )

;FONDOESTRELLADO, constante que coloca 5 lineas de estrellas una debajo de la otra, colocadas en el eje y segun la funcion MedidaY y genera una imagen
(define FONDOESTRELLADO
  (overlay/offset
   (overlay/offset
    (overlay/offset
     (overlay/offset
      (LineaEstrella 1)
      0  (MedidaY 1) (LineaEstrella 2))
     0 (MedidaY 2) (LineaEstrella 3))
    0 (MedidaY 3) (LineaEstrella 4))
   0 (MedidaY 4) (LineaEstrella 5)))


;CIRCULOCENTRAL, constante que genera una imagen con los 5 circulos del centro de la imagen
(define CIRCULOCENTRAL
  (underlay/align "middle" "middle"
                  (Circulo 5)
                  (Circulo 4)
                  (Circulo 3)
                  (Circulo 2)
                  (circle GROSORDECIRCULOS "solid" "black")))



;Triangulo, funcion que no recibe ningun dato, genera un triangulo con un color al azar y tamaño dependiente de la constante GROSORDECIRCULOS
(define (Triangulo t) (triangle (* GROSORDECIRCULOS 4) "solid" (ColorAzar 1)))

;Triangulo1 genera una imagen del triangulo definido y lo rota 90 grados
(define (Triangulo1 t) (rotate 90 (Triangulo 0)))

;Triangulo2 refleja el triangulo rotado
(define (Triangulo2 t) (reflect-horiz (Triangulo1 0)))

;TriangulosSuperiores genera la imagen de los triangulos de arriba, situados uno al lado del otro
(define (TriangulosSuperiores t) (underlay/offset (Triangulo1 1) (* GROSORDECIRCULOS 8) 0 (Triangulo2 2)))

;TriangulosInferiores refleja verticalmente la imagen anterior
(define (TriangulosInferiores t) (reflect-vert (TriangulosSuperiores 0)))

;4TRIANGULOS combina las dos imagenes anteriores, situando una debajo de la otra
(define 4TRIANGULOS (underlay/offset
                     (TriangulosSuperiores 0)
                     0 (* GROSORDECIRCULOS 8)
                     (TriangulosInferiores 0)
                     ))
                      

;CIRCULOCONTRIANGULOS genera la imagen del circulo en el centro de la imagen usando la constante CIRCULOCENTRAL y colocando la imagen de 4TRIANGULOS arriba
(define CIRCULOCONTRIANGULOS (underlay/align/offset
                              "middle" "middle"
                              CIRCULOCENTRAL
                              0
                              0
                              4TRIANGULOS
                              ))

;CIRCULOESTRELLA alinea las imagenes de CIRCULOCONTRIANGULOS, FONDOESTRELLADO y FONDOCIRCULOS, una por encima de la otra
(define CirculoEstrella (overlay/align "middle" "middle"
                                       CIRCULOCONTRIANGULOS
                                       FONDOESTRELLADO
                                       FONDOCIRCULOS
                                       ))

;EJECUTAR encuadra la imagen final en el FONDOVACIO, para que las dimensiones de la imagen final sean las deseadas, segun las constantes ANCHO y ALTURA
(define EJECUTAR
  (place-image CirculoEstrella
               (/ ANCHO 2)
               (/ ALTURA 2)
               FONDOVACIO))


EJECUTAR

;Emanuel Gonzalez
;Proyecto 1
