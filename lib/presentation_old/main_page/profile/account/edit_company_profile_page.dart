import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditCompanyProfilePage extends StatelessWidget {
  const EditCompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left),
          ),
          title: Text('Edit Company Profile Page'),
        ),
        body: Center(
          child: Text('Edit Company Profile Page'),
        ),
      ),
    );
  }
}
