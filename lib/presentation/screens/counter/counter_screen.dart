import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/presentation/providers/counter_provider.dart';
import 'package:flutter_widgets/presentation/providers/theme_provider.dart';

//Cambiamos el extends 'StatelessWidget' por 'ConsumerWidget'
class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  //Agregamos el 'WidgetRef ref' dentro del build del Widget para dar la referencia y utilizar riverpod
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    //Con ref.watch(counterProvider) vamos a poder visualizar el estado definido en counter_provider que es 5
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RiverPod Counter'),
        actions: [
          //IconButton para cambiar el tema
          IconButton(
              onPressed: () {
                //leemos el valor booleano de isDarkModeProvider y lo notificamos para 
                //luego actualizar su estado al presionar (!isDarkMode) 
                ref
                .read(isDarkModeProvider.notifier)
                .update((state) => !isDarkMode);
              },
              //Cambiamos el icono de acuerdo al valor booleano(true / false) que tome isDarkmode
              icon: Icon(isDarkMode
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined))
        ],
      ),
      body: Center(child: Text('Valor $clickCounter', style: textStyle)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Con read leemos el valor del counterprovider, con notifier notificamos
          //su estado y lo actualizamos con state++
          ref.read(counterProvider.notifier).state++;
        },
        child: const Icon(Icons.plus_one_rounded),
      ),
    );
  
  }
}
