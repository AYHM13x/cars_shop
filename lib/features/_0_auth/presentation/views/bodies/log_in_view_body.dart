import 'package:car_shop_app/core/utils/route_app/slide_right_animetion.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/utils/AsstesApp.dart';
import '../../../../../core/utils/route_app/route_names_app.dart';
import '../../../../../core/widgets/custom_elevated_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/utils/functions/show_snack_bar.dart';
import '../../model_view/auth_cubit/auth_cubit.dart';

class LogInViewBody extends StatefulWidget {
  const LogInViewBody({super.key});

  @override
  State<LogInViewBody> createState() => _LogInViewBodyState();
}

class _LogInViewBodyState extends State<LogInViewBody> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;

  double horizentalPadding = 16.0;
  double verticalPadding = 50.0;

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
          showSnackBar(context, state.errMessage);
          setState(() {
            isLoading = false;
          });
        } else if (state is AuthSuccess) {
          showSnackBar(context, "Welcome: ${state.authResponse.data!.name}");
          setState(() {
            isLoading = false;
          });
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Padding(
          padding: EdgeInsets.only(
            left: horizentalPadding,
            right: horizentalPadding,
          ),
          child: Form(
            key: formkey,
            child: ListView(
              children: [
                const Gap(100.0),
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
                const Gap(80.0),
                Container(
                  padding: EdgeInsets.only(left: horizentalPadding + 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "LogIn",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                    ),
                  ),
                ),
                const Gap(20.0),
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
                  padding: const EdgeInsets.symmetric(vertical: 8 * 2),
                  child: CustomElevatedButton(
                    text: "Login",
                    onTap: () async {
                      if (formkey.currentState!.validate()) {
                        setState(() {});
                        await BlocProvider.of<AuthCubit>(context)
                            .logInPostRequest(
                          email: email!,
                          password: password!,
                        );
                      } else {
                        showSnackBar(context, "there was an error");
                      }
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "don't have an account?",
                      //style: TextStyle(color: Colors.white),
                    ),
                    const Gap(10.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteNamesApp.signUpViewRoute,
                        );
                      },
                      child: const Text(
                        "SignUp",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
