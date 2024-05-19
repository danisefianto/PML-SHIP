import 'package:flutter/material.dart';

import '../../core/styles.dart';

class SelectVesselDropdownWidget extends StatefulWidget {
  final double customMargin;

  const SelectVesselDropdownWidget({
    super.key,
    required this.customMargin,
  });

  @override
  State<SelectVesselDropdownWidget> createState() =>
      _SelectVesselDropdownWidgetState();
}

class _SelectVesselDropdownWidgetState
    extends State<SelectVesselDropdownWidget> {
  List<Vessel> vessels = [
    Vessel(
      name: "MV PATRIA NAWASENA 1",
    ),
    Vessel(
      name: "SAMASTA NINGRUM",
    ),
    Vessel(
      name: "TB BENGKALIS 1",
    ),
    Vessel(
      name: "TB BRAHMA 1",
    ),
    Vessel(
      name: "TB BRAHMA 10",
    ),
    Vessel(
      name: "TB BRAHMA 11",
    ),
    Vessel(
      name: "TB BRAHMA 12",
    ),
    Vessel(
      name: "TB BRAHMA 15",
    ),
    Vessel(
      name: "TB BRAHMA 2",
    ),
    Vessel(
      name: "TB BRAHMA 3",
    ),
    Vessel(
      name: "TB BRAHMA 5",
    ),
    Vessel(
      name: "TB BRAHMA 6",
    ),
    Vessel(
      name: "TB BRAHMA 7",
    ),
    Vessel(
      name: "TB BRAHMA 8",
    ),
    Vessel(
      name: "TB BRAHMA 9",
    ),
    Vessel(
      name: "TB BSP 01",
    ),
    Vessel(
      name: "TB EKA MARIS",
    ),
    Vessel(
      name: "TB EKA MARIS 10",
    ),
    Vessel(
      name: "TB EKA MARIS 8",
    ),
    Vessel(
      name: "TB EKA MARIS 9",
    ),
    Vessel(
      name: "TB FERY XXI",
    ),
    Vessel(
      name: "TB FERY XXIV",
    ),
    Vessel(
      name: "TB FERY XXVI",
    ),
    Vessel(
      name: "TB GONAYA",
    ),
    Vessel(
      name: "TB GONAYA X",
    ),
    Vessel(
      name: "TB GONAYA XXII",
    ),
    Vessel(
      name: "TB ISMAIL 01",
    ),
    Vessel(
      name: "TB KARYA ABADI 2",
    ),
    Vessel(
      name: "TB MARINO 178",
    ),
    Vessel(
      name: "TB MARINO 188",
    ),
    Vessel(
      name: "TB MARINO 189",
    ),
    Vessel(
      name: "TB MASADA 09",
    ),
    Vessel(
      name: "TB MEDELIN 1",
    ),
    Vessel(
      name: "TB MEDELIN OCEAN",
    ),
    Vessel(
      name: "TB MICHELLE 219-03",
    ),
    Vessel(
      name: "TB MITRA PASIFIK 2",
    ),
    Vessel(
      name: "TB PATRIA 1",
    ),
    Vessel(
      name: "TB PATRIA 10",
    ),
    Vessel(
      name: "TB PATRIA 11",
    ),
    Vessel(
      name: "TB PATRIA 15",
    ),
    Vessel(
      name: "TB PATRIA 16",
    ),
    Vessel(
      name: "TB PATRIA 17",
    ),
    Vessel(
      name: "TB PATRIA 18",
    ),
    Vessel(
      name: "TB PATRIA 19",
    ),
    Vessel(
      name: "TB PATRIA 2",
    ),
    Vessel(
      name: "TB PATRIA 20",
    ),
    Vessel(
      name: "TB PATRIA 22",
    ),
    Vessel(
      name: "TB PATRIA 23",
    ),
    Vessel(
      name: "TB PATRIA 24",
    ),
    Vessel(
      name: "TB PATRIA 25",
    ),
    Vessel(
      name: "TB PATRIA 26",
    ),
    Vessel(
      name: "TB PATRIA 27",
    ),
    Vessel(
      name: "TB PATRIA 29",
    ),
    Vessel(
      name: "TB PATRIA 3",
    ),
    Vessel(
      name: "TB PATRIA 30",
    ),
    Vessel(
      name: "TB PATRIA 31",
    ),
    Vessel(
      name: "TB PATRIA 32",
    ),
    Vessel(
      name: "TB PATRIA 34",
    ),
    Vessel(
      name: "TB PATRIA 35",
    ),
    Vessel(
      name: "TB PATRIA 36",
    ),
  ];

  final TextEditingController vesselController = TextEditingController();
  Vessel? selectedVessel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - widget.customMargin * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Vessel recommendation',
          style: primaryTextStyle,
        ),
        const SizedBox(
          height: 5.0,
        ),
        DropdownMenu<Vessel>(
          leadingIcon: const Icon(Icons.near_me),
          menuHeight: 350,
          width: width,
          hintText: 'Select vessel',
          textStyle: primaryTextStyle,
          onSelected: (Vessel? value) {
            setState(() {
              selectedVessel = value;
            });
          },
          dropdownMenuEntries: vessels
              .map(
                (Vessel vessel) => DropdownMenuEntry<Vessel>(
                  value: vessel,
                  label: vessel.name,
                  style: ButtonStyle(
                    textStyle: WidgetStateProperty.all(primaryTextStyle),
                  ),
                ),
              )
              .toList(),
        ),
        if (selectedVessel != null)
          Text('You selected a ${selectedVessel?.name}')
        else
          const Text('Please select an vessel.'),
      ],
    );
  }
}

class Vessel {
  final String name;

  Vessel({required this.name});
}
