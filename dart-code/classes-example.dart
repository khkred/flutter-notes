void main() {
  Car car1 = new Car(); // The car has some memory

  car1.noOfGears = 6;

  car1.currentSpeed = 40;

  car1.accelerate();
  car1.accelerate();

  car1.brake();
}

// Model 3, Ford Bronco, Aventador, Brezza

class Car {
  var noOfWheels = 4;
  var noOfGears = 5;

  var maxSpeed = 120;
  var currentSpeed = 10;

  void accelerate() {
    currentSpeed += 10;
    print("Current Speed is $currentSpeed");
  }

  void brake() {
    currentSpeed -= 10;
    print("Current Speed is $currentSpeed");
  }
}
