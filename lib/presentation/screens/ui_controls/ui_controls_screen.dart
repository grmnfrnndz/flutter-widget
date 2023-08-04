import 'package:flutter/material.dart';

class UiControlScreen extends StatelessWidget {
  static const String name = 'uicontrol_screen';

  const UiControlScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UiControlScreen'),
      ),
      body: _UiControlsView(),
    );
  }
}

enum Transportation { car, plane, boat, airplane }

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wanstBreakfast = false;
  bool wanstLunch = false;
  bool wanstDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Controls additional'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Transportations'),
          subtitle: Text('$selectedTransportation'),
          children: [
            RadioListTile(
                title: const Text('By Car'),
                subtitle: const Text('Driven'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {});
                  selectedTransportation = Transportation.car;
                }),
            RadioListTile(
                title: const Text('By Plane'),
                subtitle: const Text('Planing'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {});
                  selectedTransportation = Transportation.plane;
                }),
            RadioListTile(
                title: const Text('By Boat'),
                subtitle: const Text('Swiming'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {});
                  selectedTransportation = Transportation.boat;
                }),
            RadioListTile(
                title: const Text('By Airplane'),
                subtitle: const Text('Aircraft'),
                value: Transportation.airplane,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {});
                  selectedTransportation = Transportation.airplane;
                }),
          ],
        ),


        CheckboxListTile(
          title: const Text('Breakfast?'),
          value: wanstBreakfast, 
          onChanged: (value) => setState(() {
            wanstBreakfast = !wanstBreakfast;
          })
        ),
        CheckboxListTile(
          title: const Text('Lunch?'),
          value: wanstLunch, 
          onChanged: (value) => setState(() {
            wanstLunch = !wanstLunch;
          })
        ),
        CheckboxListTile(
          title: const Text('Dinner?'),
          value: wanstDinner, 
          onChanged: (value) => setState(() {
            wanstDinner = !wanstDinner;
          })
        ),
      ],
    );
  }
}
