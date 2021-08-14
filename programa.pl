% Punto 1

% atiende(Nombre,Dia,Horario).
atiende(dodain,lunes,horario(9,15)).
atiende(dodain,miercoles,horario(9,15)).
atiende(dodain,viernes,horario(9,15)).
atiende(lucas,martes,horario(10,20)).
atiende(juanC,sabado,horario(18,22)).
atiende(juanC,domingo,horario(18,22)).
atiende(juanFdS,jueves,horario(10,20)).
atiende(juanFds,viernes,horario(12,20)).
atiende(leoC,lunes,horario(14,18)).
atiende(leoC,miercoles,horario(14,18)).
atiende(martu,miercoles,horario(23,24)).
atiende(vale,Dia,Horario):- atiende(dodain,Dia,Horario).
atiende(vale,Dia,Horario):- atiende(juanC,Dia,Horario).

% "nadie hace el mismo horario que leoC" no se hace nada por principio de universo cerrado todo lo que no este definido en el programa se considera falso.
% por ejemplo si consultamos ?- atiende(dodain,_,horario(14,18)) nos da falso y se cumple lo pedido

% "maiu está pensando si hace el horario de 0 a 8 los martes y miércoles" no se hace nada, maiu no atiende el kioskito y por principio de universo cerrado
% solo lo que esta definido en la base de conocimientos es verdadero.

% Punto 2

cuandoAtiende(Nombre,Dia,Hora):-
    atiende(Nombre,Dia,horario(Inicio,Fin)),
    between(Inicio, Fin, Hora).

% Punto 3

foreverAlone(Nombre,Dia,Hora):-
    cuandoAtiende(Nombre,Dia,Hora),
    not(estaAcompaniado(Nombre,Dia,Hora)).

estaAcompaniado(Nombre,Dia,Hora):-
    cuandoAtiende(OtroNombre,Dia,Hora),
    Nombre \= OtroNombre.

% Punto 4

posibilidadDeAtencion(Dia,Posibilidades):-
    findall(Nombres,quienesAtienden(Dia,_,Nombres),PosibilidadesRepetidas),
    list_to_set(PosibilidadesRepetidas, Posibilidades).
    

quienesAtienden(Dia,Hora,Nombres):-
    between(0,24,Hora),
    findall(Nombre,cuandoAtiende(Nombre,Dia,Hora),Nombres).

% Punto extra: inversibilidad y orden superior. La inversibilidad para las distintas combinaciones de Nombres en el predicado 'quienesAtienden'
% permite que el findall que es de orden superior junte esas combinaciones que satisfacen a 'quienesAtienden' en una lista. 

% Punto 5

vendio(dodain,fecha(lunes,10,agosto),[golosinas(1200),cigarrillos([jocke]),golosinas(50)]).
vendio(dodain,fecha(miercoles,12,agosto),[bebidas(si,8),bebidas(no,1),golosinas(10)]).
vendio(martu,fecha(miercoles,12,agosto),[golosinas(1000),cigarrillos([chesterfield,colorado,parisiennes])]).
vendio(lucas,fecha(martes,11,agosto),[golosinas(600)]).
vendio(lucas,fecha(martes,18,agosto),[bebidas(no,2),cigarrillos([derby])]).

kioskerxSuertudx(Nombre):-
    kioskerx(Nombre),
    forall(diaQueVendio(Nombre,Fecha),primeraVentaFueImportante(Nombre,Fecha)).

diaQueVendio(Nombre,Fecha):-
    vendio(Nombre,Fecha,_).

primeraVentaFueImportante(Nombre,Fecha):-
    primeraVenta(Nombre,Fecha,PrimeraVenta),
    importante(PrimeraVenta).

primeraVenta(Nombre,Fecha,PrimeraVenta):-
    vendio(Nombre,Fecha,Ventas),
    nth1(1,Ventas,PrimeraVenta).

importante(golosinas(Precio)):-
    Precio > 100.

importante(cigarrillos(Marcas)):-
    length(Marcas, Cantidad),
    Cantidad > 2.

importante(bebidas(si,_)).

importante(bebidas(_,Cantidad)):-
    Cantidad > 5.
    
kioskerx(Nombre):-
    vendio(Nombre,_,_).
