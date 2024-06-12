import 'package:flutter/material.dart';

import '../auth/sign_in_page.dart';
import 'document_list_item_widget.dart';

class DocumentListPage extends StatelessWidget {
  const DocumentListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Document List'),
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildHalamanlistdokumenLoadingDate(context),
          ),
        ),
      ),
    );
  }

  Widget _buildHalamanlistdokumenLoadingDate(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => const SizedBox(height: 13),
      itemCount: 5,
      itemBuilder: (context, index) {
        String documentName;
        switch (index) {
          case 0:
            documentName = "Shipping Instruction";
            break;
          case 1:
            documentName = "SPAL";
            break;
          case 2:
            documentName = "Bill of Lading";
            break;
          case 3:
            documentName = "Time Sheet";
            break;
          case 4:
            documentName = "Cargo Manifest";
            break;
          default:
            documentName = "Unknown Document";
            break;
        }

        return DocumentListPageWidget(
          documentName: documentName,
          onTap: () {
            // Navigasi ke halaman yang sesuai berdasarkan nama dokumen
            if (documentName == "Bill of Lading") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()
                    // BillOfLadingPage(),
                    ),
              );
            } else if (documentName == "Cargo Manifest") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()
                    // CargoManifestPage(), // Mengarahkan ke CargoManifestPage
                    ),
              );
            } else if (documentName == "Time Sheet") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SignInPage()
                    // TimeSheetPage(), // Mengarahkan ke TimeSheetPage
                    ),
              );
            }
          },
        );
      },
    );
  }
}
