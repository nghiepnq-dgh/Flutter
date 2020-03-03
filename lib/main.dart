import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Dev',
    home: Shopping(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: "Chocolate Chips")
      ],
    ),
  ));
}

class Product {
  const Product({this.name});
  final String name;
}

// 1 funtion co dang object
typedef void CartChangedCallBack(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({this.product, this.inCart, this.onCartChanges})
      : super(key: ObjectKey(product));
  final Product product;
  final bool inCart;
  final CartChangedCallBack onCartChanges;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;
    return TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanges(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

// statefull
class Shopping extends StatefulWidget {
  Shopping({Key key, this.products}) : super(key: key);
  final List<Product> products;
  @override
  _ShoppingState createState() => _ShoppingState();
}

class _ShoppingState extends State<Shopping> {
  Set<Product> _shoppingCart = Set<Product>();
  void _handeCartChanged(Product product, bool inCart) {
    if (!inCart) {
      _shoppingCart.add(product);
    } else {
      _shoppingCart.remove(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List item")),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
              product: product,
              inCart: _shoppingCart.contains(product),
              onCartChanges: _handeCartChanged, );
        }).toList(),
      ),
    );
  }
}
