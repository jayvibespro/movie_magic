import 'package:daladala/core/utils/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../sign_up_screen/sign_up_screen.dart';
import 'sign_in_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../../../../core/di/di.dart';
import '../../../components/custom_material_button.dart';
import '../../../components/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final _signInScreenController = getIt<SignInScreenController>();

  @override
  void initState() {
    _signInScreenController.initialize(setState, context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: cBlack,
        systemNavigationBarColor: cBlack,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: cBlack,
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 20),
              FormBuilder(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign in to your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 100),
                    CustomTextField(
                      label: "Email",
                      hintText: "abc@gmail.com",
                      name: "email",
                      keyboardType: TextInputType.emailAddress,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.email(),
                      ]),
                    ),
                    CustomTextField(
                      label: "Password",
                      hintText: "********",
                      name: "password",
                      keyboardType: TextInputType.text,
                      isPassword: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    CustomMaterialButton(
                      onPressed: () {
                        /*   if (_formKey.currentState!.saveAndValidate()) {
                          _signInScreenController.state.user = UserModel(
                            email: _formKey.currentState?.value["email"].trim(),
                            password:
                                _formKey.currentState?.value["password"].trim(),
                          );
                          _signInScreenController.signIn();
                        }*/
                      },
                      label: "Sign in",
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () async {
                        /*   await Get.to(
                          () => const ResetPasswordScreen(),
                          transition: Transition.rightToLeft,
                          curve: Curves.easeInOutBack,
                          duration: const Duration(milliseconds: 1200),
                        );*/
                      },
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                          fontSize: 16,
                          color: cWhiteWithOpacity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        children: [
                          Expanded(child: Divider(color: cGrey)),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text("Or Continue With"),
                          ),
                          Expanded(child: Divider(color: cGrey)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            width: 0.5,
                            color: cWhiteWithOpacity.withOpacity(0.5),
                          ),
                        ),
                        child: Hero(
                          tag: "G_LOGO",
                          child: SvgPicture.asset(
                            "assets/svg/Google_G_logo.svg",
                            width: 40,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(child: Text("Don't have an account? ")),
                        TextButton(
                          onPressed: () async {
                            await Get.to(
                              () => const SignUpScreen(),
                              transition: Transition.rightToLeft,
                              curve: Curves.easeInOutBack,
                              duration: const Duration(milliseconds: 1200),
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(fontSize: 16, color: cPrimary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
