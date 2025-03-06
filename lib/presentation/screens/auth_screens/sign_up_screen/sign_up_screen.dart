import 'package:daladala/core/utils/constants/colors.dart';
import 'package:daladala/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

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

  @override
  void initState() {
    _signUpScreenController.initialize(setState, context);
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
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: cWhite,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                width: 0.5,
                                color: cWhiteWithOpacity.withOpacity(0.5),
                              ),
                            ),
                            child: HeroIcon(
                              HeroIcons.chevronLeft,
                              color: cBlack,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                      label: "Full Name",
                      hintText: "John Doe",
                      name: "name",
                      keyboardType: TextInputType.text,
                    ),
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
                    CustomTextField(
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

                        Get.to(
                          () => HomeScreen(),
                          transition: Transition.circularReveal,
                          duration: Duration(milliseconds: 1200),
                        );
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
                      onTap: () {},
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
