import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../core/styles.dart';
import '../../../data/models/request/update_user_data_request_model.dart';
import '../../bloc/profile/profile_bloc.dart';
import '../../bloc/update_user_data/update_user_data_bloc.dart';

class EditPersonalAndCompanyProfilePage extends StatefulWidget {
  const EditPersonalAndCompanyProfilePage({super.key});

  @override
  State<EditPersonalAndCompanyProfilePage> createState() =>
      _EditPersonalAndCompanyProfilePageState();
}

class _EditPersonalAndCompanyProfilePageState
    extends State<EditPersonalAndCompanyProfilePage> {
  final TextEditingController _picNameController = TextEditingController();
  final TextEditingController _picEmailController = TextEditingController();
  final TextEditingController _picPhoneController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _companyNpwpController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPhoneController = TextEditingController();

  // TextEditingController _confirmPasswordController = TextEditingController();
  String? _picOriginalName;
  String? _picOriginalEmail;
  String? _picOriginalPhone;

  String? _companyOriginalName;
  String? _companyOriginalNpwp;
  String? _companyOriginalAddress;
  String? _companyOriginalEmail;
  String? _companyOriginalPhone;
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(const ProfileEvent.getFullUserData());
  }

  final _formKey = GlobalKey<FormState>();

  // String password = ''; // Initialize the password variable
  // bool showPassword = true; // Initialize the showPassword flag
  // bool showConfirmPassword = true; // Initialize the showConfirmPassword flag

  // void toggleShowPassword() {
  //   setState(() {
  //     showPassword = !showPassword; // Toggle the showPassword flag
  //   });
  // }

  // void toggleShowConfirmPassword() {
  //   setState(() {
  //     showConfirmPassword =
  //         !showConfirmPassword; // Toggle the showConfirmPassword flag
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text('Edit Profile Page'),
        ),
        body: BlocListener<UpdateUserDataBloc, UpdateUserDataState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (response) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Profile updated successfully'),
                  backgroundColor: Colors.green,
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
          child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (message) => Center(child: Text('Error: $message')),
                orElse: () => const Center(child: Text('No data')),
                success: (profile) {
                  _picNameController.text = profile.data.name;
                  _picEmailController.text = profile.data.email;
                  _picPhoneController.text = profile.data.phone;
                  _companyNameController.text = profile.data.companyName;
                  _companyAddressController.text = profile.data.companyAddress;
                  _companyNpwpController.text = profile.data.companyNpwp;
                  _companyPhoneController.text = profile.data.companyPhone;
                  _companyEmailController.text = profile.data.companyEmail;

                  _picOriginalName = profile.data.name;
                  _picOriginalEmail = profile.data.email;
                  _picOriginalPhone = profile.data.phone;
                  _companyOriginalName = profile.data.companyName;
                  _companyOriginalAddress = profile.data.companyAddress;
                  _companyOriginalNpwp = profile.data.companyNpwp;
                  _companyOriginalPhone = profile.data.companyPhone;
                  _companyOriginalEmail = profile.data.companyEmail;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: Column(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4682B4),
                                    borderRadius: BorderRadius.circular(
                                        12), // Menentukan radius sudut
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "PIC Info",
                                    style: primaryTextStyle,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _picNameController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'PIC Name',
                                    border: const OutlineInputBorder(),
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

                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _picPhoneController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'PIC Phone',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _picEmailController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'PIC Email',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF4682B4),
                                    borderRadius: BorderRadius.circular(
                                        12), // Menentukan radius sudut
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    "Company Info",
                                    style: primaryTextStyle,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _companyNameController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'Company Name',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _companyNpwpController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'Company TIN/NPWP',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _companyAddressController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'Company Address',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _companyPhoneController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
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
                                const SizedBox(height: 16),
                                TextFormField(
                                  controller: _companyEmailController,
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFF4682B4)),
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    labelText: 'Company Email',
                                    border: const OutlineInputBorder(),
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
                                const SizedBox(height: 16),
                                // Container(
                                //   alignment: Alignment.centerLeft,
                                //   decoration: BoxDecoration(
                                //     color: const Color(0xFF4682B4),
                                //     borderRadius: BorderRadius.circular(
                                //         12), // Menentukan radius sudut
                                //   ),
                                //   padding: const EdgeInsets.all(5),
                                //   child: Text(
                                //     "Account Info",
                                //     style: primaryTextStyle,
                                //   ),
                                // ),
                                // // SizedBox(height: 16),
                                // // TextFormField(
                                // // controller: usernameController,
                                // //   decoration: InputDecoration(
                                // //     enabledBorder: OutlineInputBorder(
                                // //       borderSide: BorderSide(color: Color(0xFF4682B4)),
                                // //       borderRadius: BorderRadius.circular(25),
                                // //     ),
                                // //     focusedBorder: OutlineInputBorder(
                                // //       borderSide: BorderSide(color: Color(0xFF4682B4)),
                                // //       borderRadius: BorderRadius.circular(25),
                                // //     ),
                                // //     labelText: 'Username',
                                // //     filled: true,
                                // //     fillColor: Colors.white,
                                // //   ),
                                // //   // validator: (value) {
                                // //   //   if (value == null || value.isEmpty) {
                                // //   //     return 'Please enter Username';
                                // //   //   }
                                // //   //   return null;
                                // //   // },
                                // // ),
                                // const SizedBox(height: 16),
                                // TextFormField(
                                //   onChanged: (value) {
                                //     setState(() {
                                //       password =
                                //           value; // Update the password when input changes
                                //     });
                                //   },
                                //   controller: _passwordController,
                                //   obscureText: showPassword,

                                //   decoration: InputDecoration(
                                //     suffixIcon: IconButton(
                                //       icon: Icon(showPassword
                                //           ? Icons.visibility_off
                                //           : Icons.visibility),
                                //       onPressed: () {
                                //         toggleShowPassword();
                                //       },
                                //     ),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(
                                //           color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(
                                //           color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     labelText: 'Password',
                                //     border: const OutlineInputBorder(),
                                //     filled: true,
                                //     fillColor: Colors.white,
                                //   ),

                                //   // validator: (value) {
                                //   //   if (value == null || value.isEmpty) {
                                //   //     return 'Please enter Password';
                                //   //   }
                                //   //   return null;
                                //   // },
                                // ),
                                // const SizedBox(height: 16),
                                // TextFormField(
                                //   onChanged: (value) {
                                //     setState(() {
                                //       password =
                                //           value; // Update the password when input changes
                                //     });
                                //   },
                                //   obscureText: showConfirmPassword,
                                //   controller: _confirmPasswordController,
                                //   decoration: InputDecoration(
                                //     suffixIcon: IconButton(
                                //       icon: Icon(showConfirmPassword
                                //           ? Icons.visibility_off
                                //           : Icons.visibility),
                                //       onPressed: () {
                                //         toggleShowConfirmPassword();
                                //       },
                                //     ),
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(
                                //           color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(
                                //           color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     labelText: 'Confirm Password',
                                //     filled: true,
                                //     fillColor: Colors.white,
                                //   ),

                                //   // validator: (value) {
                                //   //   if (value == null || value.isEmpty) {
                                //   //     return 'Please confirm Password';
                                //   //   }
                                //   //   return null;
                                //   // },
                                // ),
                                // const SizedBox(height: 16),
                                // TextFormField(
                                //   controller: aktaPerusahaanController,
                                //   decoration: InputDecoration(
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     focusedBorder: OutlineInputBorder(
                                //       borderSide: const BorderSide(color: Color(0xFF4682B4)),
                                //       borderRadius: BorderRadius.circular(25),
                                //     ),
                                //     labelText: 'Akta Perusahaan',
                                //     hintText: 'b100_PML.Pdf',
                                //     // helperText: 'format file: akta_perusahaan.Pdf',
                                //     border: const OutlineInputBorder(),
                                //     filled: true,
                                //     fillColor: Colors.white,
                                //     suffixIcon: const Icon(Icons.upload_file),
                                //   ),
                                //   // validator: (value) {
                                //   //   if (value == null || value.isEmpty) {
                                //   //     return 'Please Upload Akta Perusahaan';
                                //   //   }
                                //   //   return null;
                                //   // },
                                // ),
                                const SizedBox(height: 16),
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Button.filled(
                                    onPressed: () {
                                      if (_picNameController.text ==
                                              _picOriginalName &&
                                          _picEmailController.text ==
                                              _picOriginalEmail &&
                                          _picPhoneController.text ==
                                              _picOriginalPhone &&
                                          _companyNameController.text ==
                                              _companyOriginalName &&
                                          _companyNpwpController.text ==
                                              _companyOriginalNpwp &&
                                          _companyAddressController.text ==
                                              _companyOriginalAddress &&
                                          _companyEmailController.text ==
                                              _companyOriginalEmail &&
                                          _companyPhoneController.text ==
                                              _companyOriginalPhone) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Data not changed'),
                                            backgroundColor: Colors.green,
                                          ),
                                        );
                                        Navigator.pop(context);
                                      } else {
                                        final dataRequest =
                                            UpdateUserDataRequestModel(
                                          name: _picNameController.text
                                              .toString(),
                                          phone: _picPhoneController.text
                                              .toString(),
                                          email: _picEmailController.text
                                              .toString(),
                                          // password:
                                          //     _passwordController.text.toString(),
                                          companyName: _companyNameController
                                              .text
                                              .toString(),
                                          companyAddress:
                                              _companyAddressController.text
                                                  .toString(),
                                          companyPhone: _companyPhoneController
                                              .text
                                              .toString(),
                                          companyEmail: _companyEmailController
                                              .text
                                              .toString(),
                                          companyNpwp: _companyNpwpController
                                              .text
                                              .toString(),
                                          method: 'PUT',
                                        );
                                        context.read<UpdateUserDataBloc>().add(
                                              UpdateUserDataEvent
                                                  .updateUserData(dataRequest),
                                            );
                                        Navigator.pop(context);
                                      }
                                    },
                                    label: 'Update User Data',
                                  ),
                                )
                              ],
                            ),
                          )
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

    // _confirmPasswordController.dispose();
    super.dispose();
  }
}
