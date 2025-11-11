import 'user.dart';

class Admin extends User {
  
  List<String> permissions;

  Admin(String email, String password, this.permissions) 
      : super(email, password);

  factory Admin.fromJson(Map<String, dynamic> json) {
    List<String> perms = List<String>.from(json['permissions']);
    return Admin(
      json['email'],
      json['password'],
      perms,
    );
  }

  @override
  void showDetails() {
    print("--- Detail Admin ---");
    print("Email: $email");
    print("Permissions: ${permissions.join(', ')}");
  }
}