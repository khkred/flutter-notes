class Vehicle {
  void steerTheVehicle() {
    print("The vehicle is moving.");
  } }


class Engine {
  final _name;
  Engine(this._name);
  String lessOilConsumption(){
    return "It consumes less oil.";
  }
}

class Car implements Vehicle, Engine {

  var _name;

  @override
  String lessOilConsumption() {
    return 'Consumes less Oil';
  }

  @override
  void steerTheVehicle() {
    print('Steering the vehicle');
  }

  void ridingExperience(){
    print("This car gives good rides because it's a ${this._name}");

  }



}