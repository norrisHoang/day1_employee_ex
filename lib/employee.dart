import 'dart:ffi';

class Employee {
  late String name;
  late String age;
  late String address;
  String sex;

  Employee({required this.name, required this.age, required this.address, required this.sex});

  @override
  String toString() {
    // TODO: implement toString
    return '${this.name} - ${this.age} - ${this.address} - ${this.sex}';
  }

}