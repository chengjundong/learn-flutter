void main() {

  Tesla().run();
  Tesla().stop();

  Tesla? t;

  Garage<Vehicle> garage = Garage();
  garage.park(t?? Tesla());
  print(garage.unpark()?.runtimeType);
}

class MathUtil {

  bool? isPrint;

  MathUtil(this.isPrint);

  MathUtil.create(MathUtil mu);

  int sum(int v1, int v2) {
    if (isPrint ?? false) {
      this._print("$v1 + $v2 = ${v1 + v2}");
    }
    return v1 + v2;
  }

  _print(String msg) {
    print(msg);
  }
}

// Singleton pattern
class Logger {
  static final Logger _instance = Logger._newInstance();

  String _owner = "jucheng";

  Logger._newInstance();

  factory Logger() {
    return _instance;
  }

  String? get owner => _owner;
  set setOwner(String owner) => _owner = owner;
}

abstract class Vehicle {
  void run();

  void stop() {
    print("Vehicle stop");
  }
}

mixin Car on Vehicle {
  @override
  void run() {
    print("Car run");
  }
}

class Truck implements Vehicle {
  @override
  void run() {
    print("Truck run");
  }

  @override
  void stop() {
    print("Vehicle stop");
  }
}

class Tesla extends Vehicle with Car {

}

class Garage<T extends Vehicle> {
  T? vehicle;

  void park(T vehicle) {
    this.vehicle = vehicle;
  }

  T? unpark() {
    T? t = this.vehicle;
    this.vehicle = null;
    return t;
  }
}