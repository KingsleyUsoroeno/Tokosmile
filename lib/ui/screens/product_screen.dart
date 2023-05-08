import 'package:flutter/material.dart';
import 'package:tokosmile/data/models/product.dart';
import 'package:tokosmile/ui/components/product_item.dart';
import 'package:tokosmile/ui/components/product_top_section.dart';
import 'package:tokosmile/ui/components/shared/search_top_bar.dart';
import 'package:tokosmile/ui/screens/product_detail_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final colors = [Colors.grey.withOpacity(0.2), Colors.orangeAccent.withOpacity(0.2)];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            pinned: true,
            floating: true,
            expandedHeight: 350.0,
            scrolledUnderElevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(top: 40, bottom: 4),
              title: innerBoxIsScrolled ? const SearchTopBar() : const SizedBox(),
              background: ProductScreenTopSection(),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(120),
              child: !innerBoxIsScrolled
                  ? const SizedBox.shrink()
                  : SizedBox(
                      width: double.infinity,
                      height: 120,
                      child: Column(
                        children: const [
                          Expanded(child: SearchTopBar()),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10, bottom: 13),
                            child: _BestOfSaleTextItem(),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        ];
      },
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12, right: 12.0, top: 30),
            child: _BestOfSaleTextItem(),
          ),
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: (3 / 4),
              crossAxisSpacing: 18,
              mainAxisSpacing: 14,
              children: [
                ...List.generate(products.length, (index) {
                  final product = products[index];
                  return ProductItem(
                    product: product,
                    index: index,
                    onTapped: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => ProductDetailScreen(product: product, index: index)),
                    ),
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BestOfSaleTextItem extends StatelessWidget {
  const _BestOfSaleTextItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Best Sale Product",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.w600, fontSize: 19, color: Colors.black87),
          ),
          Text(
            "See more",
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.teal, fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
