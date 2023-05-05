import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/Screens/mobile_Screen.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/landing/screens/landing_screen.dart';

class exp extends ConsumerWidget {
  const exp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userAuthDataProvider).when(
          data: (User) {
            if (User != null) {
              return MobileLayoutScreen();
            } else {
              return LandingScreen();
            }
          },
          error: ((error, stackTrace) => ErrorScreen(error: error.toString())),
          loading: (() => LoadingScreen()),
        );
  }
}
