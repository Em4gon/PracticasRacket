;(require htdp/gui)
(require 2htdp/universe)
;(display-mode normal)
;Worlds and the Universe: "universe.rkt"
(define ALTO 800)
(define ANCHO 800)
(define INICIAL (make-posn (/ ANCHO 2) (/ ALTO 2)))

(define FONDO (empty-scene ANCHO ALTO "black")) 

(define POSBOT1 (make-posn (/ ANCHO 2) (/ ALTO 3) ))
(define POSBOT2 (make-posn (/ ANCHO 2) (* 2 (/ ALTO 3) )))



;boton2 options
;boton1 play
(define (BOTON1 varbot1) (place-image (rectangle 100 100 "solid" "red") (posn-x POSBOT1) (posn-y POSBOT1) (empty-scene ANCHO ALTO)))

(define (BOTON2 varbot2) (place-image (rectangle 100 100 "solid" "blue") (posn-x POSBOT2) (posn-y POSBOT2) FONDO))

(define (menu menuitem) (place-image/align (BOTON1 1)  0 0 "middle" "middle" (BOTON2 1)))
#|
(define (mouse-handler c x y event) 
    (cond [(string=? event "button-down") 
         (if (and (< y ALTO) 
                  (> y 0))
             "white"
             (if (< y POSMAX) POSMAX (if (> y POSMIN) POSMIN y)))]
        [else c]
        )
)
|#

;funcion auxiliar para cada boton
;RESULTADOBOTON1: x y -> string (color)
;(define (RESULTADOBOTON1 x y)

(big-bang INICIAL
 [to-draw menu]
 ;[on-tick ColorChange 0.5]
 ;[on-key ]
 ;[on-mouse]
 ;[on-pad]
)
