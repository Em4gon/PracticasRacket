(require picturing-programs)

#|
(rotate-cw img) → image?
  img : image?
Rotates an image 90 degrees clockwise.
procedure
(rotate-ccw img) → image?
  img : image?
Rotates an image 90 degrees counterclockwise.
procedure
(rotate-180 img) → image?
  img : image?
Rotates an image 180 degrees around its center.
procedure
(crop-top img pixels) → image?
  img : image?
  pixels : natural-number/c
Chops off the specified number of pixels from the top of the image.
procedure
(crop-bottom img pixels) → image?
  img : image?
  pixels : natural-number/c
Chops off the specified number of pixels from the bottom of the image.
procedure
(crop-left img pixels) → image?
  img : image?
  pixels : natural-number/c
Chops off the specified number of pixels from the left side of the image.
procedure
(crop-right img pixels) → image?
  img : image?
  pixels : natural-number/c
Chops off the specified number of pixels from the right side of the image.
procedure
(flip-main img) → image?
  img : image?
Reflects an image across the line x=y, moving the pixel at coordinates (x,y) to (y,x). The top-right corner becomes the bottom-left corner, and vice versa. Width and height are swapped.
procedure
(flip-other img) → image?
  img : image?
Reflects an image by moving the pixel at coordinates (x,y) to (h-y, w-x). The top-left corner becomes the bottom-right corner, and vice versa. Width and height are swapped.
procedure
(reflect-vert img) → image?
  img : image?
The same as flip-vertical; retained for compatibility.
procedure
(reflect-horiz img) → image?
  img : image?
The same as flip-horizontal; retained for compatibility.
procedure
(reflect-main-diag img) → image?
  img : image?
The same as flip-main; retained for compatibility.
procedure
(reflect-other-diag img) → image?
  img : image?
The same as flip-other; retained for compatibility.
|#
#|
CircleRan: recibe un numero que determina el tamaño del circulo
number -> circle
----------------------------------------------
(circle radius mode color) → image?
  radius : (and/c real? (not/c negative?))
  mode : mode?
  color : image-color?
|#


(define (Circulo r) (circle (* 25 r) "solid"
                              (make-color (random 255) (random 255) (random 255))))

#|
(underlay/align x-place y-place i1 i2 is ...) → image?
  x-place : x-place?
  y-place : y-place?
  i1 : image?
  i2 : image?
  is : image?
-----------------------------------ejemplo
(underlay/align "right" "top"
                  (rectangle 50 50 "solid" "seagreen")
                  (rectangle 40 40 "solid" "silver")
                  (rectangle 30 30 "solid" "seagreen")
                  (rectangle 20 20 "solid" "silver"))
-----------------------------------------
|#

(define CombinacionDeCirculos(underlay/align "middle" "middle"
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
                (Circulo 5)
                ))

(define altura 1000)
(define ancho 1000)

;FondoCirculos constante que encuadra la imagen CombinacionDeCirculos
#|
    (place-image image x y scene) → image?

  image : image?
  x : real?
  y : real?
  scene : image?
|#
(define FondoVacio (empty-scene ancho altura))

(define FondoCirculos (place-image CombinacionDeCirculos
             (/ ancho 2)
             (/ altura 2)
             FondoVacio))

(check-expect (+ (image-width FondoCirculos) (image-height FondoCirculos)) 2000)

;======================================================================================
#|
(underlay/offset i1 x y i2) → image?
  i1 : image?
  x : real?
  y : real?
  i2 : image?
(overlay/offset (overlay/offset (rectangle 60 20 "solid" "black")
                                  -50 0
                                  (circle 20 "solid" "darkorange"))
                  70 0
                  (circle 20 "solid" "darkorange"))
(rotate angle image) → image?
|#

(define (Estrella t) (rotate (random 359)(star 50 "solid" "white")))
(define HS (image-height (Estrella 1)))
(define WS (image-width (Estrella 1)))

(define (medidax x) (+ (* 100 x) WS))
(define (mediday y) (+ (* 100 y) HS))

;forma una imagen rectangular de estrellas consecutivas
(define (LineaEstrella l)
 (overlay/offset
  (overlay/offset
   (overlay/offset
    (overlay/offset
      (Estrella 1)
    (medidax 1) 0 (Estrella 1))
   (medidax 2) 0 (Estrella 1))
  (medidax 3) 0 (Estrella 1))
 (medidax 4) 0 (Estrella 1))
   )

;coloca 5 lineas de estrellas una debajo de la otra
(define FondoEstrellado
 (overlay/offset
  (overlay/offset
   (overlay/offset
    (overlay/offset
     (LineaEstrella 1)
     0  (mediday 1) (LineaEstrella 1))
    0 (mediday 2) (LineaEstrella 2))
   0 (mediday 3) (LineaEstrella 3))
  0 (mediday 4) (LineaEstrella 4)))

;define circulo central, lo defino como una constante porque luego lo voy a usar
;para posicionar los triangulos en la imagen

(define CirculoCentral (circle (* 25 5) "solid" "yellow"))


(define CirculoEstrella (overlay/align "middle" "middle" ;abajo va la mas grande
                                       CirculoCentral
                                       FondoEstrellado
                                       FondoCirculos
                                       ))

CirculoEstrella 
#|
(triangle side-length mode color) → image?
  side-length : (and/c real? (not/c negative?))
  mode : mode?
  color : image-color?
|#
;(rotate 95 (triangle 50 "solid" "white"))

;(rotate (-(/ (- 360 45) 2)) (triangle 50 "solid" "white"))

#|
procedure
(triangle/aas	 	angle-a	 	 	 	 
 	 	angle-b	 	 	 	 
 	 	side-length-c	 	 	 	 
 	 	mode	 	 	 	 
 	 	color)	 	→	 	image?
  angle-a : angle?
  angle-b : angle?
  side-length-c : (and/c real? (not/c negative?))
  mode : mode?
  color : image-color?
|#

#|
funciones de prueba de triangulos
(triangle/ass 90 40 200 "solid" "white")

(triangle/aas 90 40 200 "solid" "white")

es mas facil
(triangle side-length mode color) → image?
|#

(define Triangulo (triangle 100 "solid" "blue"))


(define (RotTri x) (rotate x Triangulo))



(define Triangulo1 (RotTri 215))


;(overlay/offset null
;               (- (/ ancho 2) (/ 2 (image-width (Circulo 5)))) ;posicion x
;              (- (/ altura 2) (/ 2 (image-height (Circulo 5)))) Triangulo1)

#|
        (overlay/align/offset	 	x-place	 	 	 	 
         	 	y-place	 	 	 	 
         	 	i1	 	 	 	 
         	 	x	 	 	 	 
         	 	y	 	 	 	 
         	 	i2)	 	→	 	image?

      x-place : x-place?
      y-place : y-place?
      i1 : image?
      x : real?
      y : real?
      i2 : image?

Overlays image i1 on top of i2, using x-place and y-place as the starting points for 
the overlaying, and then adjusts i2 by x to the right and y pixels down.

This function combines the capabilities of overlay/align and overlay/offset.

===============================================================================================
        (underlay/align/offset	 	x-place	 	 	 	 
         	 	y-place	 	 	 	 
         	 	i1	 	 	 	 
         	 	x	 	 	 	 
         	 	y	 	 	 	 
         	 	i2)	 	→	 	image?

      x-place : x-place?
      y-place : y-place?
      i1 : image?
      x : real?
      y : real?
      i2 : image?

Underlays image i1 underneath i2, using x-place and y-place as the starting points for the combination, and then adjusts i2 by x to the right and y pixels down.

This function combines the capabilities of underlay/align and underlay/offset.

Examples:

    > (underlay/align/offset
       "right" "bottom"
       (star-polygon 20 20 3 "solid" "navy")
       10 10
       (circle 30 "solid" "cornflowerblue"))




(underlay/align/offset
   "right" "bottom"
   (underlay/align/offset
    "left" "bottom"
    (underlay/align/offset
     "right" "top"
     (underlay/align/offset
      "left" "top"
      (rhombus 120 90 "solid" "navy")
      16 16
      (star-polygon 20 11 3 "solid" "cornflowerblue"))
     -16 16
     (star-polygon 20 11 3 "solid" "cornflowerblue"))
    16 -16
    (star-polygon 20 11 3 "solid" "cornflowerblue"))
   -16 -16
   (star-polygon 20 11 3 "solid" "cornflowerblue"))

image
|#

;(flip-main img) → image?

(define Triangulo2 (reflect-horiz Triangulo1))

(define Triangulo1y2 (underlay/align/offset "middle" "middle" Triangulo1 200 0 Triangulo2))

(underlay/align/offset
 "middle" "middle"
 CirculoCentral
 -0
 -100
 Triangulo1y2
 )
 
 
