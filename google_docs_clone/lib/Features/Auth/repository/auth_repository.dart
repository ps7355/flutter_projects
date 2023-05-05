// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod/riverpod.dart';

final AuthRepositoryProvider =
    Provider((ref) => AuthRepository(googleSignIn: GoogleSignIn()));

class AuthRepository {
  GoogleSignIn _googleSignIn;
  AuthRepository({
    required GoogleSignIn googleSignIn,
  }) : _googleSignIn = googleSignIn;

  void signInwithGoogle() async {
    try {
      print('hai');
      final user = await _googleSignIn.signIn();
      if (user != null) {
        print(user.displayName);
        print(user.email);
        print(user.photoUrl);
      }
    } catch (e) {
      print(e);
    }
  }
}
