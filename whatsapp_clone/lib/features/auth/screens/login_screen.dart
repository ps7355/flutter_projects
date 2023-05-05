import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/common/utils/utils.dart';
import 'package:whatsapp_clone/common/widgets/custom_button.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login-screen';

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final phonecontroller = TextEditingController();
  Country? country;

  @override
  void dispose() {
    super.dispose();
    phonecontroller.dispose();
  }

  void pickcountry() {
    return showCountryPicker(
        context: context,
        onSelect: (Country country_) {
          setState(() {
            country = country_;
          });
        });
  }

  void sendphoneno() {
    String phoneno = phonecontroller.text.trim();
    if (country != null && phoneno.isNotEmpty) {
      ref
          .read(AuthControllerProvider)
          .SingnInWithPhone(context, '+${country!.phoneCode}$phoneno');
    } else {
      ShowSnackBar(message: "Enter all the fields", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: backgroundColor,
        elevation: 0,
        title: const Text("Enter your phone no"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Whatsapp will need to verify you phone no",
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: pickcountry, child: const Text("Pick Country")),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  (country != null)
                      ? Text("+${country!.phoneCode}")
                      : const Text(""),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: size.width * 0.7,
                    child: TextField(
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "phone no", fillColor: textColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.6),
            SizedBox(
              width: 150,
              child: CustomButton(text: "Next", onpressed: () => sendphoneno()),
            )
          ],
        ),
      ),
    );
  }
}
