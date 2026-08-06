class UserModel {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String phone;
  final String location;
  final String address;

 const UserModel({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.email,
  required this.password,
  required this.phone,
  required this.location,
  required this.address,
 });

 static final List<UserModel> allUsers = [
  UserModel(
    id: 1,
    firstName: "Hazel",
    lastName: "Kioko",
    email: "haze.kio@example.com",
    password: "password123",
    phone: "0712345678",
    location: "Langata",
    address: "23 Kwarara Road"
  ),
 ];
}