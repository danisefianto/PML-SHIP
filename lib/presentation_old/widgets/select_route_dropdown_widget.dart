import 'package:flutter/material.dart';
import '../../common/styles.dart';

class SelectRouteDropdownWidget extends StatefulWidget {
  final double customMargin;

  const SelectRouteDropdownWidget({
    super.key,
    required this.customMargin,
  });

  @override
  State<SelectRouteDropdownWidget> createState() =>
      _SelectRouteDropdownWidgetState();
}

class _SelectRouteDropdownWidgetState extends State<SelectRouteDropdownWidget> {
  final TextEditingController RouteController = TextEditingController();
  Route? selectedRoute;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - widget.customMargin * 2;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Route recommendation',
          style: primaryTextStyle,
        ),
        SizedBox(
          height: 5.0,
        ),
        DropdownMenu<Route>(
          leadingIcon: Icon(Icons.near_me),
          width: width,
          hintText: 'Select Route',
          textStyle: primaryTextStyle,
          onSelected: (Route? value) {
            setState(() {
              selectedRoute = value;
            });
          },
          dropdownMenuEntries: routes
              .map(
                (Route route) => DropdownMenuEntry<Route>(
                  value: route,
                  label: route.name,
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(primaryTextStyle),
                  ),
                ),
              )
              .toList(),
        ),
        if (selectedRoute != null)
          Text('You selected a ${selectedRoute?.name}')
        else
          const Text('Please select an Route.'),
      ],
    );
  }
}

class Route {
  final String name;
  final String duration;
  final String cost;

  Route({
    required this.name,
    required this.duration,
    required this.cost,
  });
}

List<Route> routes = [
  Route(
    name: "Jakarta - Banjarmasin",
    duration: "Estimasi Perjalanan: 15 Days",
    cost: "Estimasi Harga: Rp35.000.000,",
  ),
  Route(
    name: "Jakarta - Surabaya - Banjarmasin",
    duration: "Estimasi Perjalanan: 20 Days",
    cost: "Estimasi Harga: Rp50.000.000,",
  ),
];
