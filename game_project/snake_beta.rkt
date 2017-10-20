;(require htdp/gui)
(require 2htdp/universe)
;Worlds and the Universe: "universe.rkt"
(define (inicial c) (/ ALTO 2) )
(define ALTO 800)
(define ANCHO 800)
(define FONDO (empty-scene ANCHO ALTO "black")) 

(define (BOTON2 c) (place-image/align (rectangle 100 100 "solid" "blue") 200 200 "middle" "middle" FONDO))
;boton2 options
;boton1 play
(define (BOTON1 c) (place-image/align (rectangle 100 100 "solid" "red") 200 200 "middle" "top" BOTONDOS))


(define POSICIONBOTON1 (- ALTO (image-height BOTON


(define (mouse-handler c x y event) 
  
  (cond [(string=? event "button-down") 
         (if (and (< y ALTO) 
                  (> y 0))
             y
             (if (< y POSMAX) POSMAX (if (> y POSMIN) POSMIN y)))]
        [else c]
        )
)

(big-bang inicial
 [to-draw BOTONPLAY]
 ;[on-tick ColorChange 0.5]
 ;[on-key ]
 ;[on-mouse]
 ;[on-pad]
)
