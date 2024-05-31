import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/models/request/register_request_model.dart';
import 'package:pml_ship/presentation/auth/bloc/register/register_bloc.dart';

import '../../../core/core.dart';
import '../../../core/styles.dart';

// TODO: Delete leading and appbar

// TODO: perbaiki form sesuaikan sign_up_page.dart
// TODO: pisahkan form personal account dan company account
class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final _formKey = GlobalKey<FormState>();

  String password = ''; // Initialize the password variable
  bool showPassword = true; // Initialize the showPassword flag
  bool showConfirmPassword = true; // Initialize the showConfirmPassword flag

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
    });
  }

  void toggleShowConfirmPassword() {
    setState(() {
      showConfirmPassword =
          !showConfirmPassword; // Toggle the showConfirmPassword flag
    });
  }

  TextEditingController picNameController = TextEditingController();
  TextEditingController picPhoneController = TextEditingController();
  TextEditingController picEmailController = TextEditingController();

  TextEditingController companyNameController = TextEditingController();
  TextEditingController companyNpwpController = TextEditingController();
  TextEditingController companyAddressController = TextEditingController();
  TextEditingController companyEmailController = TextEditingController();
  TextEditingController companyPhoneController = TextEditingController();
  // TextEditingController aktaPerusahaanController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  File? selectedFile; // Variable to store the selected file

  @override
  void dispose() {
    picNameController.dispose();
    picPhoneController.dispose();
    picEmailController.dispose();
    companyNameController.dispose();
    companyNpwpController.dispose();
    companyAddressController.dispose();
    companyEmailController.dispose();
    companyPhoneController.dispose();

    passwordController.dispose();
    confirmPasswordController.dispose();
    // aktaPerusahaanController.dispose();

    super.dispose();
  }

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        selectedFile = File(pickedFile.files.single.path!);
      } else {
        selectedFile = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text('Registrasi Data Akun', style: primaryTextStyle.copyWith()),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
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
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "PIC Info",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autofillHints: const [AutofillHints.name],
                    controller: picNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Name',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autofillHints: const [AutofillHints.telephoneNumber],
                    controller: picPhoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Phone',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autofillHints: const [AutofillHints.email],
                    controller: picEmailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'PIC Email',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Company Info",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autofillHints: const [AutofillHints.organizationName],
                    controller: companyNameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Name',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: companyNpwpController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company TIN/NPWP',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: companyAddressController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Address',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: companyPhoneController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Phone',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: companyEmailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Company Email',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Account Info",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: (value) {
                      setState(() {
                        // Update the password when input changes
                        password = value;
                      });
                    },
                    controller: passwordController,
                    obscureText: showPassword,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          toggleShowPassword();
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Password',
                      border: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        password =
                            value; // Update the password when input changes
                      });
                    },
                    obscureText: showConfirmPassword,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(showConfirmPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          toggleShowConfirmPassword();
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF4682B4)),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      labelText: 'Confirm Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4682B4),
                      borderRadius:
                          BorderRadius.circular(12), // Menentukan radius sudut
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Text(
                      "Document Info",
                      style: primaryTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: _pickFile,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Upload Akta Perusahaan (PDF)',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Icon(Icons.upload_file),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        if (selectedFile != null)
                          Text(
                            'Selected file: ${selectedFile!.path.split('/').last}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      state.maybeWhen(
                          orElse: () {},
                          error: (message) {
                            return ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Error: $message'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          },
                          success: (state) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'REGISTER SUCCESS, Mohon menunggu konfirmasi admin'), //menampilkan snackbar success
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.pushReplacementNamed(
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
                          return Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Button.filled(
                              onPressed: () {
                                final dataRequest = RegisterRequestModel(
                                  name: picNameController.text,
                                  phone: picPhoneController.text,
                                  email: picEmailController.text,
                                  password: passwordController.text,
                                  companyName: companyNameController.text,
                                  companyAddress: companyAddressController.text,
                                  companyPhone: companyPhoneController.text,
                                  companyEmail: companyEmailController.text,
                                  companyNpwp: companyNpwpController.text,
                                  companyAktaUrl: selectedFile!,
                                );
                                context
                                    .read<RegisterBloc>()
                                    .add(RegisterEvent.register(dataRequest));
                              },
                              label: 'Signup',
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
