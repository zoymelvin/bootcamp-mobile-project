import 'user.dart';

class Customer extends User {
  
  String name;
  String address;

  Customer(String email, String password, this.name, this.address)
      : super(email, password);

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      json['email'],
      json['password'],
      json['name'],
      json['address'],
    );
  }

  @override
  void showDetails() {
    print("--- Detail Customer ---");
    print("Name: $name");
    print("Email: $email");
    print("Address: $address");
  }
}