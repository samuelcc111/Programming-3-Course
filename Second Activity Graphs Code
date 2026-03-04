%Hechos:
arista(vancouver,edmonton,16).
arista(vancouver,calgary,13).
arista(edmonton,saskatoon,12).
arista(saskatoon,winnipeg,20).
arista(saskatoon,calgary,9).
arista(calgary,regina,14).
arista(calgary,edmonton,4).
arista(regina,winnipeg,4).
arista(regina,saskatoon,7).

%Conexiones sin recursividad:

conexion_directa(X,Y):-
    arista(X,Y,_).

%Conexiones con recursividad responde a "Es posible viajar desde edmonton a calgary?":

camino(X,Y):-
    arista(X,Y,_).

camino(X,Y):-
    arista(X,Z,_),
    camino(Z,Y).
%-----------------------------

%Costo de conexión sin recursividad (muestra las conexiones directas de un nodo) responde a "Construir una regla para determinar si un nodo tiene aristas"
%También responde a "Con qué nodos está conectado Regina y cuál es el costo de cada conexión?"
conectado_con(X,Y,Costo) :-
    arista(X,Y,Costo).

%Costo de conexiones con recursividad (muestra todas las conexiones aunque sean indirectas):

camino_costo(X,Y,C) :-
    arista(X,Y,C).

camino_costo(X,Y,CostoTotal) :-
    arista(X,Z,C1),
    camino_costo(Z,Y,C2),
    CostoTotal is C1 + C2.
%------------------------------------

%Costo de conexión entre X y Z pasando por Y sin recursividad:

costo_pasando_por(X,Y,Z,CostoTotal):-
    arista(X,Y,C1),
    arista(Y,Z,C2),
    CostoTotal is C1 + C2.
%costo_pasando_por solo funciona con conexiones directas.


%costo_pasando_por_rec permite trazar todas las rutas posibles sin necesidad de conexiones directas:

costo_pasando_por_rec(X,Y,Z,CostoTotal):-
    camino_costo(X,Y,C1),
    camino_costo(Y,Z,C2),
    CostoTotal is C1 + C2.





