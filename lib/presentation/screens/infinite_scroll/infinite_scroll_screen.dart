import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class InfiniteScreen extends StatefulWidget {
  static const name = 'infinite_screen';

  const InfiniteScreen({super.key});

  @override
  State<InfiniteScreen> createState() => _InfiniteScreenState();
}

class _InfiniteScreenState extends State<InfiniteScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  // Funcion para actualizar los elementos
  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;

    setState(() {});

    moveScrollToBottom();
  }

  //Funcion refrescar los nuevos elementos de loadNextPage
  Future<void> onRefresh() async {
    //Actualiza el estado a true para indicar la carga
    isLoading = true;
    setState(() {});

    //establece el tiempo de duracion del loading de 1 segundo
    await Future.delayed(const Duration(seconds: 1));

    //verifica si la condicion es falsa, si es verdadera no retorna nada
    if (!isMounted) return;

    //cambia el estado a falso para que se sincronice con el floatingactionbutton
    isLoading = false;

    // obtiene el ultimo id
    final lastId = imagesIds.last;

    //Limpia todos los elementos
    imagesIds.clear();

    //añade +1 al ultimo elemento
    imagesIds.add(lastId + 1);

    //Carga los nuevos elementos al funcion del ultimo imagesId
    addFiveImages();

    //actualiza su estado
    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 200),
        curve: Curves.fastOutSlowIn);
  }

  // Añade un map de 5 elementos al listado de imagesIds para que incremente de forma continua
  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 20,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading3.gif'),
                // url dinamica que recorre los imagesIds del listado
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          // child:
          child: isLoading
              ? SpinPerfect(
                  infinite: true, child: const Icon(Icons.refresh_rounded))
              : FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))),
    );
  }
}

class CircleListItem extends StatelessWidget {
  const CircleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: 54,
        height: 54,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: ClipOval(
          child: Image.network(
            'https://docs.flutter.dev/cookbook'
            '/img-files/effects/split-check/Avatar1.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
