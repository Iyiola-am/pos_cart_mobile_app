import 'package:flutter/material.dart';
import 'package:pos_cart_mobile_app/store/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pos_cart_mobile_app/models/models.dart';
import 'package:pos_cart_mobile_app/components/components.dart';

class HomeBody extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return StoreConnector<StoreState, List<CartItem>>(
      converter: (store) => store.state.cartItems,
      builder: (buildContext, cartItems) => Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (buildContext, index) {
                  return CartItemTile(
                    cartItemIndex: index,
                    cartItem: cartItems.elementAt(index),
                  );
                },
              ),
            ),
            HomeBottomSheet(),
          ],
        ),
      ),
    );
  }
}
