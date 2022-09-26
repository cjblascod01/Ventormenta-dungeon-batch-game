@echo off
@setlocal EnableDelayedExpansion
mode 80,40
type logo.txt
pause>nul

:Menu
cls
color 0F
echo LA MAZMORRA DE VENTORMENTA
echo ===================
echo 1. Inicio
echo 2. Instrucciones
echo 3. Creditos
echo 4. Salir
echo ===================
set /p answer=Escribe el numero de la opcion y presiona Intro.
if %answer%==1 goto Inicio_1
if %answer%==2 goto Instrucciones
if %answer%==3 goto Creditos
if %answer%==4 goto Salir

:Salir
cls
echo Gracias por jugar!
pause>nul
exit

:Instrucciones
cls
echo Instrucciones
echo.
type instrucciones.txt
pause>nul
goto Menu

:Creditos
cls
type creditos.txt
pause>nul
goto Menu

:Inicio_1
rem STATS JUGADOR
set salud=100
set atq=10
set def=20
set exp=0
set nivel=1

set nivelD=0
set nivelA=0
set atqLevel=5*%nivelA%
set defLevel=5*%nivelD%

rem kills de NPCs
set kills=0

rem otras variables
set giroD=0
set giroI=0
set cofres=0
set trampas=0
set muertes=0

cls
echo Despiertas en una sala humeda y oscura, apenas entra luz por la puerta.
echo.
pause>nul
echo Te levantas de tu cama de paja y te diriges a la puerta.
echo.
pause>nul
echo Intentas abrirla pero esta cerrada, aun asi parece poder abrirse de alguna forma.
set /p puerta=Quieres intentar abrirla (A) o prefieres volver a dormir en tu cama de paja (D)? (A/D):
if %puerta% == A goto HERRAMIENTA
if %puerta% == D goto DORMIR

:HERRAMIENTA
cls
echo Decides buscar la forma de salir de abrir la puerta
:BUSCAR
set /p buscar=Solo tienes dos sitios donde buscar, en tu "cama" y detras de un antiguo tablon colgado en la pared. (C/T)
if %buscar% == C goto CAMA
if %buscar% == T goto TABLON

rem CAMA-------------------------------------------------------------------------------------
:CAMA
echo Parece que aqui dentro no hay nada, ademas te has cargado el unico sitio donde podias dormir
echo Vuelves a buscar por la celda...
pause>nul
cls
goto BUSCAR


rem TABLON-------------------------------------------------------------------------------------
:TABLON
echo Apartas el tablon y encuentras una pequeña palanca oxidada.
set atq=20
pause>nul
cls
echo Te acercas a la puerta e intentas forzarla...
echo GENIAL! Has conseguido abrirla.
pause>nul
goto PASILLO

:PASILLO
cls
echo *Sales de la celda*
echo.
pause>nul
echo Al fin puedes ver al luz, todo sigue siendo un gran pasillo humedo.
echo.
pause>nul
echo Escuchas cada vez mas cerca unos pasos
pause>nul
cls
color 13
echo Vigilante: Quien anda ahi?
echo.
pause>nul
echo Eh tu! Que haces fuera de tu celda? Te has buscado un buen problema.
set saludE=50
set atqE=30
set defE=0
echo.
pause>nul
goto COMBATE

:punto1
cls
color 0F
echo Has vencido al Vigilante y regeneras salud con una pocion que se le ha caido.
echo.
pause>nul
set salud=100
echo Ahora tu salud es: %salud%
echo.
pause>nul
echo Tienes via libre. 
echo.
pause>nul
echo El pasillo parece tener suficiente luz para seguir avanzando.
echo.
pause>nul
set /p lampara=Quieres recoger la lampara del vigilante? (S/N)
if %lampara%==S goto ARMAS
if %lampara%==N goto SEGUIR

:ARMAS
echo.
echo Has decidido recoger la lampara y gracias a la luz que emite has descubierto una especie de pasadizo.
echo.
set /p pasadizo= Quieres entrar al pasadizo? (S/N)
if %pasadizo%==S goto ARMAS2
if %pasadizo%==N goto SEGUIR

:ARMAS2
cls
echo Entras a la celda y encuentras 2 cofres.
echo.
pause>nul
echo En el cofre de la derecha hay una ESPADA y un ESCUDO
echo.
pause>nul
echo En el cofre de la izquierda hay una GRAN ESPADA
echo.
pause>nul
set /p armas= Quieres llevartelo todo pero pesa demasiado, que cofre eliges? (I/D)
if %armas%==I goto GRAN_ESPADA
if %armas%==D goto ESPADA_ESCUDO

:GRAN_ESPADA
echo.
set atq=40
echo Recoges la GRAN ESPADA del cofre y sales del pasadizo.
echo.
pause>nul
echo Tus stats ahora son Ataque:%atq% y Defensa:%def%
echo.
pause>nul
goto SEGUIR
:ESPADA_ESCUDO
echo.
set atq=30
set def=30
echo Recoges la ESPADA y el ESCUDO del cofre y sales del pasadizo.
echo.
pause>nul
echo Tus stats ahora son Ataque:%atq% y Defensa:%def%
echo.
pause>nul
goto SEGUIR

:SEGUIR
cls
color 0F
echo Sigues por el pasillo de la mazmorra.
echo.
pause>nul
echo Todo esta muy tranquilo. Hay goteras en el techo y se escuchan goteos constantes...
echo.
pause>nul
echo El pasillo se separa en dos caminos.
echo.
pause>nul
set /p lado= Por que lado quieres ir, Izquierda(I) o Derecha(D)? (I/D)
if %lado%==I goto IZQUIERDA
if %lado%==D goto DERECHA

:IZQUIERDA
echo Continuas por el camino de la izquierda...
echo.
set giroI=%giroI%+1
pause>nul
goto APARICION_EVENTUAL
:DERECHA
echo Continuas por el camino de la derecha...
echo.
set giroD=%giroD%+1
pause>nul
goto APARICION_EVENTUAL

:DORMIR
echo Decides irte a dormir un poco mas...
pause>nul
cls
echo Pasan los dias y sigues encerrado... Parece que tus dias acabaran en esta celda...
goto REINTENTO

:REINTENTO
echo Has sucumbido al poder de la mazmorra y has caido en su oscuridad, no has logrado escapar... Lo siento...
pause>nul
cls
set /p fin=Quieres volver a intentarlo? (S/N):
if %fin% ==S goto Menu
if %fin% ==N goto Salir

:APARICION_EVENTUAL
cls
set /a aparicion=%random% %% 5

if %aparicion%==0 goto NADA
if %aparicion%==1 goto COFRE
if %aparicion%==2 goto TRAMPA
if %aparicion%==3 goto KOBOLD
if %aparicion%==4 goto HUMANOIDE

:NADA
echo Sigues caminando en guardia pero no parece haber peligro cerca...
pause>nul
goto SEGUIR

:KOBOLD
color 60
rem STATS KOBOLD
set saludK=100
set atqK=30
set defK=10

echo Te has encontrado con un Kobold...
pause>nul
start Kobold.jpg
pause>nul
echo Kobold: Que hace un extraño por estos pasillos? Seguramente te hayas perdido... Pero no temas, voy a ayudarte a encontrar la salida facil *rie en kobold*
set saludE=%saludK%
set atqE=%atqK%
set defE=%defK%
echo.
pause>nul
goto COMBATE
:HUMANOIDE
color 50
rem STATS HUMANO
set saludH=100
set atqH=40
set defH=20

echo Te has encontrado con un Prisionero Humano...
pause>nul
start Humanoide.jpg
pause>nul
echo Humano: Que hace un prisionero como tu caminando por estos pasillos? Vuelve a tu celda o muere entre terrible sufrimiento
set saludE=%saludH%
set atqE=%atqH%
set defE=%defH%
echo.
pause>nul
goto COMBATE

:COFRE
cls
color 31
echo HAS ENCONTRADO UN COFRE MAGICO
set /a cofres=%cofres%+1
pause>nul
echo *lo abres*
pause>nul
echo Has encontrado una pocion *recuperas salud*
set /a salud=%salud%+50
echo Tu salud es de %salud%
pause>nul
goto SEGUIR

:TRAMPA
cls
color 20
set /a trampas=%trampas%+1
echo Has caido en una trampa y pierdes salud...
set /a salud=%salud%-20
echo Tu salud es de %salud%
if %salud% LEQ  0 goto REINTENTO
pause>nul
goto SEGUIR

:MINIBOSS
cls
color 0F
echo Has llegado a una sala enorme, esta mucho mas iluminada que el resto de la mazmorra...
echo Parece que has llegado al final... Pero es todo tan extraño...
echo.
pause>nul
color 03
cls
echo Voz misteriosa: Pero que tenemos por aqui? Parece que una sucia rata se ha escapado de su jaula *jajajajaja*.
echo.
pause>nul
echo Voz misteriosa:De verdad crees que vas a llegar mas lejos? Si fuera tu volveria arrastrandome a mi sucia celda y dejaria de intentar huir.
echo.
set /p volver= Deseas volver a tu celda(V) o quieres seguir adelante(S)? (V/S)
if %volver%==S goto MINIBOSS_CONTINUACION
echo Vuelves a tu celda y abandonas la idea de salir de esta mazmorra...
goto REINTENTO 

:MINIBOSS_CONTINUACION
cls
color 0F
echo Ves que se abre la puerta al fondo de la sala y por ella entra una extraña persona.
echo.
pause>nul
cls
color 03
echo Extraño: Veo que no tienes intenciones de irte, asique supongo que tendre que castigarte.
echo.
pause>nul
echo Extraño: Mmm... Dejame pensar... Creo que con quitarte la vida sera suficiente *jajajajajajaja*
echo.
pause>nul
echo Extraño: Bueno, donde estan mis modales? Antes morir debes saber quien soy.
echo.
pause>nul
echo Extraño: Bruegal Nudoferro, carcelero de esta mazmorra.
echo.
pause>nul
start BruegalNudoferro.jpg
echo.
pause>nul
echo Bruegal Nudoferro: Enseñame la fuerza del recluso que ha sido capaz de vencer a mis hombres
echo.
pause>nul
cls
color 0F
echo Te enfrentas al carcelero Bruegal Nudoferro
pause>nul
set saludE=120
set atqE=50
set defE=30
goto COMBATE

:PARTE2
cls
pause>nul
echo.
echo Has derrotado al carcelero Bruegal Nudoferro!
pause>nul
echo.
echo Has recogido la llave de su bolsillo y te diriges a abrir la puerta al final de la sala.
pause>nul
echo.
echo *Abres la puerta*
pause>nul
echo.
echo Parece que esta mazmorra no tiene fin, por lo que sigues avanzando...
goto SEGUIR

:FINAL_BOSS
cls
color 0F
echo Has conseguido llegar al final de la mazmorra
echo.
pause>nul
echo Estas a unos pasos de llegar a la sala final, ya alcanzas a ver el exterior.
echo.
pause>nul
echo De pronto una puerta enorme de acero cae cortandote el paso.
echo.
pause>nul
echo Estabas tan cerca... Ya casi habias logrado escapar...
echo.
pause>nul
cls
color 04
echo Voz misteriosa: Acaso pensabas que escapar seria tan facil? *jajajajajaja* que iluso eres.
echo.
pause>nul
echo Voz misteriosa: Nadie, repito, NADIE! podra escapar jamas de esta mazmorra mientras yo este al mando.
echo.
pause>nul
echo Voz misteriosa: Dejame presentarme, Soy Dextren Tutor.
echo.
pause>nul
cls
start DextrenTutor.jpg
echo.
pause>nul
echo Dextren Tutor: No se como harias para derrotar a mi mejor hombre, pero te aseguro que contra mi no correras la misma suerte.
pause>nul
color 0F
set saludE=150
set atqE=60
set defE=40
goto COMBATE

:COMBATE
rem usuario
set /a atqT=%atq%+%atqLevel%
set /a defT=%def%+%defLevel%
set /a ataque=%atqT%
set /a defensa=%defT%
echo Tu nivel es: %nivel%
echo Tus stats de combate son: Ataque:%ataque% ,Defensa:%defensa% y Salud:%salud%
pause>nul
rem enemigo
set /a ataqueE=%atqE%
set /a defensaE=%defE%
echo Las stats de combate del Enemigo son: Ataque:%ataqueE%,  Defensa:%defensaE% y Salud:%saludE%
echo.
pause>nul

:LOOP

set /a dañoU=%ataque%-%defensaE%
if %ataque% LEQ %defensaE% set dañoU=10
set /a saludE=%saludE%-%dañoU%
echo Has infringido %dañoU% de daño! La salud del enemigo es de %saludE%
echo.
pause>nul
if %saludE% LEQ 0 goto ganas

set /a dañoE=%ataqueE%-%defensa%
if %ataqueE% LEQ %defensa% set dañoE=10
set /a salud=%salud%-%dañoE%
echo El enemigo te ha infringido %dañoE% de daño! Tu salud es de %salud%
echo.
pause>nul
if %salud% LEQ  0 goto pierdes

goto LOOP

:pierdes
echo HAS PERDIDO EL COMBATE
set /a muertes=%muertes%+1
echo %muertes% > intentos.txt
pause>nul
goto REINTENTO

:ganas
echo HAS GANADO EL COMBATE
echo Has ganado 5 de experiencia
set /a exp=%exp%+5
set /a kills=%kills%+1
IF %kills%==1 goto punto1
rem IF %kills%==9 goto SAVE
if %kills%==9 goto PARTE2
IF %kills%==17 goto FINAL_COMPLETADO
if %exp%==10 goto LEVEL_UP
pause>nul
goto SEGUIR

:LEVEL_UP
set /a nivel=%nivel%+1
set exp=0
echo Has subido de nivel
set /p mejora=Quieres mejorar tu ataque o tu defensa? (A/D)
if %mejora% == A set /a atqLevel=%atqLevel%+5
if %mejora% == D set /a defLevel=%defLevel%+5
set /a atqT=%atq%+%atqLevel%
set /a defT=%def%+%defLevel%
echo Has mejorado tu %mejora% en 5 puntos.
echo Tus stats ahora son de: Ataque %atqT%, Defensa %defT%
pause>nul
echo.
set /a salud=%salud%+20
echo Has ganado 20 puntos de salud. Ahora tu salud es de: %salud%.
pause>nul
if %nivel%==4 goto MINIBOSS
if %nivel%==8 goto FINAL_BOSS
goto SEGUIR

:FINAL_COMPLETADO
cls
set /p muertes=<intentos.txt
color 0F
echo FELICIDADES, HAS COMPLETADO EL JUEGO!
pause>nul
echo.
echo Estas son tus estadisticas finales:
pause>nul
echo.
echo ------Stats-------
echo Nivel: %nivel%
echo Ataque: %ataque%
echo Defensa: %defensa%
echo Salud: %salud%
echo Kills: %kills%
echo ------------------
echo.
echo ------Extras------
echo Intentos: %muertes%
echo Giros Derecha: %giroD%
echo Giros Izquierda: %giroI%
echo Trampas: %trampas%
echo Cofres: %cofres%
echo ------------------ 
pause>nul
goto CREDITOS

rem NO IMPLEMENTADO AUN
:SAVE
echo FELICIDADES! Has completado la primera parte de la mazmorra.
echo.
pause>nul
echo GUARDANDO PROGRESO


echo ------------------ > save.txt
echo ---- Progreso ---- >> save.txt
echo ------------------ >> save.txt
echo. >> save.txt
echo. >> save.txt
echo ------Stats------- >> save.txt
echo Nivel: >> save.txt
echo Ataque:  >> save.txt
echo Defensa:  >> save.txt
echo Salud:  >> save.txt
echo Kills:  >> save.txt
echo Experiencia:  >> save.txt
echo ------------------  >> save.txt