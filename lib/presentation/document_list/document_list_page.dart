import 'package:flutter/material.dart';
import 'document_list_item_widget.dart';
import '../../core/styles.dart';
import '../auth/pages/sign_in_page.dart';

class DocumentListPage extends StatelessWidget {
  const DocumentListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Document List'),
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
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
      separatorBuilder: (context, index) => SizedBox(height: 13),
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
                MaterialPageRoute(builder: (context) => SignInPage()
                    // BillOfLadingPage(),
                    ),
              );
            } else if (documentName == "Cargo Manifest") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()
                    // CargoManifestPage(), // Mengarahkan ke CargoManifestPage
                    ),
              );
            } else if (documentName == "Time Sheet") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()
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
