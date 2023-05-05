// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_docs_clone/Features/Auth/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

final AuthControllerProvider = Provider((ref) {
  final repository = ref.read(AuthRepositoryProvider);
  return AuthController(repository: repository);
});

class AuthController {
  AuthRepository repository;
  AuthController({
    required this.repository,
  });

  void signInwithGoogle() {
    repository.signInwithGoogle();
  }
}
