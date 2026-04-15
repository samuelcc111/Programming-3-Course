conexiones([conexion(ciudad(v), ciudad(e), costo(16)),
             conexion(ciudad(v), ciudad(c), costo(13)),
             conexion(ciudad(e), ciudad(s), costo(12)),
             conexion(ciudad(c), ciudad(r), costo(14)),
             conexion(ciudad(c), ciudad(e), costo(4)),
             conexion(ciudad(s), ciudad(c), costo(9)),
             conexion(ciudad(s), ciudad(w), costo(20)),
             conexion(ciudad(r), ciudad(s), costo(7)),
             conexion(ciudad(r), ciudad(w), costo(4))]).



conexion_directa(X,Y):-
    conexiones(L),
    member(conexion(X,Y,_), L).

conectado_con(X,Y,C):-
    conexiones(L),
    member(conexion(X,Y,costo(C)), L).


camino(X,Y):-
    camino(X, Y, [X]).

camino(X,Y,_):-
    conexiones(L),
    member(conexion(X, Y, _), L).

%camino(X,Y):-
    %conexiones(L),
    %member(conexion(X, Z, _), L),
    %camino(Z, Y).

%Entra en ciclo infinito al no encontrar el camino.
%Corregido. Para que no entre en ciclo infinito se tiene en cuenta las ciudades que ya recorrio.
camino(X, Y, Visitados):-
    conexiones(L),
    member(conexion(X, Z, _), L),
    \+ member(Z, Visitados),
    camino(Z, Y, [Z | Visitados]).

camino_costo(X, Y, C):-
    camino_costo(X, Y, [X], C).

camino_costo(X, Y, _, C):-
    conexiones(L),
    member(conexion(X, Y, costo(C)), L).
   

camino_costo(X, Y, Visitados, CTotal):-
    conexiones(L),
    member(conexion(X, Z, costo(C1)), L),
    \+ member(Z, Visitados),
    camino_costo(Z, Y, [Z | Visitados], C2),
    CTotal is C1 + C2.

costo_pasando_por(X, Y, Z, CTotal):-
    conectado_con(X, Y, C1),
    conectado_con(Y, Z, C2),
    CTotal is C1 + C2.

costo_pasando_por_rec(X, Y, Z, CTotal):-
    camino_costo(X, Y, C1),
    camino_costo(Y, Z, C2),
    CTotal is C1 + C2.

