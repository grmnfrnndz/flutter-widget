import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ButtonsScreen extends StatelessWidget {

  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Wrap(
          // crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
            const ElevatedButton(onPressed: null, child: Text('ElevatedButton Disabled')),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.access_alarm_outlined), label: const Text('ElevatedButton.icon'),),

            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.safety_check_rounded), label: const Text('FilledButton.icon'),),

            OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
            OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.sailing), label: const Text('OutlinedButton')),

            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton.icon(onPressed: () {}, icon: const Icon(Icons.one_x_mobiledata_outlined), label: const Text('TextButton')),

            const Custombutton(),


            IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo_rounded)),
            IconButton(onPressed: (){}, icon: const Icon(Icons.add_a_photo_rounded), style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(colors.primary),
              iconColor: const MaterialStatePropertyAll(Colors.white),
              ),),

          ],
        )
      ),
    );
  }

}



class Custombutton extends StatelessWidget {
  const Custombutton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Custombutton', style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}