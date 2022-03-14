class Bicycle {
  int cadence;
  int _speed = 0;
  int gear;

  int get speed => _speed;

  Bicycle(this.cadence, this._speed, this.gear);

  @override
  String toString() => 'Bicycle: $_speed mph';
}