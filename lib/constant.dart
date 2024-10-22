import 'package:flutter/material.dart';
import 'package:ui_ecommerce/size_config.dart';

const kPrimaryColor = Color.fromARGB(255, 247, 139, 139);
const kPrimaryLightColor = Color(0xffffecdf);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffffa53e),
    Color(0xffff7643),
  ],
);

const kSecondaryColor = Color(0xff979797);
const kTextColor = Color(0xff757575);
const kAnimationDuration = Duration(milliseconds: 200);
const inActiveIconColor = const Color(0xffb6b6b6);

final headingStyle = TextStyle(
  fontSize: getPropScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";

// complete profile
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

// otp style

final otpDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(
    vertical: getPropScreenWidth(15),
  ),
  enabledBorder: otpOutlineInputBorder(),
  focusedBorder: otpOutlineInputBorder(),
  border: otpOutlineInputBorder(),
);

OutlineInputBorder otpOutlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(color: kTextColor));
}

const defaultDuration = Duration(milliseconds: 250);

// const for see more
TextStyle seeMoreStyle = TextStyle(
  fontSize: getPropScreenWidth(14),
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);
