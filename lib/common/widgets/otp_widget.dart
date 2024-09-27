import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class OtpWidget extends StatefulWidget {
  const OtpWidget({super.key});

  @override
  State<OtpWidget> createState() => _OtpWidgetState();
}

class _OtpWidgetState extends State<OtpWidget> {
  final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.bgBlack.withOpacity(0.8))));
  String code = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              text: 'Please enter the code we just sent to number',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppColors.textBlack.withOpacity(0.8),
                    fontSize: 14,
                  ),
              children: const <TextSpan>[
                TextSpan(
                    text: ' ..92 31',
                    style: TextStyle(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            child: Pinput(
              length: 4,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: AppColors.primaryBlue),
              )),
              onCompleted: (pin) {
                setState(() {
                  code = pin;
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Didn’t receive OTP?',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.textBlack.withOpacity(0.7),
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {},
                child: Text('Resend Code',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: AppColors.primaryBlue,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
