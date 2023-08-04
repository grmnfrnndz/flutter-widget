import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SnackBarScreen extends StatelessWidget {

  static const String name = 'snackbar_screen';

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('snackbar_screen'),
      action: SnackBarAction(label: 'Aceptar', onPressed: (){},),
      duration: const Duration(seconds: 2),
      );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }


  void openDialog(BuildContext context) {

      showDialog(
        barrierDismissible: false,
        context: context, 
        builder: (context) => AlertDialog(
          backgroundColor: Colors.blue[50],
          title: const Text('estas seguro ?'),
          content: const Text('Veniam elit ad veniam nostrud tempor amet sunt do exercitation occaecat.'),
          actions: [
            TextButton(onPressed: () {
              context.pop();
            }, child: const Text('Cancelar')),
            
            FilledButton(onPressed: () {

              context.pop();
            }, child: const Text('Aceptar')),

          ],
        )
      );
  }


  const SnackBarScreen({super.key});





  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBarScreen'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(onPressed: () {
              showAboutDialog(applicationName: 'Widgets APP',
                context: context,
                children: [
                  const Text('Consequat nostrud sunt quis est esse ut magna consequat occaecat sunt reprehenderit pariatur excepteur enim.')
                ],
              );
            }, child: const Text('Licences Use')),
            FilledButton(onPressed: () {

              openDialog(context);

            }, child: const Text('Show Dialog')),
          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        label: const Text('showSnackBar'),
        icon: const Icon(Icons.remove_circle_outlined),
        onPressed: () => showCustomSnackbar(context), 
      
      ),
    );
  }
}