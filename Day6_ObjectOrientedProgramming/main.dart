import 'user.dart';
import 'customer.dart';
import 'admin.dart';
import 'user_functions.dart';

void main() {
    List<Map<String, dynamic>> customerData = [
    {"name": "John Doe", "email": "john.doe@example.com", "password": "password123", "address": "Jakarta"},
    {"name": "Jane Smith", "email": "jane.smith@example.com", "password": "secure456", "address": "Bandung"},
    {"name": "Andi Pratama", "email": "andi.pratama@example.com", "password": "flutter789", "address": "Surabaya"},
    {"name": "Siti Rahma", "email": "siti.rahma@example.com", "password": "coding001", "address": "Yogyakarta"},
    {"name": "Budi Santoso", "email": "budi.santoso@example.com", "password": "passpass", "address": "Semarang"}
  ];

  List<Map<String, dynamic>> adminData = [
    {"email": "admin1@example.com", "password": "adminpass1", "permissions": ["add", "edit", "delete"]},
    {"email": "admin2@example.com", "password": "adminpass2", "permissions": ["add", "view"]},
    {"email": "admin3@example.com", "password": "adminpass3", "permissions": ["edit", "delete"]},
    {"email": "admin4@example.com", "password": "adminpass4", "permissions": ["view"]},
    {"email": "admin5@example.com", "password": "adminpass5", "permissions": ["add", "edit"]}
  ];

  List<Customer> customers = customerData
      .map((data) => Customer.fromJson(data))
      .toList();
  List<Admin> admins = adminData
      .map((data) => Admin.fromJson(data))
      .toList();
  List<User> allUsers = [...customers, ...admins];

  print("--- DEMO HASIL ASSIGNMENT ---");

  print("\n--- Login ---");
  bool loginSukses = customers[0].login("john.doe@example.com", "password123");
  print("Login John Doe (sukses): $loginSukses");

  print("\n--- Menampilkan detail data---");
  customers[3].showDetails();
  admins[0].showDetails();

  print("\n--- Mencari user berdasarkan email ---");
  User? foundUser = findUserByEmail(allUsers, "andi.pratama@example.com");
  foundUser?.showDetails();

  print("\n--- Sortir user berdasarkan email ---");
  print("Email sebelum disortir: ${allUsers.map((u) => u.email).toList()}");

  sortUsersByEmail(allUsers);
  print("Email setelah disortir: ${allUsers.map((u) => u.email).toList()}");

  print("\n--- Mencari admin dengan izin 'add' ---");
  List<Admin> adminsWithAdd = getAdminsWithPermission(admins, "add");
  for (var admin in adminsWithAdd) {
    print("- ${admin.email} memiliki izin 'add'");
  }

  print("\n--- Mencari customer berdasarkan alamat 'Jakarta' ---");
  List<Customer> customersFromJakarta = getCustomersByAddress(customers, "Jakarta");
  for (var customer in customersFromJakarta) {
    print("- ${customer.name} tinggal di Jakarta");
  }
}