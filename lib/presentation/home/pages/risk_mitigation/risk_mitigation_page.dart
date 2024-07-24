import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../widgets/risk_mitigation_item_widget.dart';

class RiskMitigationPage extends StatelessWidget {
  const RiskMitigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Risk Mitigation'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SpaceHeight(20);
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return const RiskmitigationItemwidget();
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
