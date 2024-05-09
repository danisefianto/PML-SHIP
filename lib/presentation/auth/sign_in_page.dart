import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/datasource/auth_remote_datasource.dart';
import 'package:pml_ship/data/datasource/auth_local_datasource.dart';
import 'package:pml_ship/presentation/auth/bloc/login/login_bloc.dart';

import '../../core/styles.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget forgotPassword() {
      return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/recover-password');
        },
        child: Padding(
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
        margin: EdgeInsets.only(bottom: 30.0),
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
        resizeToAvoidBottomInset: false,
        body: ListView(
          // child: Container(
          //   margin: EdgeInsets.symmetric(
          //     horizontal: defaultMargin,
          //   ),
          //   child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header(),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      // padding: EdgeInsets.only(top: 300.0),
                      margin: EdgeInsets.only(top: 20.0),
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image_logo.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
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
            ),
            Container(
              margin: EdgeInsets.only(
                top: 18.0,
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
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(
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
                          Icon(Icons.email),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: emailController,
                              style: primaryTextStyle,
                              decoration: InputDecoration.collapsed(
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
              margin: EdgeInsets.only(top: 20.0),
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
                  SizedBox(
                    height: 12.0,
                  ),
                  Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(
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
                          Icon(Icons.lock),
                          SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: passwordController,
                              style: primaryTextStyle,
                              obscureText: true,
                              decoration: InputDecoration.collapsed(
                                hintText: 'Your Password',
                                hintStyle: subtitleTextStyle,
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
                      return Container(
                        height: 50.0,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                        child: FilledButton(
                          child: Text(
                            'Login',
                            style: primaryTextStyle.copyWith(
                              fontWeight: semiBold,
                              fontSize: 16.0,
                              color: primaryColor,
                            ),
                          ),
                          onPressed: () {
                            context.read<LoginBloc>().add(
                                  LoginEvent.login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: secondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
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
