/** Given KB */
byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

/** Excercise */
by(car, From, To) :- byCar(From, To).
by(train, From, To) :- byTrain(From, To).
by(plane, From, To) :- byPlane(From, To).

travel(From, To, go(From, To, WayOfTransportation)) :-
  by(WayOfTransportation, From, To).


travel(From, To, go(From, Via, WayOfTransportation, Path)) :-
  by(WayOfTransportation, From, Via),travel(Via, To, Path).
