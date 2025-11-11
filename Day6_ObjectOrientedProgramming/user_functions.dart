import 'user.dart';
import 'customer.dart';
import 'admin.dart';

User? findUserByEmail(List<User> users, String email) {
  try {
    return users.firstWhere((user) => user.email == email);
  } catch (e) {
    return null;
  }
}

void sortUsersByEmail(List<User> users) {
  users.sort((a, b) => a.email.compareTo(b.email));
}

List<Admin> getAdminsWithPermission(List<Admin> admins, String permission) {
  return admins
      .where((admin) => admin.permissions.contains(permission))
      .toList();
}

List<Customer> getCustomersByAddress(List<Customer> customers, String address) {
  return customers
      .where((customer) =>
          customer.address.toLowerCase() == address.toLowerCase())
      .toList();
}