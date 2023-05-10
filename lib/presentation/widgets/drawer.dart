import 'package:flutter/material.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const divider = Divider(
      color: Colors.black,
    );

    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Home'),
            //To perform action on tapping at tile
            onTap: () {
              Navigator.pop(context);
            },
          ),
          divider,
          ListTile(
            title: const Text('Categories'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          divider,
          ListTile(
            title: const Text('Review'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
