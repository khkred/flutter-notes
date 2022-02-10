void main() {
  
  var dimension = Dimensions(24,56);
  
  var height = Height(34);
  
  areaOfCuboid(dimension.length,dimension.breadth,height.height);
  
  
}


void areaOfCuboid(int length, int breadth, int height) {
  
  print (length*breadth*height);
  
}


class Dimensions {
  
  int length;
  int breadth;
  Dimensions(this.length,this.breadth);
}

class Height
{
  int height;
  
  Height(this.height);
}