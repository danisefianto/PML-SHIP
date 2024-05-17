import 'package:flutter/material.dart';
import '../../core/styles.dart';

class SelectPortDropdownWidget extends StatefulWidget {
  final double customMargin;
  final String cargoState;
  const SelectPortDropdownWidget({
    super.key,
    required this.customMargin,
    required this.cargoState,
  });

  @override
  State<SelectPortDropdownWidget> createState() =>
      _SelectPortDropdownWidgetState();
}

class _SelectPortDropdownWidgetState extends State<SelectPortDropdownWidget> {
  List<Port> ports = [
    Port(
      name: "ADARO KELANIS",
    ),
    Port(
      name: "Anchorage Area PML 1",
    ),
    Port(
      name: "ASAM2 - KINTAP",
    ),
    Port(
      name: "BIRINGKASI",
    ),
    Port(
      name: "BONTANG",
    ),
    Port(
      name: "BUNATI",
    ),
    Port(
      name: "CIREBON",
    ),
    Port(
      name: "Ciwandan - Cigading",
    ),
    Port(
      name: "DUMAI",
    ),
    Port(
      name: "Garongkong",
    ),
    Port(
      name: "GIJ",
    ),
    Port(
      name: "GRESIK",
    ),
    Port(
      name: "JETTY AMI - KABANEA",
    ),
    Port(
      name: "JETTY IMIP - MOROWALI",
    ),
    Port(
      name: "Kampot International",
    ),
    Port(
      name: "KENDAWANGAN",
    ),
    Port(
      name: "Koh Si Chang",
    ),
    Port(
      name: "KUMAI",
    ),
    Port(
      name: "LAMONGAN",
    ),
    Port(
      name: "MALOY",
    ),
    Port(
      name: "MERAK/BOJANEGARA",
    ),
    Port(
      name: "MERAMO",
    ),
    Port(
      name: "Morosi",
    ),
    Port(
      name: "MTU HABCO",
    ),
    Port(
      name: "PALOPO",
    ),
    Port(
      name: "PARINGLAHUNG",
    ),
    Port(
      name: "PATRIA MARITIME PERKASA BATAM",
    ),
    Port(
      name: "PERTAMINA BALIKPAPAN",
    ),
    Port(
      name: "PLTU BARRU",
    ),
    Port(
      name: "PLTU BATANG",
    ),
    Port(
      name: "PLTU CILACAP",
    ),
    Port(
      name: "PLTU INDRAMAYU",
    ),
    Port(
      name: "PLTU JAWA 7",
    ),
    Port(
      name: "PLTU JENEPONTO",
    ),
    Port(
      name: "PLTU LABUAN",
    ),
    Port(
      name: "PLTU LONTAR",
    ),
    Port(
      name: "PLTU PACITAN",
    ),
    Port(
      name: "PLTU PAITON",
    ),
    Port(
      name: "PLTU Pangkalan Susu",
    ),
    Port(
      name: "PLTU PELABUHAN RATU",
    ),
    Port(
      name: "PLTU SURALAYA",
    ),
    Port(
      name: "PROBOLINGGO",
    ),
    Port(
      name: "PULANG PISAU",
    ),
    Port(
      name: "Pulau Gebe",
    ),
    Port(
      name: "REMBANG",
    ),
    Port(
      name: "SANGATTA",
    ),
    Port(
      name: "SEBAKIS",
    ),
    Port(
      name: "Siam City Cement Plant Jetty",
    ),
    Port(
      name: "SUNGAI DANAU",
    ),
    Port(
      name: "SUNGAI PUTING",
    ),
    Port(
      name: "T. TIMBAU",
    ),
    Port(
      name: "TABONEO",
    ),
    Port(
      name: "TANAH GROGOT",
    ),
    Port(
      name: "TARAHAN",
    ),
    Port(
      name: "TG. BATU",
    ),
    Port(
      name: "TG. SELOR",
    ),
    Port(
      name: "Tha Sala",
    ),
    Port(
      name: "Tha Thong",
    ),
    Port(
      name: "TRISAKTI",
    ),
    Port(
      name: "TUBAN",
    ),
    Port(
      name: "Vung Tau/HCM",
    ),
  ];

  Port? selectedPort;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - widget.customMargin * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Where is the ${widget.cargoState} port?',
          style: primaryTextStyle,
        ),
        const SizedBox(
          height: 5.0,
        ),
        DropdownMenu<Port>(
          leadingIcon: const Icon(Icons.near_me),
          width: width,
          menuHeight: 350,
          hintText: 'Select ${widget.cargoState} port',
          textStyle: primaryTextStyle,
          onSelected: (Port? value) {
            setState(() {
              selectedPort = value;
            });
          },
          dropdownMenuEntries: ports
              .map(
                (Port port) => DropdownMenuEntry<Port>(
                  value: port,
                  label: port.name,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(primaryTextStyle),
                  ),
                ),
              )
              .toList(),
        ),
        // if (selectedPort != null)
        //   Text('You selected a ${selectedPort?.name}')
        // else
        //   const Text('Please select an port.'),
      ],
    );
  }
}

class Port {
  final String name;

  Port({required this.name});
}
