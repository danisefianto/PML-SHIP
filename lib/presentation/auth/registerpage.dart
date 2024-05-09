import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/models/request/register_request_model.dart';
import 'package:pml_ship/presentation/auth/bloc/register/register_bloc.dart';

import '../../core/styles.dart';

// TODO: Add
// Navigator.pushNamedAndRemoveUntil(
//                 context, '/sign-in', (route) => false);
//           },

// TODO: Delete leading and appbar

// TODO: perbaiki form sesuaikan sign_up_page.dart
// TODO: pisahkan form personal account dan company account
class Registerpage extends StatefulWidget {
  @override
  _RegisterpageState createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController picNameController = TextEditingController();
  TextEditingController picPhoneController = TextEditingController();
  TextEditingController picEmailController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyNpwpController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController aktaPerusahaanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Registrasi Data Akun'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "PIC Info",
                      style: primaryTextStyle,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: picNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter PIC Phone';
                    //   }
                    //   return null;
                    // },
                  ),

                  SizedBox(height: 16),
                  TextFormField(
                    controller: picPhoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Phone',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter PIC Phone';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: picEmailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter PIC Email';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Company Info",
                      style: primaryTextStyle,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: companyNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Name',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Company Name';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: companyNpwpController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company TIN/NPWP',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Company TIN/NPWP';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: companyAddressController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Address',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Company Address';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: companyPhoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Phone',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Company Phone';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: companyEmailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Email',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Company Email';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Account Info",
                      style: primaryTextStyle,
                    ),
                  ),
                  // SizedBox(height: 16),
                  // TextFormField(
                  // controller: usernameController,
                  //   decoration: InputDecoration(
                  //     enabledBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xFF4682B4)),
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //     focusedBorder: OutlineInputBorder(
                  //       borderSide: BorderSide(color: Color(0xFF4682B4)),
                  //       borderRadius: BorderRadius.circular(25),
                  //     ),
                  //     labelText: 'Username',
                  //     filled: true,
                  //     fillColor: Colors.white,
                  //   ),
                  //   // validator: (value) {
                  //   //   if (value == null || value.isEmpty) {
                  //   //     return 'Please enter Username';
                  //   //   }
                  //   //   return null;
                  //   // },
                  // ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter Password';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please confirm Password';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: aktaPerusahaanController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Akta Perusahaan',
                      hintText: 'b100_PML.Pdf',
                      // helperText: 'format file: akta_perusahaan.Pdf',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.upload_file),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please Upload Akta Perusahaan';
                    //   }
                    //   return null;
                    // },
                  ),
                  SizedBox(height: 16),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          success: (state) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'REGISTER SUCCESS, Mohon menunggu konfirmasi admin'), //menampilkan snackbar success
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushNamed(
                                context, '/registration-process-waiting');
                          });
                    },
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
                                'Signup',
                                style: primaryTextStyle.copyWith(
                                  fontWeight: semiBold,
                                  fontSize: 16.0,
                                ),
                              ),
                              onPressed: () {
                                final dataRequest = RegisterRequestModel(
                                  name: picNameController.text,
                                  phone: picPhoneController.text,
                                  email: picEmailController.text,
                                  password: passwordController.text,
                                  namePerusahaan: companyNameController.text,
                                  addressPerusahaan:
                                      companyAddressController.text,
                                  npwpPerusahaan: companyNpwpController.text,
                                  phonePerusahaan: companyPhoneController.text,
                                  emailPerusahaan: companyEmailController.text,
                                  aktaPerusahaan: aktaPerusahaanController.text,
                                );
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterEvent.register(dataRequest));
                                // Navigator.pushNamed(
                                //     context, '/registration-process-waiting');
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
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Already have an account? ',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12.0,
                          fontWeight: regular,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in',
                            style: primaryTextStyle.copyWith(
                              color: Colors.blue,
                              fontSize: 12.0,
                              fontWeight: medium,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/sign-in');
                              },
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
