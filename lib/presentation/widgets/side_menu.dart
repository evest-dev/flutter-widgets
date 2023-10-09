import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({
    super.key, 
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    //Obtenemos el padding en todos los dispositivos, en especial para responsividad en dispositivos con notch
    // y si este es mayor a 35, tenemos un notch
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    // Condicionamos para saber el padding tanto en android como en ios por consola
    // if (Platform.isAndroid) {
    //   print('Android $hasNotch');
    // } else {
    //   print('iOS $hasNotch');
    // }

    return NavigationDrawer(

        //Selecciona el index, en este caso navDrawerIndex toma el valor 0
        selectedIndex: navDrawerIndex,

        // Lleva a la ruta de acuerdo a la opcion seleccionada y actualizamos su estado
        onDestinationSelected: (value) {
          //Creamos una variable en donde sabemos cual es la opcion seleccionada
          final menuItems = appMenuItems[value];

          //Navegamos a la ruta seleccionada
          context.push(menuItems.link);

          //cerramos el side_menu
          widget.scaffoldKey.currentState?.closeDrawer();

          //Actualiza su estado
          setState(() {
            navDrawerIndex = value;
          });
        },
        children: [
          Padding(
              // Tanteamos con el valor de hasNotch, en este caso es 0 y 20
              padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
              child: const Text('Principal')),

          // Recorre los 3 primeros elementos del arreglo appMenuItems, pasandole los items dentro de icon y label,
          // que en este caso son los 3 items principales
          ...appMenuItems.sublist(0, 3).map((item) =>
              NavigationDrawerDestination(
                  icon: Icon(item.icon), label: Text(item.title))),

          // Creamos un divisor dentro de un pading para separar las opciones principales de las opcionales
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 10, 16, 10), child: Divider()),

          // Creamos el titulo 'MoreOptions' dentro del padding en donde colocaremos los items faltantes
          const Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
              child: Text('More Options')),

          // Recorre del arreglo 3 hasta completar todos los elementos de appMenuItems, pasandole los items dentro
          // de icon y label faltantes, que en este caso son los items opcionales
          ...appMenuItems.sublist(3).map((item) => NavigationDrawerDestination(
              icon: Icon(item.icon), label: Text(item.title))),
        ]);
  }
}
