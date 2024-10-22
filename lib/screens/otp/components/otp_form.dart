import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_ecommerce/components/my_default_button.dart';
import 'package:ui_ecommerce/constant.dart';
import 'package:ui_ecommerce/screens/home/home_screen.dart';
import 'package:ui_ecommerce/size_config.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({
    super.key,
  });

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String?> otp = List.filled(4, null);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              otp.length,
              (index) => OtpField(index: index, otp: otp),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.15,
          ),
          MyDefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                print(otp.join());
              }

              if (otp.isNotEmpty) {
                Navigator.pushNamed(context, HomeScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }
}

class OtpField extends StatefulWidget {
  const OtpField({
    super.key,
    required this.index,
    required this.otp,
  });

  final int index;
  final List<String?> otp;

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getPropScreenWidth(60),
      child: TextFormField(
        onSaved: (newValue) =>
            setState(() => widget.otp[widget.index] = newValue),
        onChanged: (value) {
          if (value.isEmpty && widget.index > 0) {
            FocusScope.of(context).previousFocus();
          } else if (value.isEmpty && widget.index == 0) {
            FocusScope.of(context).requestFocus();
          } else if (widget.index == widget.otp.length - 1) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        keyboardType: TextInputType.number,
        obscureText: true,
        maxLength: 1,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        buildCounter: (context,
                {required currentLength,
                required isFocused,
                required maxLength}) =>
            null,
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
        decoration: otpDecoration,
      ),
    );
  }
}
