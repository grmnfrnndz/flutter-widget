import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter + Material 3"),
        centerTitle: true,
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    const menuItems = appMenuItems;


    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: menuItems.length,
      itemBuilder: (BuildContext context, int index) { 
        final menuItem = menuItems[index];

        return _CustomListTile(menuItem: menuItem);

       },

    );
  }

}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {

        // types of navigations

        //  1 mode
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => const ButtonsScreen(),
        //   ),
        // );

        // 2 mode
        // Navigator.pushNamed(context, menuItem.link);

        context.push(menuItem.link);
        

      },
    );
  }
}
