import 'package:flutter/material.dart';
import 'package:flutter_widgets/config/menu/menu_items.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_widgets/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      //añadimos la key para que nos permita cerrar el side_menu
      key: scaffoldKey,

      appBar: AppBar(
        title: const Text('Flutter Material'),
      ),
      body: const _HomeView(),
      // Cajon o menu de opciones
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItem = appMenuItems[index];
          return _CustomListTitle(menuItem: menuItem);
        });
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        // menuItem.title == 'Botones' ? Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ButtonsScreen()))
        // : Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CardsScreen()));

        // Navigator.pushNamed(context, menuItem.link);

        //Navegacion go_router push
        context.push(menuItem.link);
        
        //Navegacion go_router pushnamed a una sola ruta
        // context.pushNamed(CardsScreen.name);
      },
    );
  }
}
