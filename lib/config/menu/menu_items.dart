import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  
  MenuItem(
      title: 'CounterScreen',
      subTitle: 'Contador con RiverPod',
      link: '/riverpod',
      icon: Icons.waves),
  MenuItem(
      title: 'Botones',
      subTitle: 'Varios Botones',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subTitle: 'Contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Snackbars y dialogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Animated Container',
      subTitle: 'Statefull Widget animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'UI Controls + Titles',
      subTitle: 'Serie de controles en flutters',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Introduccion a la Aplicacion',
      subTitle: 'Pequeño tutorial Introductorio',
      link: '/tutorial',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Infinite Scroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infite-scroll',
      icon: Icons.list_alt_rounded),
  
  MenuItem(
      title: 'Change Theme',
      subTitle: 'Cambiar distintos temas oscuros',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
      
];
