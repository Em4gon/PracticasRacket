;(require htdp/gui)
(require 2htdp/universe)
;(display-mode normal)
;Worlds and the Universe: "universe.rkt"
;(require htdp/gui)
(require 2htdp/universe)
;(display-mode normal)
;Worlds and the Universe: "universe.rkt"
(define ALTO 500)
(define ANCHO 500)

(define INICIAL (make-posn (/ ANCHO 2) (/ ALTO 2)))

(define FONDO (empty-scene ANCHO ALTO "black")) 

(define POSBOT1 (make-posn (/ ANCHO 2) (/ ALTO 3) ))
(define POSBOT2 (make-posn (/ ANCHO 2) (* 2 (/ ALTO 3) )))



;boton2 options
;boton1 play
(define (BOTON1 varbot1) (rectangle ANCHO 100 "solid" "red") )

;boton2 opciones
(define (BOTON2 varbot2) (rectangle ANCHO 100 "solid" "blue"))

;boton3 exit
(define (BOTON3 varbot3) (rectangle ANCHO 100 "solid" "yellow"))

;combinaciones de botones
(define pre-menu1 (underlay/offset (BOTON1 1) 0 200 (BOTON2 2)))

(define pre-menu2 (underlay/offset (BOTON3 3) 0 -300 pre-menu1))

(define (Menu varmenu)
  (place-images
   (list (BOTON1 1)
         (BOTON2 2)
         (BOTON3 3)
         )
   (list (make-posn 50 50)
         (make-posn 50 250)
         (make-posn 50 450)
         )
   FONDO
   )
  )
                    

(define (gamequit estado x y evento)
  (cond
    [(string=? evento "button-down")
     (and
      (< x 400)
      (> 600 x)
      (< y 700)
      (< 600))
     ]))
                        
                      
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

;====================================================================================================================
#|
(define ANCHO 10)
(define segmento (square 10 "solid" "green"))
(define escena (square 400 "solid" "black"))
  
(define-struct worm (cabeza cola dir))

; game : struct 
(define-struct game (worm comida))

; ejemplos:
(define game1 (make-game (make-worm (make-posn 40 40)
                         (list (make-posn 50 40) (make-posn 60 40) (make-posn 70 40))
                         "right")
                         (make-posn 100 100)))
(define game2 (make-game (make-worm (make-posn 100 150)
                         (list (make-posn 100 160) (make-posn 100 170))
                         "down")
                         (make-posn 300 300)))

; comida:
; (make-posn Number Number)
(define comida1 (make-posn 40 40))

(define comida (square 12 "solid" "red"))


; to-draw 
; render-game: Game -> Img
; crea el juego en la escena
(define (render-game g)
  (render-comida g (render-worm (game-worm g))))

; render-food: comida del juego, Image-> Image
; crea la comida en la escena
(define (render-comida g image)
  (place-image comida (posn-x (game-comida g)) (posn-y (game-comida g))
               image))

(check-expect (render-comida game1 escena)
              (place-image comida 100 100 escena))
(check-expect (render-comida game2 escena) 
              (place-image comida 300 300 escena))

; crea la cola (o cuerpo) del gusano

(define (render-cola cola escena)
  (cond [(empty? cola) escena]
        [else (place-image segmento (posn-x (first cola)) (posn-y (first cola))
               (render-cola (rest cola) escena))]))

; crea la cabeza del gusano

(define (render-cabeza cabeza image)
  (place-image segmento (posn-x cabeza) (posn-y cabeza) image))


; despliega los avisos

(define (render-worm w)
  (cond [(hits-wall? w) (place-image (text "Has chocado la pared" 20 "white")
                                  100 300 escena)]
        [(hits-itself? w (worm-cola w)) (place-image (text "Te has chocado solo :p" 20 "white")
                                  100 300 escena)] 
        [(cons? (worm-cola w)) (render-cabeza (worm-cabeza w) (render-cola (worm-cola w) escena))]))

; on-tick
; tick-game: Game -> Game
; cambia el juego hacia uno nuevo
(define (tick-game g)
  (cond [(get-food? g (worm-cabeza (game-worm g))) (largo g)]
        [else (tick-another-worm g)]))

(define (tick-worm w)
  (make-worm (tick-cabeza (worm-cabeza w) (worm-dir w))
             (tick-cola (worm-cola w) (worm-cabeza w))
             (worm-dir w)))

; mueve la cola (o cuerpo del gusano)

(define (tick-cola cola cabeza)
  (cond [(empty? cola) (cons cabeza empty)]   
        [else (cons cabeza (reverse (rest (reverse cola))))]))  

(check-expect (tick-cola empty (make-posn 40 40)) (cons (make-posn 40 40) empty))
(check-expect (tick-cola (list (make-posn 100 90) (make-posn 100 100)) (make-posn 100 80))
              (list (make-posn 100 80) (make-posn 100 90)))


; mueve su cabeza

(define (tick-cabeza cabeza dir)
  (cond [(string=? dir "up") (make-posn (posn-x cabeza) (- (posn-y cabeza) ANCHO))] 
                                        
        [(string=? dir "down") (make-posn (posn-x cabeza) (+ (posn-y cabeza) ANCHO))]  
                                         
        [(string=? dir "left") (make-posn (- (posn-x cabeza) ANCHO) (posn-y cabeza))] 
                                         
        [(string=? dir "right") (make-posn (+ (posn-x cabeza) ANCHO) (posn-y cabeza))]))


; get-food? : game cabeza -> bolean
; determina si el gusano come o no la comida
(define (get-food? g cabeza)
  (cond 
        [(and (= (posn-x cabeza) (posn-x (game-comida g)))
              (= (posn-y cabeza) (posn-y (game-comida g))))
         true]
        [else false]))

(check-expect (get-food? game1 (make-posn 30 30)) false)
(check-expect (get-food? game2 (make-posn 300 300)) true)

; largo: Game -> game
; cambia el juego hacia uno nuevo
(define (largo g) 
  (make-game (make-worm (make-new-head (game-worm g))
                        (add-to-cola (worm-cola (game-worm g)) (worm-cabeza (game-worm g)))
                        (worm-dir (game-worm g)))
             (make-posn (* 10 (random 40)) (* 10 (random 40)))))

; make-new-head: worm -> cabeza
; crea una nueva cabeza
(define (make-new-head w)
  (cond [(string=? (worm-dir w) "up") (make-posn (posn-x (worm-cabeza w)) 
                                                 (- (posn-y (worm-cabeza w)) ANCHO))]
        [(string=? (worm-dir w) "down") (make-posn (posn-x (worm-cabeza w))
                                                 (+ (posn-y (worm-cabeza w)) ANCHO))]
        [(string=? (worm-dir w) "left") (make-posn (- (posn-x (worm-cabeza w)) ANCHO)
                                                  (posn-y (worm-cabeza w)))]
        [(string=? (worm-dir w) "right") (make-posn (+ (posn-x (worm-cabeza w)) ANCHO)
                                                   (posn-y (worm-cabeza w)))])) 
  

; add-to-tail: 
; añade otro posn a la cola del gusano
(define (add-to-cola cola cabeza)
  (cons cabeza cola))

; tick-another-worm Game -> game
; cambia el juego hacia uno nuevo
(define (tick-another-worm g)
  (make-game (tick-worm (game-worm g))
             (game-comida g)))

; on-key
; key-game : Game, keyEvent -> Ggme
; cambia el juego basado en la teclas
(define (key-game g ke)
  (make-game (key-worm (game-worm g) ke)
             (game-comida g)))


; movimientos del gusano
(define (key-worm w ke)
  (cond [(and (string=? (worm-dir w) "left") (key=? ke "right")) w]
        [(and (string=? (worm-dir w) "right") (key=? ke "left")) w]
        [(and (string=? (worm-dir w) "up") (key=? ke "down")) w]
        [(and (string=? (worm-dir w) "down") (key=? ke "up")) w]
        [(key=? ke "up") (make-worm (worm-cabeza w)
                                    (worm-cola w)
                                    "up")]
        [(key=? ke "down") (make-worm (worm-cabeza w)
                                      (worm-cola w)
                                      "down")]
        [(key=? ke "left") (make-worm (worm-cabeza w)
                                      (worm-cola w)
                                      "left")]
        [(key=? ke "right") (make-worm (worm-cabeza w)
                                       (worm-cola w)
                                       "right")]))


; analiza si se ha chocado el mismo
(define (hits-itself? w cola)
  (cond [(empty? cola) false]
        [(and (= (posn-x (worm-cabeza w)) (posn-x (first cola)))
              (= (posn-y (worm-cabeza w)) (posn-y (first cola))))
         true]
        [else (hits-itself? w (rest cola))]))

; analiza si se ha chocado la pared o no
(define (hits-wall? w)
  (if (or (< (posn-x (worm-cabeza w)) 0) 
          (< (posn-y (worm-cabeza w)) 0) 
          (> (posn-x (worm-cabeza w)) 390) 
          (> (posn-y (worm-cabeza w)) 390))
         true false))




; muerte del gusano
(define (worm-died w)
  (if (or (hits-wall? w) (hits-itself? w))
      true false)) 



; determina si el juego ha terminado
(define (game-ends g)
  (if (or (hits-wall? (game-worm g))
      (hits-itself? (game-worm g) (worm-cola (game-worm g)))) true false))

;(big-bang game2 
 ;         [to-draw render-game]
  ;        [on-tick tick-game 0.05]
   ;       [on-key key-game]
    ;      (stop-when stop-expr last-scene-expr)
     ;     )

;(big-bang INICIAL
; [to-draw menu]
 ;[on-tick ColorChange 0.5]
 ;[on-key ]
 ;[on-mouse]
 ;[on-pad]
;)
|#
