import 'package:flutter/material.dart';
import 'package:ui_ecommerce/model/cart.dart';
import 'package:ui_ecommerce/screens/cart/components/item.cart.dart';
import 'package:ui_ecommerce/size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: ListCart.length,
      itemBuilder: (context, index) {
        final Cart cart = ListCart[index];

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getPropScreenWidth(20),
            vertical: getPropScreenWidth(10),
          ),
          child: Dismissible(
            key: Key(cart.product.id.toString()),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) async {
              return await _showConfirmationDialog(context);
            },
            onDismissed: (direction) {
              setState(() {
                ListCart.removeAt(index);
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item berhasil dihapus!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            background: _buildDismissBackground(),
            child: _buildCartItem(cart),
          ),
        );
      },
    );
  }

  Widget _buildCartItem(Cart cart) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.grey.shade100],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
      ),
      child: ItemCart(cart: cart),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(right: getPropScreenWidth(20)),
            child: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }

  Future<bool?> _showConfirmationDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi'),
        content: const Text('Apakah Anda yakin ingin menghapus item ini?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Batal'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Hapus'),
          ),
        ],
      ),
    );
  }
}
