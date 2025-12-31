import 'package:flutter/material.dart';
import 'package:machinetask/core/constants.dart';
import 'package:machinetask/models/product_model.dart';
import 'package:machinetask/view/home/widget/detailed_section.dart';
import 'package:machinetask/view/home/widget/widget.dart';
import 'package:machinetask/viewmodel/product_model.dart';
import 'package:provider/provider.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductViewModel>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 7,
            crossAxisSpacing: 7,
            childAspectRatio: 2 / 3.30,
          ),
          itemCount: 10,
          itemBuilder: (_, index) {
            final p = value.products[index];
            return Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: ColorConstants.background),
              child: ProductCard(product: p),
            );
          },
        );
      },
    );
  }
}

class ProductCard extends StatefulWidget {
  final ProductModel product;
  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double radius = 16;
  double borderWidth = 4;

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlay(BuildContext context) {
    return OverlayEntry(
      builder: (_) => Stack(
        children: [
          GestureDetector(
            onTap: _removeOverlay,
            child: Container(color: Colors.black.withValues(alpha: 0.5)),
          ),

          DetailedSection(product: widget.product),
        ],
      ),
    );
  }

  void _showOverlay() {
    if (_overlayEntry != null) return;

    _overlayEntry = _createOverlay(context);
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOverlay,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            ImageSection(
              image: widget.product.image1,
              favorite: widget.product.favourite,
              bestseller: widget.product.bestseller,
            ),
            SizedBox(height: 10),
            OffSection(),
            SizedBox(height: 10),
            BrandNameSection(name: widget.product.name),
          ],
        ),
      ),
    );
  }
}
