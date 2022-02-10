import 'dart:html';

void main() {
  Volume(length: Length(l: 30), 
  area: Area(b: 40, 
  height: Height(h: 50),),);
}

class Volume {
  Length length;
  Area area;
  Volume({required this.length, required this.area});
}

class Length {
  int l;

  Length({required this.l});
}

class Area {
  int b;
  Height height;
  Area({required this.b, required this.height});
}

class Height {
  int h;
  Height({required this.h});
}
