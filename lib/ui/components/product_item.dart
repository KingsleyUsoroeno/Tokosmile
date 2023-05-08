import 'package:flutter/material.dart';
import 'package:tokosmile/data/models/product.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  final VoidCallback onTapped;
  final Product product;
  final int index;

  const ProductItem({
    Key? key,
    required this.product,
    required this.onTapped,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.0),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.grey, offset: Offset(0.0, 0.0), blurRadius: 0.1)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: "${product.image}$index",
            transitionOnUserGestures: true,
            child: Material(
              child: InkWell(
                onTap: onTapped,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(product.image), fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6.0), topRight: Radius.circular(6.0))),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, top: 5.0),
                      child: SvgPicture.asset(
                        product.isBookmarked
                            ? "assets/images/svg/ic_heart_icon_filled.svg"
                            : "assets/images/svg/ic_heart.svg",
                        width: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.category,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 14),
                ),
                const SizedBox(height: 5.0),
                Text(
                  product.productDesc,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.3, fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 16),
                        const SizedBox(width: 4.0),
                        Text(
                          "${product.rating} | ${product.reviews}",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                        )
                      ],
                    ),
                    Text(
                      "\$${product.price}",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 16, color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
