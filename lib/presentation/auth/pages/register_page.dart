import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pml_ship/data/models/request/register_request_model.dart';
import 'package:pml_ship/presentation/auth/bloc/register/register_bloc.dart';

import '../../../core/core.dart';
import 'registration_process_waiting_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showPassword = true; // Initialize the showPassword flag
  bool showConfirmPassword = true; // Initialize the showConfirmPassword flag

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword; // Toggle the showPassword flag
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

  TextEditingController passwordController = TextEditingController();

  File? selectedFile; // Variable to store the selected file
  String? fileName;
  Uint8List? fileBytes;

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

    super.dispose();
  }

  Future<void> _pickFile() async {
    final FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    setState(() {
      if (pickedFile != null) {
        PlatformFile file = pickedFile.files.first;
        if (kIsWeb) {
          // For web, use bytes since path is not available
          // You can use fileBytes and fileName as needed for your application
          // For example, uploading the file to a server, displaying the file, etc.
          // Note: The File class is not used on the web. You might store the bytes or use them directly
        } else {
          // For mobile (or desktop), you can use the file path
          selectedFile = File(file.path!);
        }
      } else {
        selectedFile = null;
      }
    });
  }

  bool allFieldsAreEmpty() {
    return picNameController.text.isEmpty ||
        picPhoneController.text.isEmpty ||
        picEmailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        companyNameController.text.isEmpty ||
        companyNpwpController.text.isEmpty ||
        companyAddressController.text.isEmpty ||
        companyPhoneController.text.isEmpty ||
        companyEmailController.text.isEmpty ||
        selectedFile == null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 30.0),
                  margin: const EdgeInsets.only(top: 200.0),
                  decoration: const BoxDecoration(
                    color: AppColors.gray5,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28.0)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue,
                        ),
                      ),
                      const SpaceHeight(28.0),
                      CustomTextField(
                        controller: picNameController,
                        label: 'PIC Name',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.person,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: picPhoneController,
                        label: 'PIC Phone',
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: picEmailController,
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
                        controller: companyNameController,
                        label: 'Company Name',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.corporate_fare,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: companyAddressController,
                        label: 'Company Address',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.pin_drop,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: companyPhoneController,
                        label: 'Company Phone',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: companyEmailController,
                        label: 'Company Email',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      CustomTextField(
                        controller: companyNpwpController,
                        label: 'Company NPWP',
                        textInputAction: TextInputAction.next,
                        prefixIcon: const Icon(
                          Icons.attach_money,
                          color: AppColors.black,
                        ),
                      ),
                      const SpaceHeight(18.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Upload Akta Perusahaan (PDF)',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SpaceHeight(12),
                          InkWell(
                            onTap: _pickFile,
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 12,
                                right: 16,
                                bottom: 16,
                                top: 16,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: AppColors.black,
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Icon(Icons.upload_file),
                                  ),
                                  selectedFile != null
                                      ? Flexible(
                                          child: Text(
                                            'Selected file: ${selectedFile!.path.split('/').last}', // Use path for mobile
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: AppColors.black,
                                            ),
                                          ),
                                        )
                                      : const Text(
                                          'Please select a file',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                          const SpaceHeight(8)
                        ],
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
                      const SpaceHeight(33.0),
                      BlocListener<RegisterBloc, RegisterState>(
                        listener: (context, state) {
                          state.maybeWhen(
                              orElse: () {},
                              success: (data) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Register Success'),
                                    backgroundColor: AppColors.gray1,
                                  ),
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationProcessWaitingPage(),
                                  ),
                                );
                              },
                              error: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Register failed: $message'),
                                    backgroundColor: AppColors.red,
                                  ),
                                );
                              });
                        },
                        child: BlocBuilder<RegisterBloc, RegisterState>(
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () {
                                return const Center(
                                    child: CircularProgressIndicator());
                              },
                              orElse: () {
                                return Button.filled(
                                  onPressed: () {
                                    if (allFieldsAreEmpty()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content:
                                              Text('Some fields are empty!'),
                                          backgroundColor: Colors.red,
                                        ),
                                      );
                                    } else {
                                      final dataRequest = RegisterRequestModel(
                                        name: picNameController.text,
                                        phone: picPhoneController.text,
                                        email: picEmailController.text,
                                        password: passwordController.text,
                                        companyName: companyNameController.text,
                                        companyAddress:
                                            companyAddressController.text,
                                        companyPhone:
                                            companyPhoneController.text,
                                        companyEmail:
                                            companyEmailController.text,
                                        companyNpwp: companyNpwpController.text,
                                        companyAkta: selectedFile!,
                                      );
                                      context.read<RegisterBloc>().add(
                                            RegisterEvent.register(dataRequest),
                                          );
                                    }
                                  },
                                  label: 'Sign Up',
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SpaceHeight(16.0),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: AppColors.gray3,
                            ),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: const TextStyle(
                                  color: AppColors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pop(context);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
