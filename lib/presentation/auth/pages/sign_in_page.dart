import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../bloc/login/login_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String password = ''; // Initialize the password variable
  bool showPassword = true; // Initialize the showPassword flag

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget forgotPassword() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/recover-password');
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: defaultMargin),
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'I forget my password',
            style: primaryTextStyle.copyWith(
              fontSize: 12.0,
            ),
          ),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: const EdgeInsets.only(bottom: 30.0),
        child: Center(
          child: Text.rich(
            TextSpan(
              text: 'Don\'t have account? ',
              style: primaryTextStyle.copyWith(
                fontSize: 12.0,
                fontWeight: regular,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Sign Up',
                  style: primaryTextStyle.copyWith(
                    color: Colors.blue,
                    fontSize: 12.0,
                    fontWeight: medium,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/sign-up');
                    },
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: [
            // header(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    // padding: EdgeInsets.only(top: 300.0),
                    margin: const EdgeInsets.only(top: 20.0),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(Assets
                            .image.imageAppLogoTransparentBackground.path),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                //title PML SHIP (Admin)
                Text(
                  'PML SHIP',
                  // textAlign: TextAlign.center,
                  style: primaryTextStyle.copyWith(
                    fontWeight: bold,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                top: 18.0,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.email),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              autofillHints: const [
                                AutofillHints.email,
                                AutofillHints.username
                              ],
                              controller: emailController,
                              style: primaryTextStyle,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Email Address',
                                hintStyle: subtitleTextStyle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20.0,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 50.0,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          const Icon(Icons.lock),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  password =
                                      value; // Update the password when input changes
                                });
                              },
                              autofillHints: const [AutofillHints.password],
                              controller: passwordController,
                              style: primaryTextStyle,
                              obscureText: showPassword,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Your Password',
                                hintStyle: subtitleTextStyle,
                                suffixIcon: IconButton(
                                  icon: Icon(showPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                  onPressed: () {
                                    toggleShowPassword();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align to right
              children: [
                forgotPassword(),
              ],
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (authResponseModel) {
                    AuthLocalDataSource().saveAuthData(authResponseModel);
                    Navigator.pushNamed(context, '/home');
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DashboardPage(),
                    //   ),
                    // );
                  },
                  error: (message) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  },
                );
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                    orElse: () {
                      return Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Button.filled(
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          label: 'Login',
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            footer(),
          ],
        ),
      ),
      //   ),
      // ),
    );
  }
}
