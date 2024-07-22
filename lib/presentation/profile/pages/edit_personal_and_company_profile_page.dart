import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../data/models/request/update_user_data_request_model.dart';
import '../../../data/models/response/user_response_model.dart';
import '../bloc/get_authenticated_user/get_authenticated_user_bloc.dart';
import '../bloc/update_user_data/update_user_data_bloc.dart';

class EditPersonalAndCompanyProfilePage extends StatefulWidget {
  final UserResponseModel profile;
  const EditPersonalAndCompanyProfilePage({
    super.key,
    required this.profile,
  });

  @override
  State<EditPersonalAndCompanyProfilePage> createState() =>
      _EditPersonalAndCompanyProfilePageState();
}

class _EditPersonalAndCompanyProfilePageState
    extends State<EditPersonalAndCompanyProfilePage> {
  final TextEditingController _picNameController = TextEditingController();
  final TextEditingController _picEmailController = TextEditingController();
  final TextEditingController _picPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyNpwpController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPhoneController = TextEditingController();

  File? selectedFile; // Variable to store the selected file

  @override
  void initState() {
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile Page'),
        ),
        body: BlocListener<UpdateUserDataBloc, UpdateUserDataState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (response) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Profile updated successfully'),
                  backgroundColor: AppColors.green,
                ));
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error: $message'),
                  backgroundColor: Colors.red,
                ));
              },
              orElse: () {},
            );
          },
          child:
              BlocBuilder<GetAuthenticatedUserBloc, GetAuthenticatedUserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(child: Text('Error: $message')),
                orElse: () => const Center(child: Text('No data')),
                loaded: (profile) {
                  _picNameController.text = profile.data!.user!.name ?? '';
                  _picEmailController.text = profile.data!.user!.email ?? '';
                  _picPhoneController.text = profile.data!.user!.phone ?? '';
                  _companyNameController.text =
                      profile.data!.company!.companyName ?? '';
                  _companyAddressController.text =
                      profile.data!.company!.companyAddress ?? '';
                  _companyNpwpController.text =
                      profile.data!.company!.companyNpwp ?? '';
                  _companyPhoneController.text =
                      profile.data!.company!.companyPhone ?? '';
                  _companyEmailController.text =
                      profile.data!.company!.companyEmail ?? '';

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              const SpaceHeight(30),
                              CustomTextField(
                                controller: _picNameController,
                                label: 'PIC Name',
                                textInputAction: TextInputAction.next,
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: AppColors.black,
                                ),
                              ),
                              const SpaceHeight(18.0),
                              CustomTextField(
                                controller: _picPhoneController,
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
                                controller: _picEmailController,
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
                                controller: _companyNameController,
                                label: 'Company Name',
                                textInputAction: TextInputAction.next,
                                prefixIcon: const Icon(
                                  Icons.corporate_fare,
                                  color: AppColors.black,
                                ),
                              ),
                              const SpaceHeight(18.0),
                              CustomTextField(
                                controller: _companyAddressController,
                                label: 'Company Address',
                                textInputAction: TextInputAction.next,
                                prefixIcon: const Icon(
                                  Icons.pin_drop,
                                  color: AppColors.black,
                                ),
                              ),
                              const SpaceHeight(18.0),
                              CustomTextField(
                                controller: _companyPhoneController,
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
                                controller: _companyEmailController,
                                label: 'Company Email',
                                textInputAction: TextInputAction.next,
                                prefixIcon: const Icon(
                                  Icons.mail,
                                  color: AppColors.black,
                                ),
                              ),
                              const SpaceHeight(18.0),
                              CustomTextField(
                                controller: _companyNpwpController,
                                label: 'Company NPWP',
                                textInputAction: TextInputAction.next,
                                prefixIcon: const Icon(
                                  Icons.attach_money,
                                  color: AppColors.black,
                                ),
                              ),
                              const SpaceHeight(16),
                              CustomTextField(
                                controller: _passwordController,
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
                              const SpaceHeight(16),
                              const SpaceHeight(16),
                              Button.filled(
                                onPressed: () {
                                  if (
                                      // check is empty
                                      _picNameController.text.isEmpty ||
                                          _picEmailController.text.isEmpty ||
                                          _picPhoneController.text.isEmpty ||
                                          _companyNameController.text.isEmpty ||
                                          _companyNpwpController.text.isEmpty ||
                                          _companyAddressController
                                              .text.isEmpty ||
                                          _companyEmailController
                                              .text.isEmpty ||
                                          _companyPhoneController.text.isEmpty
                                      // _passwordController.text.isEmpty ||

                                      ) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Some data is empty'),
                                        backgroundColor: AppColors.red,
                                      ),
                                    );
                                  } else {
                                    final dataRequest =
                                        UpdateUserDataRequestModel(
                                      name: _picNameController.text.toString(),
                                      phone:
                                          _picPhoneController.text.toString(),
                                      email:
                                          _picEmailController.text.toString(),
                                      password:
                                          _passwordController.text.toString(),
                                      companyName: _companyNameController.text
                                          .toString(),
                                      companyAddress: _companyAddressController
                                          .text
                                          .toString(),
                                      companyPhone: _companyPhoneController.text
                                          .toString(),
                                      companyEmail: _companyEmailController.text
                                          .toString(),
                                      companyNpwp: _companyNpwpController.text
                                          .toString(),
                                      companyAkta: selectedFile,
                                    );
                                    context.read<UpdateUserDataBloc>().add(
                                          UpdateUserDataEvent.updateUserData(
                                              dataRequest),
                                        );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Data changed successfully'),
                                        backgroundColor: AppColors.green,
                                      ),
                                    );
                                    context
                                        .read<GetAuthenticatedUserBloc>()
                                        .add(const GetAuthenticatedUserEvent
                                            .getAuthenticatedUser());
                                    Navigator.pop(context);
                                  }
                                },
                                label: 'Update User Data',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _picNameController.dispose();
    _picEmailController.dispose();
    _picPhoneController.dispose();
    // _passwordController.dispose();
    _companyNameController.dispose();
    _companyNpwpController.dispose();
    _companyAddressController.dispose();
    _companyEmailController.dispose();
    _companyPhoneController.dispose();

    super.dispose();
  }
}
