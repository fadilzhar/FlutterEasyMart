import 'package:flutter/material.dart';
import 'package:ui_ecommerce/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp Verification"),
        centerTitle: true,
      ),
      body: const Body(),
    );
  }
}
