import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text('Hola'),
      action: SnackBarAction(
        label: 'Ok!', 
        onPressed: (){}
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false, //Obligar a seleccionar una de las opciones definidas en los actions
      context: context,
      builder: (context) => AlertDialog(
        title:   const Text('Estas seguro?'),
        content: const Text('Amet excepteur amet cillum elit elit est fugiat. Pariatur mollit nulla nostrud duis nulla minim elit nisi ad ut commodo. Exercitation duis amet ipsum cillum reprehenderit ipsum magna eiusmod occaecat sint dolor duis exercitation.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Veniam irure officia culpa occaecat incididunt. Mollit do fugiat non aliqua ad est cupidatat enim. Laboris sunt officia sit enim. Eiusmod officia esse ea non id quis.')
                  ]
                );
              }, 
              child: const Text('Licencias usadas')
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Mostrar diálogo')
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_rounded),
        onPressed: () => showCustomSnackbar(context),
        // onPressed: (){
        //   showCustomSnackbar(context);
        //   // ScaffoldMessenger.of(context).showSnackBar(
        //   //   const SnackBar(content: Text('Hola'))
        //   // );
        // },
      ),
    );
  }
}