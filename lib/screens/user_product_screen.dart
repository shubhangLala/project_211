import 'package:flutter/material.dart';
import '../screens/edit_product.dart';
import '../widget/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widget/user_product_item.dart';

class UserProductScreen extends StatelessWidget {
  static const routeName = '/user-Products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemBuilder: (_, i) => Column(
            children: <Widget>[
              UserProductItem(productsData.items[i].id,
                  productsData.items[i].title, productsData.items[i].imageUrl),
              Divider()
            ],
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
