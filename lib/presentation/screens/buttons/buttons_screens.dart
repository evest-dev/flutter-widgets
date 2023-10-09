import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('Elevated Button')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated B. Disabled')),
            ElevatedButton.icon(
              onPressed: () {},
              label: const Text('Elevated Icon'),
              icon: const Icon(Icons.access_alarm_rounded),
            ),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            FilledButton.icon(
                onPressed: () {},
                label: const Text('Filled Button'),
                icon: const Icon(Icons.accessibility_new)),
            OutlinedButton(
                onPressed: () {}, child: const Text('Outlined Button')),
            OutlinedButton.icon(
                onPressed: () {},
                label: const Text('Outlined B. Icon'),
                icon: const Icon(Icons.terminal)),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.account_box_outlined),
                label: const Text('Text B. Icon')),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_registration_rounded),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: const MaterialStatePropertyAll(Colors.white)
                  ),
            ),
            IconButton.filled(
                onPressed: () {},
                icon: const Icon(Icons.app_registration_rounded)
            ),
            const CustomBotton()
          ],
        ),
      ),
    );
  }
}

class CustomBotton extends StatelessWidget {
  const CustomBotton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Custom Botton', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}