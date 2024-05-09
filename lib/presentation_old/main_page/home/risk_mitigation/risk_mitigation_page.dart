import 'package:flutter/material.dart';
import '../../../widgets/risk_mitigation_item_widget.dart';

class RiskMitigationScreen extends StatelessWidget {
  const RiskMitigationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Risk Mitigation'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 20);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return RiskmitigationItemwidget();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
