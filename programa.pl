%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BASE DE CONOCIMIENTOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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