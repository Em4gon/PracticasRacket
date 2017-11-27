;---------------------------------- El codigo empieza en la lina 600
(define-struct
  nucleo
  [juego ;number number que juego es
   fondo ;img fondodelmenu imagen
   gname ;string nombre de la ventana
   instancia ;number
   preselector ;string, pre selecciona lo que pasara al apretar play "run-snake" "juego-2"
   stopORstart ;string: "stop" o "star"
   vidas ;number default 1, cuando es 0 cambia el campo alive
   alive ;boolean true = vivo
   snake ;posn cabeza de snake
   tail ;lista de posn
   direccion
   colorchar ;string ----------------numero
   colorback ;string                 number
   food ;posn
   score ;number
   rango ;number, el default es 5
   speed ;number, el default es 0.05 mas chico el num mas rapido el juego
   fantasma ;boolean, "godmode"
   modopantalla ;'fullscreen o 'normal
   timer ;number
   highscores 
   ])
;=========================COMENTARIO=========================                                         INICIAL
(define INICIAL
  (make-nucleo
   0 ;juego nucleo
   menu ;fondo del menu
   "Nucleo - Emanuel Gonzalez" ;gname
   0 ;instancia de menu
   "run-snake" ;- preselector
   "stop" ;empieza detenido
   0 ;vidas ;cantidad de vidas disponibles
   #false ;alive
   (make-posn 100 400) ;snake head
   (list (make-posn 90 400) (make-posn 80 400)) ;cola
   "quieto" ;direccion
   0 ;color personaje
   0 ;color fondo
   (make-posn (/ ALTO 2) (/ ANCHO 2)) ;FOOD
   0
   20 ;rango
   0.02 ;speed 
   #false ;fantasta
   'normal ;modo pantalla
   0 ;timer
   (list 0 0 0 0 0) ;highscores
   ))

(define snake-INICIAL
  (make-nucleo    3 ;juego nucleo
                     menu ;fondo del menu
   "Snake - Emanuel Gonzalez" ;gname
   4 ;instancia de menu
   "run-snake" ;- preselector
   "stop" ;empieza detenido
   3 ;vidas ;cantidad de vidas disponibles
   #true ;alive
   (make-posn 100 400) ;snake head
   (list (make-posn 90 400) (make-posn 80 400)) ;cola
   "quieto" ;direccion
   0 ;color personaje
   0 ;color fondo
   (make-posn (/ ALTO 2) (/ ANCHO 2)) ;FOOD
   0
   400 ;rango
   0.02 ;speed 
   #false ;fantasta
   'normal ;modo pantalla
   800 ;timer
   LISTAHIGHSCORES ;highscores
   ))
;--------------------------------------------------------------
(define (modificar-juego estado valor-juego)
  (make-nucleo       valor-juego
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-fondo estado valor-fondo)
  (make-nucleo
       (nucleo-juego estado)
       valor-fondo
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-gname estado valor-gname)
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       valor-gname
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-instancia estado valor-instancia)
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       valor-instancia
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-preselector estado valor-preselector)
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       valor-preselector
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-stopORstart estado valor-stopORstart)
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       valor-stopORstart 
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-vidas estado valor-vidas)
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       valor-vidas
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-alive estado valor-alive) ;true o false
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       valor-alive
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-snake estado valor-snake) ;posn
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       valor-snake
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-tail estado valor-tail) ;lista de posn
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       valor-tail
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-direccion estado valor-direccion) ;string
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       valor-direccion
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-colorchar estado valor-colorchar) ;number
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       valor-colorchar
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-colorback estado valor-colorback) ;
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       valor-colorback
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-food estado valor-food) ;posn
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       valor-food
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-score estado valor-score) ;number
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       valor-score
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-rango estado valor-rango) ;number
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       valor-rango
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-speed estado valor-speed) ;number
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       valor-speed
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-fantasma estado valor-fantasma) ;boolean
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       valor-fantasma
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-modopantalla estado valor-modopantalla) ;
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       valor-modopantalla
       (nucleo-timer estado)
       (nucleo-highscores estado)
       ))

(define (modificar-timer estado valor-timer) ;
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       valor-timer
       (nucleo-highscores estado)
       ))

(define (modificar-highscores estado valor-highscores) ;
  (make-nucleo
       (nucleo-juego estado)
       (nucleo-fondo estado)
       (nucleo-gname estado)
       (nucleo-instancia estado)
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       (nucleo-vidas estado)
       (nucleo-alive estado)
       (nucleo-snake estado)
       (nucleo-tail estado)
       (nucleo-direccion estado)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       (nucleo-timer estado)
       valor-highscores
       ))

 ;=========================COMENTARIO=========================                                CONSTANTES
(define ALTO 600)
(define ANCHO 800)
(define COLORBOTONPLAY1 "red")
(define COLORBOTONPLAY2 "pink")

(define DELTA 10)
(define segmento (square 10 "solid" "green"))
(define escena (rectangle ANCHO ALTO "solid" "black"))


(define BOTONPLAY (rectangle (/ ANCHO 2) 100 "solid" "green"))
(define BOTONOPCIONES (rectangle (/ ANCHO 2) 100 "solid" "yellow"))
(define BOTONSALIR (rectangle (/ ANCHO 2) 100 "solid" "red"))

(define vacio (empty-scene ANCHO ALTO "transparent"))
(define FONDOOPCIONES (rectangle ANCHO ALTO "solid" "blue"))
(define comida (square 10 "solid" "red"))

(define MINIMO-PARED 100)
(define MAXIMO-PARED (- ALTO 5))

(define VALOR-DE-RANGO 99) ;ORIGINAL 5 
(define SPEED 0.02) ;ORIGINAL 0.05 MAS CHICO MAS RAPIDO

(define SNAKEINICIAL (make-posn 100 200))


(define CAMBIOVELOCIDAD 0.002)
(define (AUMENTAR-VELOCIDAD num) (- num CAMBIOVELOCIDAD))
(define (DECREMENTAR-VELOCIDAD num) (+ num CAMBIOVELOCIDAD))


(define FOODINICIAL (make-posn (/ ANCHO 2) (+ (/ ALTO 2) 50)))
(define TAMAÑO-TEXTO 30)


(define LISTAHIGHSCORES (list 0 0 0 0 0))
(define DELTATIEMPO 20)
;=======================================================================================IMAGENES CONSTANTES
;funcion auxiliar poner-texto: string color color -> img
;recibe una string y dos colores y genera una imagen de 400x100
(define (poner-texto string colortxt colorfondo )
  (place-image/align (text string 70 colortxt) (/ ANCHO 4) 50 "center" "center" (rectangle (/ ANCHO 2) 100 "solid" colorfondo)))

(define COLORFONDO "DarkGreen")

(define BOTON-HIGHSCORE (poner-texto "Puntajes" "white" "red"))
(define BOTON-INSTRUCCIONES (poner-texto "Instrucciones" "white" "green"))
(define BOTON-SALIR (poner-texto "Salir" "white" "black"))


(define (boton-jugar estado)
  (poner-texto (nucleo-preselector estado) "white" "blue"))

(define (menu estado)
  (place-images
   (list (boton-jugar estado)
         PRESELECTORIZQ
         PRESELECTORDER
         BOTON-HIGHSCORE
         BOTON-0-0-1
         BOTON-INSTRUCCIONES
         BOTON-SALIR
    )
   (list (make-posn 400 50)
         (make-posn 150 50)
         (make-posn 650 50)
         (make-posn 400 175)
         (make-posn 400 300)
         (make-posn 400 425)
         (make-posn 400 550)
    )
   (rectangle 800 600 "solid" COLORFONDO)))





;--------------------------------------------------------------------


;OPCIONES

(define PRESELECTORIZQ (place-image (rotate 90 (triangle 80 "solid" "red")) 50 50 (rectangle 100 100 "solid" "blue")))

(define PRESELECTORDER (place-image (rotate -90 (triangle 80 "solid" "red")) 50 50 (rectangle 100 100 "solid" "blue")))

(define BOTON-0-0-0 (poner-texto "Jugar" "white" "blue"))

(define BOTON-0-0-1 (poner-texto "Opciones" "black" "chocolate"))

(define BOTON-0-0-2 (poner-texto "Salir" "black" "red"))
;=========================================================================================================================== OPCIONES


(define (poner-texto-opt string colortxt colorfondo )
  (place-image (text string 20 colortxt) (- (/ ANCHO 4) 100) 50 (rectangle (/ (/ ANCHO 2) 2) 100 "solid" colorfondo)))

(define PRESELECTOR-OPCIONES-IZQ (place-image (rotate 90 (triangle 80 "solid" "red")) 50 50 (rectangle 100 100 "solid" "blue")))

(define PRESELECTOR-OPCIONES-DER (place-image (rotate -90 (triangle 80 "solid" "red")) 50 50 (rectangle 100 100 "solid" "blue")))



(define (boton-vidas estado)
  (poner-texto-opt (string-append "Vidas " (number->string (nucleo-vidas estado))) "white" "blue"))

(define (boton-speed estado)
  (poner-texto-opt (string-append "Vel " (number->string (nucleo-speed estado))) "white" "blue"))

(define (boton-rango estado)
  (poner-texto-opt (string-append "Rango " (number->string (nucleo-rango estado))) "white" "blue"))

(define (boton-tiempo estado)
  (poner-texto-opt (string-append "Tiempo " (number->string (nucleo-timer estado))) "white" "blue"))

(define (boton-color-fondo estado)
  (poner-texto-opt (string-append "Fondo " (list-ref COLORESFONDO (nucleo-colorback estado))) "white" "blue"))

(define (boton-color-personaje estado)
  (poner-texto-opt (string-append "Personaje " (list-ref COLORESPERSONAJE (nucleo-colorchar estado))) "white" "blue"))

(define boton-RESET-HIGHSCORE 
  (poner-texto-opt "Resetear puntajes" "white" "red"))

(define boton-RESET-OPCIONES
  (poner-texto-opt "Resetear opciones" "white" "red"))

(define PANTALLANORMAL
  (poner-texto-opt "Pantalla normal" "white" "green"))

(define FULLSCREEN
  (poner-texto-opt "Pantalla completa" "white" "green"))

(define (opciones estado)
  (place-images
   (list (boton-vidas estado)
         PRESELECTORIZQ
         PRESELECTORDER
         
         (boton-speed estado)
         PRESELECTORIZQ
         PRESELECTORDER

         (boton-rango estado)
         PRESELECTORIZQ
         PRESELECTORDER

         (boton-tiempo estado)
         PRESELECTORIZQ
         PRESELECTORDER

         (boton-color-fondo estado)
         PRESELECTORIZQ
         PRESELECTORDER

         (boton-color-personaje estado)
         PRESELECTORIZQ
         PRESELECTORDER

         boton-RESET-HIGHSCORE

         boton-RESET-OPCIONES

         PANTALLANORMAL

         FULLSCREEN
    )
   (list (make-posn 200 150)
         (make-posn 50 150)
         (make-posn 350 150)
         
         (make-posn 600 150)
         (make-posn 450 150)   ;-150 a la x del primero , y es la misma
         (make-posn 750 150)
         
         (make-posn 200 250)
         (make-posn 50 250)       ;rango
          (make-posn 350 250)

          (make-posn 600 250)
         (make-posn 450 250)   ;tiempo
         (make-posn 750 250)

         (make-posn 200 350)
         (make-posn 50 350)       ;color-fondo
          (make-posn 350 350)

          (make-posn 600 350)
         (make-posn 450 350)   ;color-personaje
         (make-posn 750 350)

         (make-posn 200 450) ;reset-highscore

         (make-posn 600 450) ;reset-opciones

         (make-posn 200 550) ;p normal

         (make-posn 600 550);p completa
    )
  (place-image (poner-texto "Volver" "white" COLORFONDO) 400 50 (rectangle 800 600 "solid" COLORFONDO))))


;=========================COMENTARIO=========================                                         AUXILIARES


;------------------------------------------------------------
#;(quitar-ultimo: lista -> lista)
;recibe una lista y devuelve la misma lista sin su ultimo elemento

(define (quitar-ultimo lista)
  (remove (list-ref lista (- (length lista) 1)) lista))

;----------------------------------
#;(devolver-ultimo-elemento: lista -> elemento de lista)
;receibe una lista y devuelve su ultimo elemento (last)
(define (devolver-ultimo-elemento lista)
 (list-ref lista (- (length lista) 1)))

;------------------------------------------------------------
;toma un elemento y lo agrega en la ultima posicion de una lista
#;(agregar-elemento-ultimo: elemento lista -> lista)

;elemento elemento -> lista
(define (agregar-a-ultimo-profe elemento lista)
  (cons
   [(empty? lista) (cons elemento empty)]
   [(cons? lista)
    (cons (first lista) (agregar-a-ultimo-profe elemento (rest lista)))]))
;------------------------------------------------------------

;RECIBE UNA LISTA, DEVUELVE LOS PRIMEROS 5 ELEMENTOS
(define (top-5 elemento)
  (quicksort
   (list (list-ref elemento 0)
          (list-ref elemento 1)
          (list-ref elemento 2)
          (list-ref elemento 3)
          (list-ref elemento 4)
          ) >))


;-------------------------------------------------------------------------------
;recibe un numero, si es mayor o igual que dos le permite restar uno, sino devuelve 1
(define (restar1 num) (if (>= num 2) (- num 1) 1))

(define (restar1b num) (if (>= num 1) (- num 1) 0))
(define (restar1d num) (if (>= num 10) (- num 10) 0))
(define (sumar1 num) (if (<= num 6) (+ num 1) 7))

(define (restar1c num) (if (>= num 20) (- num 10) 10))
;--------------------------------------------------------------------------------


(define COLORESPERSONAJE (list "black" "white" "pink" "crimson" "DarkSlateGray" "blue" "green" "yellow" "MediumSeaGreen"))
(define COLORESFONDO (list "GhostWhite" "black" "DeepSkyBlue" "Crimson" "Salmon" "DarkGreen" "Violet" "LightSlateGray" "Turquoise"))
(define n 1)



;=========================COMENTARIO=========================                                         =TO-DRAW=
#;(
 
                                            juego
                                            0 -> 
                                                 instancia
                                                 0 menu
                                                 1 opciones
                                                 2 creditos y salir
                                            3 ->
                                                 instancia
                                                 4 snake
                                                 5 post-deth
                                            6 instrucciones
                                            7 -> 8


manejador-pantalla: estado-> imagen
           recibe un estado y grafica una imagen   )
;=========================COMENTARIO=========================
(define instrucciones-snake
  (place-image (text "El objetivo del juego
es agarrar frutas rojas,
esquvar las paredes
y no chocarse con su cola
Controla a la serpiente con las teclas W A S D.
En las opciones puede modificar
el rango (que tan cerca tiene que estar de las frutas)
y la velocidad (cuanto menor el numero, mas rapido).
El tiempo no se resetea luego de cada muerte.
Al perder las 3 vidas (o mas) termina el juego.
Presione escape para volver al menu" 20 "white")
               400 300 (rectangle ANCHO ALTO "solid" "black")))

(define instrucciones-juego-2
  (place-image
   (text
    "El juego no esta definido
     por lo tanto tampoco las
     instrucciones.
     Clickear en cualquier lado para volver al menu" 25 "white")
               400 300 (rectangle ANCHO ALTO "solid" "black")))

(define (instrucciones estado)
  (cond
    [(equal? (nucleo-preselector estado) "run-snake")
     (place-image instrucciones-snake 400 300 vacio) ]
    [(equal? (nucleo-preselector estado) "juego-2")
    (place-image instrucciones-juego-2 400 300 vacio) ]))




(define (manejador-pantalla estado)
  (cond                                                     
    [(and (= (nucleo-juego estado) 0) (= (nucleo-instancia estado) 0)) (menu estado)] ;menu principal
     
    [(and (= (nucleo-juego estado) 0) (= (nucleo-instancia estado) 1)) (opciones estado)];opciones
     
    [(and (= (nucleo-juego estado) 3) (= (nucleo-instancia estado) 4)) (snake estado)]  ;dentro del snake, vivo
     
    [(and (= (nucleo-juego estado) 3) (= (nucleo-instancia estado) 5)) (post-deth estado)] ;dentro del snake, muerto
     
    [(= (nucleo-juego estado) 6) (instrucciones estado)]  ;instrucciones
     
    [(= (nucleo-juego estado) 7) (ventanita-highscores estado)]    ;highscores
    
    [else (menu estado)] ))
   

;SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE
;SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE=SNAKE





;lista-de-snake combina las posiciones que dibujaran la serpiente en una lista
; estado -> list
(define (lista-de-snake estado)
  (cons (nucleo-snake estado) (nucleo-tail estado)))


;estado-> image (hace un cuadrado de 10px el cual formara cada cuadrado de la serpiente, toma el color del estado
(define (parte-snake estado)
  (square 10 "solid" (list-ref COLORESPERSONAJE (nucleo-colorchar estado))))  


;lista-de-snake-imagenes:
;estado -> lista de imagenes
;hace la primera parte del grafico de la serpiente, place-image requiere una lista con todas las imagenes
; esta funcion la "fabrica" 
(define (lista-de-snake-imagenes estado)
  (make-list (length (lista-de-snake estado)) (parte-snake estado)))




;fondo dentro del juego con la comida incluida
;estado ->fondo dentro del juego
(define (fondo-snake estado)
  (place-image comida (posn-x (nucleo-food estado)) (posn-y (nucleo-food estado)) 
               (place-image (rectangle 800 100 "solid" "black") 400 50 (rectangle 800 600 "solid" (list-ref COLORESFONDO (nucleo-colorback estado))))))



;generador-fondo-snake; estado -> imagen
;recibe usa el score y el timer para cambiar la barra superior del fondo
;estado -> fondo del juego con una barra superior
(define (generador-fondo-snake estado)
  (place-images
   (list
    (text (string-append "Velocidad: " (number->string (nucleo-speed estado)))
          25 (make-color 100 100 100))
    (text (string-append "Rango: " (number->string (nucleo-rango estado)))
          25 (make-color 100 100 100))
    (text (string-append "Vidas: " (number->string (nucleo-vidas estado)))
          TAMAÑO-TEXTO (make-color 228 48 48))
    (text (string-append "Tiempo: " (number->string (nucleo-timer estado)))
          TAMAÑO-TEXTO (make-color 255 255 255))
    (text (string-append "Puntaje: " (number->string (nucleo-score estado)))
          TAMAÑO-TEXTO (make-color 216 255 21))
    (text (nucleo-gname estado) 15 (make-color 100 100 100)))

   (list (make-posn 100 30)
         (make-posn 100 60)
         (make-posn 300 70)
         (make-posn 500 70)
         (make-posn 700 70)
         (make-posn 700 10))
    (fondo-snake estado)))

;----------------------------------------


;se llama a graficar esta funcion
;snake: estado -> imagen
(define (snake estado)
   (place-images
   (lista-de-snake-imagenes estado)
   (lista-de-snake estado)
(generador-fondo-snake estado)))
   




;POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH
;POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH=POST-DETH
;post-deth: estado -> imagen

;texto-post-deth
;estado-> string

(define (texto-post-deth1 estado)
  (string-append "¡Lograste " (number->string (nucleo-score estado))  " puntos!"))



  ;------------------------------------
(define (lista-puntaje-img estado)
 (list
  (text (string-append "Primero:......." (number->string (list-ref (nucleo-highscores estado) 0)) )25 "white")
  (text (string-append "Segundo:......." (number->string (list-ref (nucleo-highscores estado) 1)) )25 "white")
  (text (string-append "Tercero:......." (number->string (list-ref (nucleo-highscores estado) 2)) )25 "white")
  (text (string-append "Cuarto:........" (number->string (list-ref (nucleo-highscores estado) 3))) 25 "white")
  (text (string-append "Quinto:........" (number->string (list-ref (nucleo-highscores estado) 4))) 25 "white")
  (rectangle 400 600 "solid" "black")))

(define (lista-puntaje-posn estado)
  (list
   (make-posn 400 400)
   (make-posn 400 425)
   (make-posn 400 450)
   (make-posn 400 475)
   (make-posn 400 500)
   (make-posn 400 300)))

  (define (ventanita-highscores estado)
    (place-images
     (lista-puntaje-img estado)
     (lista-puntaje-posn estado)
     vacio))
;---------------------------------




(define (post-deth estado)
  (place-images
   
   (list
    (text
   "     Te moriste, 
    presiona escape para
    volver al menu, o toca
    la barra espaciadora
    para jugar de nuevo" 30 "white")

    (text (texto-post-deth1 estado) 20 "yellow")
    )

   (list
    (make-posn 400 100)
    (make-posn 400 300))

    (ventanita-highscores estado))) 
    




;=========================COMENTARIO=========================
#;(
;ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK
                                            ON-TICK
;ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK=ON-TICK
)
;=========================COMENTARIO=========================  AUXILIARES
;recibe el estado y compara los campos snake y tail
(define (se-choca-con-la-cola listacola snake)
  (cond 
    [(empty? listacola) #false]
    [(cons? listacola) 
     (if (equal? (first listacola) snake)
                       #true
                      (se-choca-con-la-cola (rest listacola) snake))]))


(define (se-choca-con-la-pared estado)
  (if (or (< (posn-x (nucleo-snake estado)) 0) 
          (< (posn-y (nucleo-snake estado)) MINIMO-PARED) 
          (> (posn-x (nucleo-snake estado)) (- ANCHO 10)) 
          (> (posn-y (nucleo-snake estado)) MAXIMO-PARED))
#true #false))

;-------------------------------------------------------------

#;( puntos-cercanos: number number -> boolean)
;toma dos numeros y dicta si estos estan cerca o no
;sirve para determinar si el gusano come o no la fruta dependiendo su rango
(define (puntos-cercanos estado a b)
  (and (<= (- a b) (nucleo-rango estado)) (>= (- a b) (- (nucleo-rango estado)))))

;------------------------------------------------------------

#;(round-to-multiplodiez: number -> number)
;recibe un numero y lo redondea hacia abajo, para que quede un multiplo de 10
(define (round-to-mutiplodiez number)
  (- number (modulo number 10)))

;------------------------------------------------------------
#;(random-acotado: number number -> number )
;toma un valor minimo y un maximo y devuelve un numero aleatorio entre esos dos valores
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
  );define










(define (tick-tock estado)
  (cond
    [(equal? "quieto" (nucleo-direccion estado))
     (modificar-timer (modificar-tail (modificar-snake estado SNAKEINICIAL) (list (make-posn 90 200) (make-posn 80 200))) (nucleo-timer snake-INICIAL))]
   
     [(>= 0 (nucleo-vidas estado))     (modificar-instancia estado       5)]
     
     ;en caso de que la posicione de la cabeza sea igual a la de la comida, agrega un elemento a la lista de la cola y genera una nueva posicion de la comida
  
     [(and (puntos-cercanos estado (posn-x (nucleo-snake estado)) (posn-x (nucleo-food estado)))
           (puntos-cercanos estado (posn-y (nucleo-snake estado)) (posn-y (nucleo-food estado))))
      (modificar-score
       (modificar-food
        (modificar-tail
         (modificar-snake
          estado
          (cond
            [(equal? (nucleo-direccion estado) "arriba")
             (make-posn (posn-x (nucleo-snake estado)) (- (posn-y (nucleo-snake estado)) DELTA))]
            [(equal? (nucleo-direccion estado) "abajo")
             (make-posn (posn-x (nucleo-snake estado)) (+ DELTA (posn-y (nucleo-snake estado))))]
            [(equal? (nucleo-direccion estado) "izquierda")
             (make-posn (- (posn-x (nucleo-snake estado)) DELTA) (posn-y (nucleo-snake estado)))]
            [(equal? (nucleo-direccion estado) "derecha")
             (make-posn (+ DELTA (posn-x (nucleo-snake estado))) (posn-y (nucleo-snake estado)))])) ;nucleo-snake
         (cons (nucleo-snake estado) (nucleo-tail estado))) ;NUCLEO-TAIL
        (make-posn
         (round-to-mutiplodiez (random-acotado 10 (- ANCHO 10)))            ;nueva posiciones de comida
         (round-to-mutiplodiez (random-acotado 110 (- ALTO 10))) )) ;NUCLEO-FOOD
       (+ 10 (nucleo-score estado))) ;NUCLEO-SCORE

      ]


;CUADO SE CHOCA CON LA PARED O CON SU COLA
   [(or (se-choca-con-la-cola (nucleo-tail estado) (nucleo-snake estado)) (se-choca-con-la-pared estado)
        (negative? (nucleo-timer estado)))
    (modificar-direccion
     (modificar-tail
      (modificar-snake
       (modificar-vidas estado
                        (- (nucleo-vidas estado) 1))
       (nucleo-snake snake-INICIAL))
      (list (make-posn 90 200) (make-posn 80 200)))
     "quieto")
    ]


    [(equal? "arriba" (nucleo-direccion estado))
     (modificar-timer
      (modificar-direccion
      (modificar-tail
       (modificar-snake estado
                        (make-posn (posn-x (nucleo-snake estado))
                                   (- (posn-y (nucleo-snake estado)) DELTA)))
       (quitar-ultimo (cons (nucleo-snake estado) (nucleo-tail estado)))) "arriba")
      (- (nucleo-timer estado) (* DELTATIEMPO (nucleo-speed estado)))) ] 
    
    

    [(equal? "abajo" (nucleo-direccion estado))
     (modificar-timer (modificar-direccion
                       (modificar-tail (modificar-snake estado (make-posn
                                                                (posn-x (nucleo-snake estado))
                                                                (+ DELTA (posn-y (nucleo-snake estado))))) 
                                       (quitar-ultimo (cons (nucleo-snake estado) (nucleo-tail estado))))
                       "abajo")
                      (- (nucleo-timer estado) (* DELTATIEMPO (nucleo-speed estado))))]



    [(equal? "izquierda" (nucleo-direccion estado))
     (modificar-timer
      (modificar-direccion (modificar-tail
                            (modificar-snake estado 
                                             (make-posn (- (posn-x (nucleo-snake estado)) DELTA)
                                                        (posn-y (nucleo-snake estado))))
      (quitar-ultimo (cons (nucleo-snake estado) (nucleo-tail estado))))
      "izquierda")
      (- (nucleo-timer estado) (* DELTATIEMPO (nucleo-speed estado))))]
     
    
    [(equal? "derecha" (nucleo-direccion estado))
     (modificar-timer  (modificar-direccion (modificar-tail
                                             (modificar-snake
                                              estado
                                              (make-posn
                                               (+ DELTA (posn-x (nucleo-snake estado)))
                                               (posn-y (nucleo-snake estado))))
                                             (quitar-ultimo (cons (nucleo-snake estado) (nucleo-tail estado))))
                                            "derecha")
                       (- (nucleo-timer estado) (* DELTATIEMPO (nucleo-speed estado)))
                       )]
    
    [else estado]
    ))



;=========================COMENTARIO=========================
#;(
;ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=
                                           KEY-HANDLER
;ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=ON-KEY=
)
;=========================COMENTARIO=========================


(define (key-handler estado tecla)
     (cond

        [(key=? tecla "q")
         (modificar-timer estado 99999) ]
        
       [(key=? tecla " ")
     (make-nucleo
       3
       (nucleo-fondo estado)
       (nucleo-gname estado)
       4
       (nucleo-preselector estado)
       (nucleo-stopORstart estado)
       3
       #true
       (nucleo-snake snake-INICIAL)
       (list (make-posn 90 200) (make-posn 80 200))
       (nucleo-direccion snake-INICIAL)
       (nucleo-colorchar estado)
       (nucleo-colorback estado)
       (nucleo-food estado)
       (nucleo-score estado)
       (nucleo-rango estado)
       (nucleo-speed estado)
       (nucleo-fantasma estado)
       (nucleo-modopantalla estado)
       60
       (nucleo-highscores estado)
       )]

       [(key=? tecla "escape")
     INICIAL]
       
       [(equal? (nucleo-direccion estado) "derecha") (cond
                                                       [(or (key=? tecla "up") (key=? tecla "w"))
                                                        (modificar-direccion estado 
                                                                             "arriba")]
                                                       [(or (key=? tecla "down") (key=? tecla "s"))
                                                        (modificar-direccion estado 
                                                                             "abajo")]
                                                       [else estado]
                                                       )
                                                     ]

       [(equal? (nucleo-direccion estado) "izquierda") (cond
                                                         [(or (key=? tecla "up") (key=? tecla "w"))
                                                          (modificar-direccion estado 
                                                                               "arriba")]
                                                         [(or (key=? tecla "down") (key=? tecla "s"))
                                                          (modificar-direccion estado 
                                                                               "abajo")]
                                                         [else estado])]

       [(equal? (nucleo-direccion estado) "arriba") (cond
                                                      [(or (key=? tecla "left") (key=? tecla "a"))
                                                       (modificar-direccion estado 
                                                                            "izquierda")]
                                                      [(or (key=? tecla "right") (key=? tecla "d"))
                                                       (modificar-direccion estado 
                                                                            "derecha")]
                                                      [else estado])]
       [(equal? (nucleo-direccion estado) "abajo") (cond
                                                     [(or (key=? tecla "left") (key=? tecla "a"))
                                                      (modificar-direccion estado 
                                                                           "izquierda")]
                                                     [(or (key=? tecla "right") (key=? tecla "d"))
                                                      (modificar-direccion estado 
                                                                           "derecha")]
                                                     [else estado])]
       
    [(equal? (nucleo-direccion estado) "quieto")  (cond
            
                                                   [(or (key=? tecla "left") (key=? tecla "a"))
                                                    (modificar-direccion estado 
                                                                         "izquierda")]
                                                   [(or (key=? tecla "right") (key=? tecla "d"))
                                                    (modificar-direccion estado 
                                                                         "derecha")]
                                                   [(or (key=? tecla "up") (key=? tecla "w"))
                                                    (modificar-direccion estado 
                                                                         "arriba")]
                                                   [(or (key=? tecla "down") (key=? tecla "s"))
                                                    (modificar-direccion estado 
                                                                         "abajo")]
                                                   [else estado])]
    [else estado  ]))
  

;=========================COMENTARIO=========================
#;(
;ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=
                                            ON-MOUSE
;ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=
)

;                                              LIMITES DE LOS BOTONES


  ;                                           LIMITES DEL MENU juego 0 instancia 0

  
;limitar-area:
;estado number x (mouse) number number y (mouse) number number -> boolean
;limitar-area recibe la instancia del estado y las posiciones del mouse, y donde debe clickear para que devuelva verdadero, siendo min-x y max-x lo que acotan el eje x y min-y y max-y el eje y


  (define (limitar-area estado queinstancia x min-x max-x y min-y max-y)
  (and
   (= queinstancia (nucleo-instancia estado))
   (and
    (< min-x x) (< x max-x) (< min-y y) (< y max-y)))) 

;---------------------------------------------------------------------------------------------------LIMITES MENU
  
  (define (limite-boton-0-0-0 estado x y) ;boton "play"
    (limitar-area estado 0 x 200 600 y 0 100))

  (define (limite-preselector-izq estado x y) ;PRESELECTOR IZQUIERDO
    (limitar-area estado 0 x 100 200 y 0 100))


  (define (limite-preselector-der estado x y) ;PRESELECTOR DERECHO
    (limitar-area estado 0 x 600 700 y 0 100))
  
  
  (define (limite-boton-highscore estado x y)
    (limitar-area estado 0 x 200 600 y 125 225)) ;BOTON HIGHSCORE

  
  (define (limite-boton-0-0-1 estado x y) ;boton "opciones"
    (limitar-area estado 0 x 200 600 y (- (/ ALTO 2) 50) (+ (/ ALTO 2) 50))) ;250 

(define (limite-boton-0-0-1-bug estado x y) ;boton "opciones"
    (limitar-area estado 5 x 200 600 y (- (/ ALTO 2) 50) (+ (/ ALTO 2) 50)))

  (define (limite-boton-instrucciones estado x y) ;boton "instrucciones"
    (limitar-area estado 0 x 200 600 y 375 475))

  
  (define (limite-boton-0-0-2 estado x y) ;boton "salir"
    (limitar-area estado 0 x 200 600 y (- ALTO 100) ALTO))

;-----------------------------------------------------------------------------------LIMITES OPCIONES
(define (limite-volver estado x y) ;boton "volver"                     ;BOTON VOLVER
    (limitar-area estado 1 x 200 600 y 0 100))


(define (limite-boton-VIDAS estado x y) ;boton "BOTON1-VIDAS"              ;BOTON VIDAS
    (limitar-area estado 1 x 100 300 y 100 200))

  (define (limite-VIDAS-IZQ estado x y) ;VIDAS BOTON IZQUIERDO
    (limitar-area estado 1 x 0 100 y 100 200))


  (define (limite-VIDAS-DER estado x y) ;vidas BOTON DERECHO
    (limitar-area estado 1 x 300 400 y 100 200))                       ;BOTON VIDAS

;-------------------------------------

(define (limite-boton-SPEED estado x y) ;boton "BOTON1-SPEED"              ;BOTON SPEED
    (limitar-area estado 1 x 500 700 y 100 200))

  (define (limite-SPEED-IZQ estado x y) 
    (limitar-area estado 1 x 400 500 y 100 200))


  (define (limite-SPEED-DER estado x y) 
    (limitar-area estado 1 x 700 800 y 100 200))                       ;BOTON-end

;-------------------------------------------------------


(define (limite-boton-RANGO estado x y)                        ;BOTON RANGO CAPTURA
    (limitar-area estado 1 x 100 300 y 200 300))

  (define (limite-RANGO-IZQ estado x y) 
    (limitar-area estado 1 x 000 100 y 200 300))


  (define (limite-RANGO-DER estado x y) 
    (limitar-area estado 1 x 300 400 y 200 300))                       ;BOTON FIN

;------------------------------------------------------------------


(define (limite-boton-TIME estado x y)                            ;BOTON TIEMPO
    (limitar-area estado 1 x 500 700 y 200 300))

  (define (limite-TIME-IZQ estado x y) 
    (limitar-area estado 1 x 400 500 y 200 300))


  (define (limite-TIME-DER estado x y) 
    (limitar-area estado 1 x 700 800 y 200 300))                       ;BOTON-end

;------------------------------------------------------------------


(define (limite-boton-COLOR-FONDO estado x y)                        ;BOTON COLOR DE FONDO
    (limitar-area estado 1 x 100 300 y 300 400))

  (define (limite-C-FONDO-IZQ estado x y) 
    (limitar-area estado 1 x 000 100 y 300 400))


  (define (limite-C-FONDO-DER estado x y) 
    (limitar-area estado 1 x 300 400 y 300 400))                       ;BOTON FIN

;-------------------------------------------------------------------------------


(define (limite-boton-COLOR-PERSONAJE estado x y)                            ;BOTON COLOR DE PERSONAJE
    (limitar-area estado 1 x 500 700 y 300 400))

  (define (limite-C-PERSONAJE-IZQ estado x y) 
    (limitar-area estado 1 x 400 500 y 300 400))


  (define (limite-C-PERSONAJE-DER estado x y) 
    (limitar-area estado 1 x 700 800 y 300 400))                       ;BOTON-end

;-------------------------------------------------------------------------------

(define (limite-boton-RESET-HIGHSCORE estado x y)                        ;BOTON RESET-HIGHSCORES
    (limitar-area estado 1 x 100 300 y 400 500)
    )
;----------------------------------------------


(define (limite-boton-RESET-OPCIONES estado x y)                        ;BOTON RESET-OPCIONES
    (limitar-area estado 1 x 500 700 y 400 500))

;-----------------------------------
(define (limite-boton-PANTALLAMOD1 estado x y)                        ;BOTON NORMAL
  (limitar-area estado 1 x 100 300 y 500 600))

(define (limite-boton-PANTALLAMOD2 estado x y)                        ;BOTON FULLSCREEN
  (limitar-area estado 1 x 500 700 y 500 600))





;=========================COMENTARIO=========================

(define (mouse-handler estado x y event)
  (if
   (string=? event "button-down")
  (cond

    [(equal? (nucleo-instancia estado) 5)  ;------------------------click en post-deth scene
      (modificar-vidas (modificar-juego (modificar-instancia estado 0) 0) 3)]

    [(equal? (nucleo-instancia estado) 6)  ;------------------------click en instrucciones
      (modificar-juego (modificar-instancia estado 0) 0)]
;----------------------------------boton play del menu
    [(limite-boton-0-0-0 estado x y)

     (make-nucleo
      (cond
                      [(equal? "run-snake" (nucleo-preselector estado)) 3]
                      [(equal? "juego-2" (nucleo-preselector estado)) 7]
                      )
      (nucleo-fondo estado)
      (if (equal? "run-snake" (nucleo-preselector estado)) "Snake.rkt" "juego-2")
      4
      "run-snake"
      "stop"
      3
      #true
      (make-posn 100 400)
      (list
       (make-posn 90 400)
       (make-posn 80 400))
      "quieto"
      (nucleo-colorchar estado)
      (nucleo-colorback estado)
      (make-posn (/ ANCHO 2) (/ ALTO 2))
      0
      (nucleo-rango estado)
      (nucleo-speed estado)
      (nucleo-fantasma estado)
      (nucleo-modopantalla estado)
      (nucleo-timer estado)
      (nucleo-highscores estado))
       
      ]
;----------------------------------selectores
    [(limite-preselector-izq estado x y)
     (modificar-preselector estado
      (cond [(equal? (nucleo-preselector estado) "run-snake") "juego-2" ]
            [(equal? (nucleo-preselector estado) "juego-2") "run-snake" ]))]

    
     [(limite-preselector-der estado x y)
     (modificar-preselector estado
      (cond [(equal? (nucleo-preselector estado) "run-snake") "juego-2" ]
            [(equal? (nucleo-preselector estado) "juego-2") "run-snake" ]))]

;----------------------------------------------------highscore     
     [(limite-boton-highscore estado x y)
      (modificar-juego estado 7)]
;----------------------------------------------------OPCIONES

     [(limite-boton-0-0-1 estado x y)
      (modificar-instancia estado 1)]

;----------------------------------------------------INSTRUCCIONES
      [(limite-boton-instrucciones estado x y)
       (modificar-juego estado 6)]

      [(= (nucleo-juego estado) 6)
       (modificar-juego estado 0)]

;----------------------------------------------------SALIDA

      [ (limite-boton-0-0-2 estado x y) ;boton "salir"
        (modificar-instancia estado
                             2)]
      ;========================================================DENTRO DEL MENU OPCIONES

      [(limite-volver estado x y) ;boton "volver"
       (modificar-instancia (modificar-juego estado 0)
       0)]
       ;---------------------------------------------------------------------

      [(limite-VIDAS-IZQ estado x y) ;VIDAS BOTON IZQUIERDO
       (modificar-vidas estado (restar1 (nucleo-vidas estado))
       )]



      [(limite-VIDAS-DER estado x y) ;VIDAS BOTON DERECHO
       (modificar-vidas estado
       (+ (nucleo-vidas estado) 1))]
       
;---------------------------------------------------------VELOCIDAD
      [(limite-SPEED-IZQ estado x y)
       (modificar-speed estado 
                        (DECREMENTAR-VELOCIDAD (nucleo-speed estado))
       )]

      [(limite-SPEED-DER estado x y)
       (modificar-speed estado
                        (AUMENTAR-VELOCIDAD (nucleo-speed estado)))]
       
      ;--------------------------------------------RANGO
       [(limite-RANGO-IZQ estado x y)
        (modificar-rango estado (restar1d (nucleo-rango estado)))]

       [(limite-RANGO-DER estado x y)
        (modificar-rango estado
       (+ 10 (nucleo-rango estado)))]
       

       ;------------------------------------------TIME
       [(limite-TIME-IZQ estado x y)
        (modificar-timer estado
                         (restar1c (nucleo-timer estado))
                         )]

       [(limite-TIME-DER estado x y)
       (modificar-timer
        estado
       (+ 10 (nucleo-timer estado)))]
       
       

        ;-----------------------------------------COLOR FONDO
       [(limite-C-FONDO-IZQ estado x y)
        (modificar-colorback estado   (restar1b (nucleo-colorback estado)))] 
       

      [(limite-C-FONDO-DER estado x y)
       (modificar-colorback estado
                            (sumar1 (nucleo-colorback estado)))]

      ;--------------------------------------------COLOR PERSONAJE
      [(limite-C-PERSONAJE-IZQ estado x y)
       (modificar-colorchar estado
        (restar1b (nucleo-colorchar estado))
       )]

      [(limite-C-PERSONAJE-DER estado x y)
       (modificar-colorchar estado
       (sumar1 (nucleo-colorchar estado)))
       ]

     
      ;-----------------------------------------------------------
      [(limite-boton-RESET-HIGHSCORE estado x y)
       (modificar-highscores
        estado
        (list 0 0 0 0 0))]


      ;-----------------------------------------       ;BOTON RESET-OPCIONES
      [(limite-boton-RESET-OPCIONES estado x y)
       (make-nucleo
        0 ;juego nucleo
        menu ;fondo del menu
        "Nucleo - Emanuel Gonzalez" ;gname
        0 ;instancia de menu
        "run-snake" ;- preselector
        "stop" ;empieza detenido
        0 ;vidas ;cantidad de vidas disponibles
        #false ;alive
        (make-posn 0 0) ;snake head
        (list (make-posn 0 0) (make-posn 0 0)) ;cola
        "quieto" ;direccion
        0 ;color personaje
        0 ;color fondo
        (make-posn (/ ALTO 2) (/ ANCHO 2)) ;FOOD
        0
        20 ;rango
        0.02 ;speed 
        #false ;fantasta
        (nucleo-modopantalla estado)
        60 ;timer
        (nucleo-highscores estado)
        )]

      [(limite-boton-PANTALLAMOD1 estado x y)
       (modificar-modopantalla estado
       'normal
       )]

      [(limite-boton-PANTALLAMOD2 estado x y)
       (modificar-modopantalla estado
       'fullscreen)
      ]




      
;---------------------------------------------------
      [else estado]
    
    ) (if (= (nucleo-instancia estado) 5)
     (modificar-highscores estado (top-5 (cons (nucleo-score estado) (nucleo-highscores estado)) )) estado)))
      
;=========================COMENTARIO=========================
#;(
;ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=
                                            STOP-WHEN
;ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=ON-MOUSE=
)

(define (close estado)
   (equal? (nucleo-instancia estado) 2))
(define CHAU .

  )


(define (creditos estado)
  CHAU)
;=========================COMENTARIO=========================

(big-bang INICIAL 
          [to-draw manejador-pantalla]
          [on-tick tick-tock (nucleo-speed INICIAL)]
          [on-key key-handler]
          [on-mouse mouse-handler]
          [stop-when close creditos]
          [close-on-stop 2]
          [display-mode (nucleo-modopantalla INICIAL)]
          [name (nucleo-gname INICIAL)]
)
  
(printf "Emanuel Gonzalez - Proyecto 2")
