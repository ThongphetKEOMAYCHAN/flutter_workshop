import 'package:flutter/material.dart';
import 'package:flutter_app/routes.dart';
import 'screens/login.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Thongphet'),
              accountEmail: Text('test@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Image.network('https://24-ok.ru/image/null_user.jpg',

                ),

              ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Product'),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          ListTile(
            leading: Icon(Icons.settings_power, color: Colors.red,),
            title: Text('Log Out'),
            onTap: () => Navigator.pushReplacementNamed(context, Routes.logout),
          ),
        ],
      ),
    );
  }
}
