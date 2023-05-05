import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone/Features/Auth/repository/auth_repository.dart';

import '../../../colors.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  void SignInWithGoogle(WidgetRef ref) {
    ref.watch(AuthRepositoryProvider).signInwithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          onPressed: () => SignInWithGoogle(ref),
          icon: Image.asset(
            'Assets/images/2d.png',
            height: 20,
            width: 20,
          ),
          label: Text(
            'Sign In With Google',
            style: TextStyle(color: blackcolor),
          ),
          style: ElevatedButton.styleFrom(
              backgroundColor: whitecolor, minimumSize: const Size(150, 50)),
        ),
      ),
    );
  }
}
