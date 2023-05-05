import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/Screens/mobile_Screen.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/widgets/error.dart';
import 'package:whatsapp_clone/common/widgets/loader.dart';
import 'package:whatsapp_clone/example.dart';
import 'package:whatsapp_clone/exp.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/auth/screens/login_screen.dart';
import 'package:whatsapp_clone/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone/routes.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        title: "WhatsApp",
        onGenerateRoute: (Settings) => generateroute(Settings),
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(color: appBarColor)),
        debugShowCheckedModeBanner: false,
        home: exp()
        // ref.read(userAuthDataProvider).when(
        //     data: (user) {
        //       if (user == null) {
        //         return LandingScreen();
        //       } else {
        //         return MobileLayoutScreen();
        //       }
        //     },
        //     error: ((error, stackTrace) {
        //       return ErrorScreen(error: error.toString());
        //     }),
        //     loading: () => LoadingScreen())
        );
  }
}
