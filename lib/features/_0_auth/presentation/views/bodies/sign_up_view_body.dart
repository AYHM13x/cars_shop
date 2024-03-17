import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../model_view/auth_cubit/auth_cubit.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? name, email, password, cpassword;

  double horizentalPadding = 15.0;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AuthFailure) {
          setState(() {
            isLoading = false;
          });
        } else if (state is AuthSuccess) {
          showSnackBar(context, "Register Success");
          setState(() {
            isLoading = false;
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: horizentalPadding,
          right: horizentalPadding,
        ),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              const Gap(40.0),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsImage.appLogo,
                  height: 150.0,
                ),
              ),
              const Gap(16),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Cars Shop",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontFamily: "pacifico",
                  ),
                ),
              ),
              const Gap(60),
              Container(
                padding: EdgeInsets.only(left: horizentalPadding + 8),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "SignUp",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFormField(
                  onChange: (data) {
                    name = data;
                  },
                  hintText: "Name",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFormField(
                  onChange: (data) {
                    email = data;
                  },
                  hintText: "Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFormField(
                  onChange: (data) {
                    password = data;
                  },
                  hintText: "Password",
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: CustomTextFormField(
                  onChange: (data) {
                    cpassword = data;
                  },
                  hintText: "Confirm Password",
                  isPassword: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8 * 2),
                child: CustomElevatedButton(
                  text: "SignUp",
                  onTap: () async {
                    if (formkey.currentState!.validate()) {
                      await BlocProvider.of<AuthCubit>(context)
                          .singUpPostRequest(
                        name: name!,
                        email: email!,
                        password: password!,
                        cpassword: cpassword!,
                      );
                    }
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "already have an account?",
                    //style: TextStyle(color: Colors.white),
                  ),
                  const Gap(10.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "LogIn",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
              const Gap(8)
            ],
          ),
        ),
      ),
    );
  }
}
