import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Info aleatoria para buscar comida',
      'assets/images/1.png'),
  SlideInfo('Entrega rapida', 'Info aleatoria para la entrega rapida',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Info aleatoria para disfrutar la comida',
      'assets/images/3.png'),
];

class TutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      } 
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      PageView(
          controller: pageViewController,
          //Necesario para que tenga el mismo comportamiento en ios y android
          physics: const BouncingScrollPhysics(),
          children: slides
              .map((slideData) => _Slide(
                  title: slideData.title,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl))
              .toList()),
      Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            child: const Text('Skip'),
            onPressed: () => context.pop(),
          )),
      endReached
          ? Positioned(
              bottom: 50,
              right: 50,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('comenzar')),
              ))
          : const SizedBox()
    ]));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(fontWeight: FontWeight.w600);
    final captionStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 15);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20),
          Text(title, style: titleStyle),
          const SizedBox(height: 8),
          Text(caption, style: captionStyle)
        ],
      )),
    );
  }
}
