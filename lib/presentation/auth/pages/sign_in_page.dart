import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_page.dart';

import '../../../core/core.dart';
import '../../../data/datasource/auth_local_datasource.dart';
import '../../../data/models/response/auth_response_model.dart';
import '../../home/pages/main_page.dart';
import '../bloc/login/login_bloc.dart';
import 'recover_password_page.dart';

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

  Future<void> checkUserStatus(AuthResponseModel responseModel) async {
    if (responseModel.data!.user!.role == 'customer' &&
        responseModel.data!.user!.status == 'pending') {
      buildShowDialog(
        'Registration pending',
        'Your registration is pending. Please wait for the admin to approve your registration.',
      );
    } else if (responseModel.data!.user!.role == 'customer' &&
        responseModel.data!.user!.status == 'rejected') {
      buildShowDialog(
        'Registration rejected',
        'Your registration is rejected. Please register again with the right data and new PIC email.',
      );
    } else {
      AuthLocalDataSource().saveAuthData(responseModel);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login success'),
          backgroundColor: AppColors.gray1,
        ),
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
        (route) => false,
      );
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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RecoverPasswordPage(),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.only(top: 10),
          child: const Text(
            'I forget my password',
            style: TextStyle(color: AppColors.blue),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            SizedBox(
              height: 250.0,
              child: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Center(
                    child:
                        Assets.image.imageAppLogoTransparentBackground.image()),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(28.0)),
                  child: ColoredBox(
                    color: AppColors.gray5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Text(
                            'Masukkan kredensial akun untuk melanjutkan masuk dalam aplikasi',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: AppColors.black,
                            ),
                          ),
                          const SpaceHeight(14.0),
                          CustomTextField(
                            controller: emailController,
                            label: 'Email',
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: const Icon(
                              Icons.email,
                              color: AppColors.black,
                            ),
                          ),
                          const SpaceHeight(18.0),
                          CustomTextField(
                            controller: passwordController,
                            label: 'Password',
                            obscureText: showPassword,
                            textInputAction: TextInputAction.done,
                            prefixIcon: const Icon(
                              Icons.key,
                              color: AppColors.black,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(showPassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: toggleShowPassword,
                            ),
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     forgotPassword(),
                          //   ],
                          // ),
                          const SpaceHeight(33.0),
                          BlocConsumer<LoginBloc, LoginState>(
                            listener: (context, state) {
                              state.maybeWhen(
                                  orElse: () {},
                                  error: (message) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(message),
                                        backgroundColor: AppColors.red,
                                      ),
                                    );
                                  },
                                  success: (data) async {
                                    await checkUserStatus(data);
                                  });
                            },
                            builder: (context, state) {
                              return state.maybeWhen(
                                loading: () => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                orElse: () {
                                  return Button.filled(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                            LoginEvent.login(
                                              email: emailController.text,
                                              password: passwordController.text,
                                            ),
                                          );
                                    },
                                    label: 'Sign In',
                                  );
                                },
                              );
                            },
                          ),
                          const SpaceHeight(16.0),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Don\'t have account? ',
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: AppColors.gray3,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterPage(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
