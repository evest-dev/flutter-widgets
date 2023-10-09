import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbardScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbardScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: const Text('Snackbar Text'),
      action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Estas seguro?'),
              content: const Text(
                  'Estas seguro de que quieres ver el dialogo de prueba de Flutter'),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancel')
                  ),
                  FilledButton(
                    onPressed: () => {context.pop(), showCustomSnackbar(context)},
                    child: const Text('Aceptar')
                  )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Dialogos'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'A continuacion se detallaran las licencias utilizadas en el proyecto de flutter widgets.')
              ]);
            },
            child: const Text('Licencias usadas'),
          ),
          FilledButton.tonal(
            onPressed: () {
              openDialog(context);
            },
            child: const Text('Mostrar dialogo'),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
          label: const Text('Mostrar Snackbar'),
          icon: const Icon(Icons.remove_red_eye_outlined),
          onPressed: () => showCustomSnackbar(context)),
    );
  }
}
