import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../../bloc/auth/login/login_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String password = '';
  bool showPassword = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  Future<void> checkUserStatus(AuthResponseModel authResponseModel) async {
    if (authResponseModel.data.user.role == 'customer' &&
        authResponseModel.data.user.status == 'pending') {
      buildShowDialog(
        'Registration pending',
        'Your registration is pending. Please wait for the admin to approve your registration.',
      );
    } else if (authResponseModel.data.user.role == 'customer' &&
        authResponseModel.data.user.status == 'rejected') {
      buildShowDialog(
        'Registration rejected',
        'Your registration is rejected. Please register again with the right data and new PIC email.',
      );
    } else {
      AuthLocalDataSource().saveAuthData(authResponseModel);
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    }
  }

  Future<dynamic> buildShowDialog(String title, String content) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
          Navigator.pushNamed(
            context,
            AppRoutes.recoverPassword,
          );
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
                      Navigator.pushNamed(
                        context,
                        AppRoutes.signUp,
                      );
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
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
                Text(
                  'PML SHIP',
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
                                  password = value;
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
                                  onPressed: toggleShowPassword,
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     forgotPassword(),
            //   ],
            // ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  success: (authResponseModel) async {
                    await checkUserStatus(authResponseModel);
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
    );
  }
}
