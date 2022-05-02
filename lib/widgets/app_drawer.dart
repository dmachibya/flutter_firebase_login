import 'package:sample_app/utils/routes.dart';
import 'package:flutter/material.dart';

class AppDrawer {
  static getDrawer(context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: Icon(Icons.person_outline),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Juma Ally",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Customer Account",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade600),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Divider(),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text(
              "Home",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            title: Text(
              "My Wishlist",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart_outlined),
            title: Text(
              "Cart",
              style: TextStyle(color: Colors.grey.shade700),
            ),
            onTap: () {
              Navigator.pushNamed(context, cartRoute);
              print("clicked");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text(
              "Settings",
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
