import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class OtpSCreen extends ConsumerWidget {
  final String verificationId;
  static const String routeName = '/otp-screen';
  const OtpSCreen({super.key, required this.verificationId});

  void verifyotp(WidgetRef ref, BuildContext context, String userOtp) {
    ref
        .read(AuthControllerProvider)
        .verifyOtp(context, verificationId, userOtp);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifying Your Phoneno'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text("We Have Sent an SMS with a code"),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: size.width * 0.5,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '- - - - - -',
                  ),
                  onChanged: (val) {
                    if (val.length == 6) {
                      verifyotp(ref, context, val.trim());
                    }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
