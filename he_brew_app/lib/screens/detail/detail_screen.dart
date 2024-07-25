import 'package:flutter/material.dart';
import 'package:he_brew_app/theme.dart';
import 'package:he_brew_app/models/product_model.dart';
import 'package:he_brew_app/screens/detail/widget/add_to_cart.dart';
import 'package:he_brew_app/screens/detail/widget/description.dart';
import 'package:he_brew_app/screens/detail/widget/detail_app_bar.dart';
import 'package:he_brew_app/screens/detail/widget/items_details.dart';
import 'package:he_brew_app/screens/detail/widget/image_view.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: contentColor,
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DetailAppBar(product: widget.product),
              ImageView(
                image: widget.product.image,
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 300,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ItemsDetails(product: widget.product),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(bottom: 100),
                      color: Colors.transparent,
                      child: Description(
                        description: widget.product.description,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
