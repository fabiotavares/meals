import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/utils/utils.dart';

class MainDrawer extends StatelessWidget {
  Widget _createItem(IconData icon, String label, Function onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Utils.pushReplacementNamed(context: context, route: AppRoutes.HOME),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () => Utils.pushReplacementNamed(context: context, route: AppRoutes.SETTINGS),
          ),
        ],
      ),
    );
  }
}
