import 'package:flutter/material.dart';


class MenuItem {

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
    });
}

const appMenuItems = <MenuItem> [
  MenuItem(title: 'Buttons', subTitle: 'Many button on flutter', link: '/buttons', icon: Icons.smart_button_outlined),
  MenuItem(title: 'Cards', subTitle: 'Container with style', link: '/cards', icon: Icons.credit_card_outlined),
  MenuItem(title: 'ProgressIndicators', subTitle: 'Generals and Controled', link: '/progress', icon: Icons.refresh_outlined),
  MenuItem(title: 'Snackbar', subTitle: 'Snackbar and Dialog', link: '/snackbar', icon: Icons.info_outline),
  MenuItem(title: 'Animated Container', subTitle: 'Statefull Widget Animated', link: '/animated', icon: Icons.check_box_outlined),
  MenuItem(title: 'UI Controls + Tiles', subTitle: 'Controls on Flutters', link: '/ui-controls', icon: Icons.car_rental_outlined),
  MenuItem(title: 'Introduction App', subTitle: 'Small Tutorial Learn App', link: '/tutorial', icon: Icons.access_alarm_outlined),
  MenuItem(title: 'InfiniteScroll + Pull To Refresh', subTitle: 'List infinite and pull to refresh', link: '/infinite', icon: Icons.list_alt_outlined),
  MenuItem(title: 'Counter With Riverpod', subTitle: 'Counter with Riverpod', link: '/counter', icon: Icons.plus_one_outlined),
  MenuItem(title: 'Change Theme With Riverpod', subTitle: 'Change theme with Riverpod', link: '/theme-change', icon: Icons.theater_comedy),
];
