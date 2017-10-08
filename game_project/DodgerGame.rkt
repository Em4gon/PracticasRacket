;==================================================Dodger==================================================
#|                 CONSTANTES


----------------------------------------------------------|#
(define ALTO 800)
(define ANCHO 500)
;(define INICIAL TODO)
(define PLAYER_SIZEX 10)
(define PLAYER_SIZEY 40)
(define PLAYER_COLOR "DodgerBlue") ;lol ironic
(define PLAYER (rectangle PLAYER_SIZEX PLAYER_SIZEY "solid" PLAYER_COLOR))
(define FONDO (empty-scene ANCHO ALTO "black"))


#|(define NumeroTamañoEnemigo 10)
(define EnemySize (if
                   (< 30 (random (* 10 NumeroTamañoEnemigo))) (- (* 10 NumeroTamañoEnemigo) 10) (random 20)))
(define (EnemyPart size color) (square EnemySize
                                        "solid" (make-color (- 250 (* 25 value)) 0 0)))

(define (EC value)
  (above/align "middle" ;arriba las mas oscuras
   (EnemyPart (+ value 4))
   (EnemyPart (+ value 3))
   (EnemyPart (+ value 2))
   (EnemyPart (+ value 1))
   (EnemyPart (+ value 0))))
|#
(define (Color col) (make-color (- 250 (* 20 col)) 0 0))

(define (EnemyPart col num) (square (* 2 num) "solid" (Color col)))

(define (EnemyCom col num)
  (above/align "middle" ;arriba las mas oscuras
               (EnemyPart (+ col 4) num)
               (EnemyPart (+ col 3) num)
               (EnemyPart (+ col 2) num)
               (EnemyPart (+ col 1) num)
               (EnemyPart (+ col 0) num)))

(EnemyCom 7 10)
