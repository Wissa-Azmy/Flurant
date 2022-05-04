import 'package:flurant/common/app.dart';
import 'package:flurant/screens/admin_screens/all_orders_screen.dart';
import 'package:flurant/screens/admin_screens/all_products_screen.dart';
import 'package:flutter/material.dart';

import 'drawer_link.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  void openSettingsScreen() {}

  void openStatisticsScreen() {}

  void openAllOrdersScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AllOrdersScreen.routeName);
  }

  void openAllProductsScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AllProductsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: App.theme.primaryColor,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.bottomLeft,
            child: Text('Admin',
                style: App.textTheme.titleLarge?.copyWith(color: Colors.white)),
          ),
          const SizedBox(height: 20),
          DrawerLink(
            title: 'All Products',
            icon: Icons.payment,
            tapHandler: () => openAllProductsScreen(context),
          ),
          const SizedBox(height: 20),
          DrawerLink(
            title: 'All Orders',
            icon: Icons.payment,
            tapHandler: () => openAllOrdersScreen(context),
          ),
          const SizedBox(height: 20),
          DrawerLink(
            title: 'Statistics',
            icon: Icons.pie_chart,
            tapHandler: () => openStatisticsScreen,
          ),
          const SizedBox(height: 20),
          DrawerLink(
            title: 'Settings',
            icon: Icons.settings,
            tapHandler: openSettingsScreen,
          ),
        ],
      ),
    );
  }
}
