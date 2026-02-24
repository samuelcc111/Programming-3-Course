%Hechos:

% X país es enemigo de EU:
enemigo(corea_del_sur, eu).

% Nacionalidad de persona:
estadounidense(coronel_west).
estadounidense(samuel).

% Corea tiene X objeto, por tanto alguien se lo vendió
tiene(corea_del_sur, misil1).
tiene(corea_del_sur, pollo_frisby).
misil(misil1).
comida(pollo_frisby).

% X persona vendió Y objeto a Z país.
vendio(coronel_west, misil1, corea_del_sur).
vendio(samuel, pollo_frisby, colombia).

% Se establece que los misiles son armas.
arma(X) :- misil(X).

% Se establece la Ley 😡
criminal(X) :-
    estadounidense(X),
    vendio(X, Objeto, Pais),
    arma(Objeto),
    enemigo(Pais, eu).