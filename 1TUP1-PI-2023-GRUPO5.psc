Funcion valido <- validardni ( dni )
	Definir valido como logico
	si (dni>=5000000 y dni<=6999999) o (dni>=10000000 y dni<=60999999) Entonces
		valido<-falso
	sino 
		valido<-Verdadero
		Escribir "DNI INVALIDO. El DNI debe contener entre 7 y 8 dígitos, debe comenzar con 5, 6, y desde 10 hasta 60."
	FinSi
Fin Funcion

Algoritmo integradorFINAL
	Definir eleccion como entero
	Definir contadorbrasil, contadormendoza, contadormdq, contadorbariloche Como real
	Definir matrizpasajeros  como cadena
	Definir nombre, apellido, codigo como cadena
	Definir cantpasajeros, dni, i, j, edad, tarjeta como real 
	Definir valido como logico
	Definir matrizpreciofinal como real 
	Definir matrizdestinos Como cadena
	Definir contadormenoresdecincobariloche, contadormenoresdecincomdq, contadormenoresdecincomendoza, contadormenoresdecincobrasil como real 
	Definir recaudadoporbrasil, recaudadopormendoza, recaudadopormdq, recaudadoporbariloche Como Real
	
	Dimension matrizdestinos[4,3]
	
	//la cantidad de pasajeros en total pueden ser 60*4=240. 240 en total. 60 pasajeros maximo por cada destino. son 4 destinos. brasil, mendoza, bariloche y mdq. 
	//validamos que la cantidad de pasajeros see un numero mayor o igual a 1 y menor o igual a 240, con una estructura Repetir-mientras que 
	Repetir
		Escribir "ingrese la cantidad de pasajeros que contrataron viajes"
		leer cantpasajeros
		
		si !(cantpasajeros>=1 y cantpasajeros<=240)
			Escribir "LA CANTIDAD DE PASAJEROS DEBE SER ENTRE 1 Y 240"
		FinSi
	Mientras Que  !(cantpasajeros>=1 y cantpasajeros<=240)
	
	//la dimensio de las columas de la matriz es 8. apelliy y nombre, dni, edad, Ccodigo destino, etc. La dimension de las filas es la cantidad de pasajeros. 
	//la matriz precio final es  una matriz para almacenar lo que debe pagar cada pasajero. 
	dimension matrizpasajeros[cantpasajeros,8]
	Dimension matrizpreciofinal[cantpasajeros,1]
	
	//inicializamos los contadores en cero
	contadorbrasil<-0
	contadormendoza<-0
	contadormdq<-0
	contadorbariloche<-0
	
	contadormenoresdecincobariloche<-0
	contadormenoresdecincomdq<-0
	contadormenoresdecincobrasil<-0
	contadormenoresdecincomendoza<-0
	
	recaudadoporbrasil<-0
	recaudadopormendoza <-0
	recaudadopormdq<-0
	recaudadoporbariloche<-0
	
	//dentro del  /ciclo para/  el ususiario carga los datos por consola. 
	para i<-0 hasta cantpasajeros-1 Hacer
		
		//validdando el DNI con una funcion. validardni
		repetir 
			Escribir "ingrese el dni del pasajero  ", i+1
			leer dni 
			valido<-validardni(dni)
		Mientras Que valido 
		
		Escribir "ingrese apellido de pasajero", i+1
		leer apellido 
		
		Escribir "ingrese el nombre del pasajero",i+1
		leer nombre
		
		Escribir "ingrese la edad del pasajero ", i+1
		leer edad 
		
		//agregamos que ingrese tambien si abona con tarjeta de credito o no, ya que luego es necesario para hacer el reargo al precio base del pasaje. 
		Escribir "ABONA CON TARJETA DE CREDITO. 1-SI    2-NO "
		leer tarjeta
		
		MIENTRAS tarjeta<>1 y tarjeta<>2 Hacer
			Escribir "OPCION INVALIDA. ABONA CON TARJETA DE CREDITO?  INGRESE  1-SI    2-NO  "
			leer tarjeta
		FinMientras
		
		Escribir "Ingrese el codigo del destino, Brasil: BRA   -Mendoza: MZA   -Bariloche: BRC   - Mar del Plata: MDQ"
		leer codigo
		codigo<-mayusculas(codigo)
		
		//utilizamos contadores contar la cantidad de pasajeros por  destinos, y para la cantidad de menores para cada destino.
		si codigo="BRA" Entonces
			contadorbrasil<-contadorbrasil+1
		FINSI 
		
		si (codigo="BRA" y edad<5) Entonces
			contadormenoresdecincobrasil<-contadormenoresdecincobrasil+1
		FinSi
		
		SI codigo="MZA"
			contadormendoza<-contadormendoza+1
		FINSI 
		
		si (codigo="MZA" y edad<5)  Entonces
			contadormenoresdecincomendoza<-contadormenoresdecincomendoza+1
		FinSi
		
		si codigo="MDQ"
			contadormdq<-contadormdq+1
		finsi
		
		si (codigo="MDQ" y edad<5) Entonces
			contadormenoresdecincomdq<-contadormenoresdecincomdq+1
		FinSi
		
		si codigo="BRC"
			contadorbariloche<-contadorbariloche+1
		FINSI 
		
		si (codigo="BRC" y edad<5) Entonces
			contadormenoresdecincobariloche<-contadormenoresdecincobariloche+1
		FinSi
		
		//a continuacion, el usuario visualiza un cartel, cuando alcanza el maximo de 60 pasajeros por destino. 
		SI contadorbrasil=60 Entonces
			Escribir "NO hay mas destinos dosponibles para BRASIL"
		FinSi
		
		SI contadormendoza=60 Entonces
			Escribir "NO hay mas destinos dosponibles para MENDOZA"
		FinSi
		
		SI contadormdq=60 Entonces
			Escribir "NO hay mas destinos dosponibles para MAR DEL PLATA"
		FinSi
		
		SI contadorbariloche=60 Entonces
			Escribir "NO hay mas destinos dosponibles para BARILOCHE"
		FinSi
		
		//lo que no es texto lo coviertimos a texto, ya que la matriz bidimensional está definida como CADENA. 
		// el la primera columna almacenamos apellido y nombre concatenado, para luego poder ordenar la matriz por apellido y nombre. Si bien esa columna, no  se
		// muestra, es necesaria usarla para hacer un ordenamiento por apellido y nombre.
		matrizpasajeros[i,1]<-ConvertirATexto(edad)
		matrizpasajeros[i,2]<-codigo 
		matrizpasajeros[i,3]<-ConvertirATexto(dni)
		matrizpasajeros[i,6]<-nombre
		matrizpasajeros[i,7]<-apellido 
		matrizpasajeros[i,0]<-Concatenar(matrizpasajeros[i,7],matrizpasajeros[i,6])
		
		//a continuacioon en la matriz tambien agregamos columnas con los destinos y precios por destinos segun el codigo ingresado.
		// ya que luego deberemos usar esos datos para mostrar el importe final a pagar por pasajero, y el destino segun el codigo ingresado. 
		si matrizpasajeros[i,2]="BRA" Entonces
			matrizpasajeros[i,4]<-"BRASIL"
			matrizpasajeros[i,5]<-"25000"
		FinSi
		
		si matrizpasajeros[i,2]="MZA" Entonces
			matrizpasajeros[i,4]<-"MENDOZA"
			matrizpasajeros[i,5]<-"19000"
		FinSi
		
		si matrizpasajeros[i,2]="MDQ" Entonces
			matrizpasajeros[i,4]<-"MAR DEL PLATA"
			matrizpasajeros[i,5]<-"14000"
		FinSi
		
		si matrizpasajeros[i,2]="BRC" Entonces
			matrizpasajeros[i,4]<-"BARILOCHE"
			matrizpasajeros[i,5]<-"23000"
		FinSi
		
		//ahora calculamos cuanto debe abonar cada pasajero, segun sea mayor o menor de 5 años, y segun abone con tarjeta de credito o no. 
		si edad<5 y tarjeta=1 Entonces 
			matrizpreciofinal[i,0]<- (ConvertirANumero(matrizpasajeros[i,5]) +2000)*1.05
		sino 
			si edad<5  y tarjeta=2 Entonces
				matrizpreciofinal[i,0]<- (ConvertirANumero(matrizpasajeros[i,5]) +2000)
			SiNo
				si  edad>5  y tarjeta=1 Entonces
					matrizpreciofinal[i,0]<- (ConvertirANumero(matrizpasajeros[i,5]))*1.05
				SiNo
					matrizpreciofinal[i,0]<- (ConvertirANumero(matrizpasajeros[i,5]))
				FinSi
			FinSi
		FinSi
		
		//A CONTINUACION CALCULAMLS LA GANANCIA PARA CADA DESTUINO 
		si codigo="BRA" Entonces
			recaudadoporbrasil<-recaudadoporbrasil+matrizpreciofinal[i,0]
		FinSi
		
		SI codigo="MZA"
			recaudadopormendoza <-recaudadopormendoza+matrizpreciofinal[i,0]
		FinSi
		
		
		si codigo="MDQ"
			recaudadopormdq<-recaudadopormdq+matrizpreciofinal[i,0]
		FinSi
		
		si codigo="BRC"
			recaudadoporbariloche<-recaudadoporbariloche+matrizpreciofinal[i,0]
		FinSi
	FinPara
	
	//mostramos a continuacion algunos de los datos cargados por consola. Esto no lo pedia pero lo hacemos para poder visualizarlos y verificar los datos cargados por el usuario. 
	Escribir "los datos cargados por consola son "
	
	para i<-0 hasta cantpasajeros-1 Hacer
		Escribir matrizpasajeros[i,0] , "   ",  matrizpasajeros[i,1] , "   ",  matrizpasajeros[i,2] , "    ",  matrizpasajeros[i,3] , "   ",  matrizpasajeros[i,4] 
	FinPara
	
	//a continuacion mostramos el menu de opciones, luego de que el ususario haya cargado los datos de los pasajeros por consola. 
	Repetir
		Escribir "elija una opcion"
		Escribir "1- MOSTRAR LISTA DE PASAJEROS ODENADA POR APELLIDO Y NOMBRE "
		Escribir "2- MOSTRAR LISTA DE PASAJEROS ORDENADA POR CODIGO DE DESTINO "
		Escribir "3-MOSTRAR LISTA DE DESTINOS"
		Escribir "4-BUSCAR POR PASAJERO"
		Escribir "5-MOSTRAR ESTADISTICAS"
		Escribir "6-SALIR"
		leer eleccion 
		
		Segun eleccion Hacer
			1: ordenarporapellido(matrizpasajeros,cantpasajeros) // llamamos al subproceso que ordene la lista por apellido y nombres
				
			2:odenarporcodigo(matrizpasajeros, cantpasajeros)  // llamamos al subproceso que ordene la lista por codigo .
				
				//en la OPCION 3 llamamos al subproceso para mostrar la cantidad de pasajeros de cada destino,  y el TOTAL recaudado por todos los viajes vendidos. 
				//y lo racaudado por cada destino. 
				
			3: mostrarlistadedestinos(matrizdestinos, contadorbrasil, contadormendoza, contadormdq, contadorbariloche, recaudadoporbrasil,recaudadopormendoza,recaudadopormdq,recaudadoporbariloche) 
				
			4: busquedaPasajero(matrizpasajeros, cantpasajeros, matrizpreciofinal) // llamamos al subproceso para hacer una busqueda del pasajero por DNI. 
				
				//llamamos a subprocesos que muestra las estadisticas. 
			5:  escribir "PORCENTAJE DE CADA DESTINO "
				porcentajedestinos(contadorbrasil, contadormdq, contadormendoza, contadorbariloche,cantpasajeros)
				Escribir " "
				Escribir "DESTINO MAS SOLICITADO"
				destinoMasSolicitado(contadorbrasil, contadormendoza, contadormdq, contadorbariloche)
				Escribir ""
				Escribir "PORCENTAJE DE MENORES POR CADA DESTINO"
				porcentajemenoresdecincopordestino(contadormenoresdecincobariloche,contadormenoresdecincomdq,contadormenoresdecincomendoza,contadormenoresdecincobrasil, contadorbrasil, contadormendoza, contadormdq, contadorbariloche)
				
			6: escribir "GRACIAS POR UTLILIZAR NUESTROS SERVICIOS " //salida del sistema 
				Escribir "HASTA LUEGO!"
				Escribir "FACUNDO - JULIAN - LEONEL"
				
		    De Otro Modo:
				Escribir "OPCION INVALIDA"
		FinSegun
	Mientras Que !(eleccion=6)
FinAlgoritmo 

//ordenar la matriz por apellido  y nombre,  con ordenamiento burburja .
//se debe mostrar: apellido, nombre, dni, edad, destino 
SubProceso ordenarporapellido(matrizpasajeros,cantpasajeros)
	Definir i, j como entero
	Definir aux Como cadena 
	
	para j <- cantpasajeros-1 hasta 1 con paso -1 
		para i<-0 hasta j-1 con paso 1 Hacer
			si  matrizpasajeros[i,0] >matrizpasajeros[i+1,0] entonces
				
				aux<-matrizpasajeros[i,0] 
				matrizpasajeros[i,0] <-matrizpasajeros[i+1,0]
				matrizpasajeros[i+1,0]<- aux
				
				aux<-matrizpasajeros[i,7] 
				matrizpasajeros[i,7] <-matrizpasajeros[i+1,7]
				matrizpasajeros[i+1,7]<- aux
				
				aux<-matrizpasajeros[i,6] 
				matrizpasajeros[i,6] <-matrizpasajeros[i+1,6]
				matrizpasajeros[i+1,6]<- aux
				
				aux<-matrizpasajeros[i,3] 
				matrizpasajeros[i,3] <-matrizpasajeros[i+1,3]
				matrizpasajeros[i+1,3]<- aux
				
				aux<-matrizpasajeros[i,1] 
				matrizpasajeros[i,1] <-matrizpasajeros[i+1,1]
				matrizpasajeros[i+1,1]<- aux
				
				aux<-matrizpasajeros[i,4] 
				matrizpasajeros[i,4] <-matrizpasajeros[i+1,4]
				matrizpasajeros[i+1,4]<- aux
			FinSi
		FinPara
	FinPara
	
	Escribir "La lista de pasajeros ordenada por apellido y nombre es "
	
	Para i<-0 hasta cantpasajeros-1 Hacer
		Escribir  matrizpasajeros[i,7], "  ",matrizpasajeros[i,6], "  ",matrizpasajeros[i,3], "  ", matrizpasajeros[i,1], "  ", matrizpasajeros[i,4] 
	FinPara
FinSubProceso

//realizamos la busqueda del pasajero por DNI, Para eso hacemos una busqueda secuencial. 
SubProceso busquedaPasajero(matrizpasajeros, cantpasajeros, matrizpreciofinal)
	Definir dnibuscado como cadena
	Definir dni, posdnibuscado Como Entero
	Definir valido como logico
	
	Definir i, j Como Entero
	
	//para validar nuevamente el DNI utilizamos la funciion ya definida previamente VALIDARDNI. 
	repetir 
		Escribir "Ingrese el dni a buscar  "
		Leer dni
		valido<-validardni(dni)
	Mientras Que valido 
	
	dnibuscado<-convertiratexto(dni) // el dni lo convertimos a texto, ya que lo buscaremos en una matriz definida commo TIPO CADENA
	
	i <- 0
	Mientras i <= cantpasajeros - 1 Hacer
		si dnibuscado = matrizpasajeros[i,3] Entonces
			posdnibuscado<-i
			Escribir "Se encontró el pasajero ",  matrizpasajeros[posdnibuscado,7], " ",  matrizpasajeros[posdnibuscado,6],  "  con el DNI  ", matrizpasajeros[posdnibuscado,3], "  CON DESTINO A  ", matrizpasajeros[posdnibuscado,4], " DEBERA ABONAR: ", matrizpreciofinal[posdnibuscado,0]
			i <-  cantpasajeros - 1
		SiNo
			si dnibuscado <> matrizpasajeros[i,3] y i = cantpasajeros - 1 Entonces
				Escribir "DNI no encontrado "
			FinSi
		FinSi
		i <- i + 1
	FinMientras
FinSubProceso

//subproceso para indicar el destino mas solicitado. 
subproceso destinoMasSolicitado(contadorbrasil, contadormendoza, contadormdq, contadorbariloche) 
	si (contadorbrasil > contadormdq) y (contadorbrasil > contadormendoza) y (contadorbrasil > contadorbariloche) Entonces
		Escribir "El destino mas solicitado es Brasil "
	sino
		si (contadormdq > contadorbrasil) y (contadormdq > contadormendoza) y (contadormdq > contadorbariloche)
			Escribir "El destino mas solicitado es Mar del Plata"
	    SiNo
			si (contadormendoza> contadorbrasil) y (contadormendoza> contadormdq) y (contadormendoza> contadorbariloche) Entonces
				Escribir "El destino mas solicitado es Mendoza"
			SiNo
				si (contadorbariloche> contadorbrasil) y (contadorbariloche> contadormdq) y (contadorbariloche> contadormendoza) Entonces
					Escribir "El destino mas solicitado es Bariloche "
				FinSi
			FinSi
		finsi
	FinSi
FinSubProceso

//subproceso para indicar el porcentaje de menores de 5 anios por destino. 
SubProceso porcentajemenoresdecincopordestino(contadormenoresdecincobariloche,contadormenoresdecincomdq,contadormenoresdecincomendoza,contadormenoresdecincobrasil, contadorbrasil, contadormendoza, contadormdq, contadorbariloche)
	// lo hicimos de esta forma, ya que no se puede dividir por cero, en el caso de que algun destino tenga cero pasajeros. 
	si contadorbrasil>0 entonces
		Escribir "El porcentaje de menores de 5 años de BRASIL es:  ", (contadormenoresdecincobrasil/contadorbrasil)*100 "%"
	sino 
		si contadorbrasil=0 Entonces
			Escribir "El porcentaje de menores de 5 años de BRASIL es 0% :" 
		FinSi
	FinSi
	
	si contadormendoza>0 Entonces
		Escribir "El porcentaje de menores de 5 años de MENDOZA es:  ", (contadormenoresdecincomendoza/contadormendoza)*100 "%"
	sino 
		si contadormendoza=0 Entonces
			Escribir "El porcentaje de menores de 5 años de MENDOZA es 0% "
		FinSi
	FinSi
	
	si contadormdq>0 Entonces
		Escribir "El porcentaje de menores de 5 años de MAR DEL PLATA es:  ", (contadormenoresdecincomdq/contadormdq)*100 "%"
	sino
		si contadormdq=0 Entonces
			Escribir "El porcentaje de menores de 5 años DE MAR DEL PLATA es 0% "
		FinSi
	FinSi
	
	si contadorbariloche>0 Entonces
		Escribir "El porcentaje de menor de 5 años de BARILOCHE es:  ",  (contadormenoresdecincobariloche/contadorbariloche)*100 "%"
	SiNo
		SI contadorbariloche=0 Entonces
			Escribir "El porcentaje de menor de 5 años de BARILOCHE es: 0%" 
		FinSi
	FinSi 
FinSubProceso

//ordenar la matriz por codigo de destino, con ordenamiento burburja. para luego mostrar la lista ordenada por codigo. 
// se debe mostrar codigo, apellido, nombre, dni, edad 
SubProceso odenarporcodigo(matrizpasajeros, cantpasajeros)
	definir aux como cadena
	Definir i, j como entero
	para j <- cantpasajeros-1 hasta 1 con paso -1 
		para i<-0 hasta j-1 con paso 1 Hacer
			si  matrizpasajeros[i,2] >matrizpasajeros[i+1,2] entonces
				
				aux<-matrizpasajeros[i+1,2] 
				matrizpasajeros[i+1,2] <-matrizpasajeros[i,2]
				matrizpasajeros[i,2]<- aux
				
				aux<-matrizpasajeros[i+1,7] 
				matrizpasajeros[i+1,7] <-matrizpasajeros[i,7]
				matrizpasajeros[i,7]<- aux
				
				aux<-matrizpasajeros[i+1,6] 
				matrizpasajeros[i+1,6] <-matrizpasajeros[i,6]
				matrizpasajeros[i,6]<- aux
				
				aux<-matrizpasajeros[i+1,3] 
				matrizpasajeros[i+1,3] <-matrizpasajeros[i,3]
				matrizpasajeros[i,3]<- aux
				
				aux<-matrizpasajeros[i+1,1] 
				matrizpasajeros[i+1,1] <-matrizpasajeros[i,1]
				matrizpasajeros[i,1]<- aux
			FinSi
		FinPara
	FinPara
	
	//muestro la lista ordenada por codigo.  CODIGO, APELLIDO, NOMBRE, DNI, ,EDAD
	Escribir "La lista de pasajeros ordenada por codigos es "
	
	Para i<-0 hasta cantpasajeros-1 Hacer
		Escribir matrizpasajeros[i,2], "  ", matrizpasajeros[i,7], "  ",matrizpasajeros[i,6], "  ",matrizpasajeros[i,3], "  ", matrizpasajeros[i,1]     
	FinPara
FinSubProceso

// calculamos los porcentajes de cada destino 
SubProceso porcentajedestinos(contadorbrasil, contadormdq, contadormendoza, contadorbariloche,cantpasajeros)
	Definir porcentajebrasil, porcentajemdq, porcentajemendoza, porcentajebariloche como real 
	
	porcentajebrasil <- (contadorbrasil / cantpasajeros) *100
	porcentajemdq <- (contadormdq / cantpasajeros) *100
	porcentajemendoza <- (contadormendoza / cantpasajeros) *100
	porcentajebariloche <- (contadorbariloche / cantpasajeros) *100
	
	Escribir "El porcemtaje de pasajeros a BRASIL es ", porcentajebrasil "%"
	Escribir "El porcentaje de pasajeros a MAR DEL PLATA ES  ", porcentajemdq "%"
	Escribir "El porcentaje de pasajeros a MENDOZA es ", porcentajemendoza "%"
	Escribir "El porcentaje de pasajeros a bariloche es ", porcentajebariloche  "%"
FinSubProceso

//en este subproceso mostramos los codigos de cada destino, la cantidad de pasajeros por cada destino y el total recaudado por cada destino   
// mostramos tambien el total recaudado por todos los destinos. 
SubProceso mostrarlistadedestinos(matrizdestinos, contadorbrasil, contadormendoza, contadormdq, contadorbariloche, recaudadoporbrasil,recaudadopormendoza,recaudadopormdq,recaudadoporbariloche) 
	Definir i, j como entero
	Definir totalrecaudado como real
	totalrecaudado<-0
	
	matrizdestinos[0,0]<-"BRA"
	matrizdestinos[0,1]<-ConvertirATexto(contadorbrasil)
	matrizdestinos[0,2]<-ConvertirATexto(recaudadoporbrasil)
	matrizdestinos[1,0]<-"MZA"
	matrizdestinos[1,1]<-ConvertirATexto(contadormendoza)
	matrizdestinos[1,2]<-ConvertirATexto(recaudadopormendoza)
	matrizdestinos[2,0]<-"MDQ"
	matrizdestinos[2,1]<-ConvertirATexto(contadormdq)
	matrizdestinos[2,2]<-ConvertirATexto(recaudadopormdq)
	matrizdestinos[3,0]<-"BRC"
	matrizdestinos[3,1]<-ConvertirATexto(contadorbariloche)
	matrizdestinos[3,2]<-ConvertirATexto(recaudadoporbariloche)
	
	para i<-0 hasta 3 Hacer
		para j<-0 hasta 2
			Escribir matrizdestinos[i,j]  "  "Sin Saltar
		FinPara
		Escribir "  "  
	FinPara
	
	para i<-0 hasta 3 Hacer
		totalrecaudado<-totalrecaudado+ConvertirANumero(matrizdestinos[i,2])
	FinPara
	
	Escribir "El total recaudado por la venta de todos los viajes es ", totalrecaudado 
FinSubProceso
