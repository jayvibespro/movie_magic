import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/components/custom_snack_bar.dart';
import 'package:daladala/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/custom_back_button.dart';
import '../../../components/custom_loader.dart';
import 'sign_up_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '../../../../../core/di/di.dart';
import '../../../components/custom_material_button.dart';
import '../../../components/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final SignUpScreenController _signUpScreenController =
      getIt<SignUpScreenController>();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    _signUpScreenController.initialize(setState, context);
    super.initState();
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
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
                    Row(children: [CustomBackButton()]),
                    const Text(
                      "Create your account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),

                    const SizedBox(height: 40),
                    CustomTextField(
                      focusNode: emailFocusNode,
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
                      focusNode: passwordFocusNode,
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
                    CustomTextField(
                      focusNode: confirmPasswordFocusNode,
                      label: "Confirm Password",
                      hintText: "********",
                      name: "confirmPassword",
                      keyboardType: TextInputType.text,
                      isPassword: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),
                      ]),
                    ),
                    _signUpScreenController.state.loading
                        ? CustomLoader()
                        : CustomMaterialButton(
                          onPressed: () {
                            if (_formKey.currentState!.saveAndValidate()) {
                              if (_formKey.currentState?.value["password"]
                                      .trim() !=
                                  _formKey
                                      .currentState
                                      ?.value["confirmPassword"]
                                      .trim()) {
                                customSnackBar("Password mismatch");
                                return;
                              }

                              emailFocusNode.unfocus();
                              passwordFocusNode.unfocus();
                              confirmPasswordFocusNode.unfocus();

                              _signUpScreenController
                                  .createUserWithEmailAndPassword(
                                    _formKey.currentState?.value["email"]
                                        .trim(),
                                    _formKey.currentState?.value["password"]
                                        .trim(),
                                  );
                            }
                          },
                          label: "Sign up",
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
                      onTap:
                          () => _signUpScreenController.signInUserWithGoogle(),
                      borderRadius: BorderRadius.circular(50),
                      child: Hero(
                        tag: "G_LOGO",
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              width: 0.5,
                              color: cWhiteWithOpacity.withOpacity(0.5),
                            ),
                          ),
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
                        Flexible(child: Text("Already have an account? ")),
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            "Sign in",
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
