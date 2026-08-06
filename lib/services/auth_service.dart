import '../models/user_model.dart';

class AuthService {

  AuthService._();
  static final AuthService instance = AuthService._();

  final allUsers = UserModel.allUsers;
  UserModel? currentUser;

  UserModel? login( String email, String password){
    try{
      final user = allUsers.firstWhere(
        (user) =>
            user.email == email &&
            user.password == password,
      );
      currentUser = user;
      return user;

    } catch (e) {
      return null;
    }
  }

  void logout() {
    currentUser = null;
  }

  bool get isLoggedIn => currentUser != null;
  UserModel? get loggedInUser => currentUser;

  bool register({

    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phone,
    required String location,
    required String address,

  }) {

    final exists = allUsers.any(
      (user) => user.email == email,
    );

    if (exists) {
      return false;
    }

    allUsers.add(
      UserModel(
        id: 2, //TO DO: autoincrement
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        phone: phone,
        location: location,
        address: address,
      ),
    );
    return true;
  }

  List<UserModel> get users => allUsers;

}