// Dart imports:
import 'dart:developer';

// Flutter imports:
import 'package:cobra/presentation/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../helpers/show_alerts.dart';
import '../../../services/auth_service.dart';
import '../../widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  static const name = 'register-screen';

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CobraLogo(),
              _RegisterTitle(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: Colors.green.shade200.withOpacity(0.2),
                ),
                child: _RegisterForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final registerPvdr = Provider.of<RegisterProvider>(context);
    final authService = Provider.of<AuthService>(context);
    GlobalKey<FormState> registerGlobalKey = GlobalKey<FormState>();

    return Form(
      key: registerGlobalKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextFormField(
            textEditingController: registerPvdr.firstNameCtrl,
            keyboardType: TextInputType.text,
            hintText: 'Enter your name',
            prefixIcon:
                Icon(Ionicons.person_outline, color: Colors.green.shade800),
            maxLines: 1,
            enabled: !authService.isRegistering,
            validator: (value) => registerPvdr.nameValidator(value!),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: registerPvdr.lastNameCtrl,
            keyboardType: TextInputType.text,
            hintText: 'Enter your last name',
            prefixIcon:
                Icon(Ionicons.person_outline, color: Colors.green.shade800),
            maxLines: 1,
            enabled: !authService.isRegistering,
            validator: (value) => registerPvdr.nameValidator(value!),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: registerPvdr.birthCtrl,
            readOnly: true,
            hintText: 'Select your birthday',
            prefixIcon: Icon(Ionicons.calendar_clear_outline,
                color: Colors.green.shade800),
            maxLines: 1,
            enabled: !authService.isRegistering,
            onTap: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now(),
                dateFormat: "dd-MMMM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: false,
                titleText: '',
                itemTextStyle: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              );

              // registerPvdr.birthCtrl.text =
              //     DateFormat('yMMMd').format(datePicked!);
              registerPvdr.birthCtrl.text =
                  DateFormat('yMMMd').format(datePicked!);
              registerPvdr.birthFormattedToRegister =
                  DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'")
                      .format(datePicked.toUtc());
              ;
              log('Date--> ${registerPvdr.birthCtrl.text}');
            },
            validator: (value) => registerPvdr.birthdayValidator(value!),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: registerPvdr.emailCtrl,
            keyboardType: TextInputType.emailAddress,
            hintText: 'Enter your email',
            prefixIcon:
                Icon(Ionicons.mail_outline, color: Colors.green.shade800),
            maxLines: 1,
            enabled: !authService.isRegistering,
            validator: (value) => registerPvdr.emailValidator(value!),
          ),
          SizedBox(height: 16.h),
          CustomTextFormField(
            textEditingController: registerPvdr.pswdCtrl,
            keyboardType: TextInputType.text,
            obscureText: false,
            maxLines: 1,
            errorMaxLines: 3,
            enabled: !authService.isRegistering,
            hintText: 'Enter your password',
            prefixIcon:
                Icon(Ionicons.key_outline, color: Colors.green.shade800),
            validator: (value) => registerPvdr.passWordValidator(value!),
          ),
          SizedBox(height: 40.h),
          CustomButton(
            text: 'Continue',
            isLoading: authService.isRegistering,
            onTap: () async {
              if (!registerGlobalKey.currentState!.validate()) return;

              final registerResp = await authService.register(
                registerPvdr.emailCtrl.text.trim(),
                registerPvdr.firstNameCtrl.text.trim(),
                registerPvdr.lastNameCtrl.text.trim(),
                registerPvdr.birthFormattedToRegister,
                registerPvdr.pswdCtrl.text.trim(),
              );

              if (context.mounted) {}

              if (registerResp == '200') {
                registerPvdr.clearTxtEditingCtrlr();
                showAlert(
                  context,
                  'Successful Registration!',
                  "Let's continue and Log in.",
                  'Continue',
                  () => context.pushReplacement('/login-screen'),
                );
              } else {
                showAlert(
                  context,
                  'Register Failed',
                  registerResp,
                  'Ok',
                  () => context.pop(),
                );
              }
            },
          ),
          SizedBox(height: 16.h),
          _LoginOption()
        ],
      ),
    );
  }
}

class _RegisterTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, bottom: 5.h),
        child: Text(
          'Register',
          style: TextStyle(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            color: Colors.green.shade800,
          ),
        ),
      ),
    );
  }
}

class _LoginOption extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.fromLTRB(20.w, 20.h, 0.w, 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(r"""Already have an account? """),
            InkWell(
              enableFeedback: true,
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.push('/login-screen'),
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green.shade800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
