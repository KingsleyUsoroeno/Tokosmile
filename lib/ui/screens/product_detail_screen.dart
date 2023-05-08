import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokosmile/data/models/product.dart';
import 'package:tokosmile/ui/components/shared/icon_counter.dart';

enum _SelectedViewTab { aboutItem, reviews }

class ProductDetailScreen extends StatefulWidget {
  final Product product;
  final int index;

  const ProductDetailScreen({
    Key? key,
    required this.product,
    required this.index,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var _selectedTab = _SelectedViewTab.aboutItem;

  void _changeTab(_SelectedViewTab viewTab) {
    setState(() {
      _selectedTab = viewTab;
    });
  }

  bool get _isOnReviewsTab => _selectedTab == _SelectedViewTab.reviews;

  bool get _isOnAboutsTab => _selectedTab == _SelectedViewTab.aboutItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_sharp, color: Colors.grey, size: 20),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              widget.product.isBookmarked
                  ? "assets/images/svg/ic_heart_icon_filled.svg"
                  : "assets/images/svg/ic_heart.svg",
              width: 20,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined, color: Colors.black, size: 20),
            onPressed: () {},
          ),
          IconButton(
            icon: IconCounter(
              counterValue: "1",
              child: SvgPicture.asset("assets/images/svg/ic_shopping_bag.svg", width: 20),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 450,
                    width: double.infinity,
                    padding: const EdgeInsets.only(right: 10, left: 20, top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0), color: Colors.grey.shade100),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            ...widget.product.productSmallImages.map(
                              (image) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: AssetImage(image), fit: BoxFit.cover),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Hero(
                            tag: "${widget.product.image}${widget.index}",
                            transitionOnUserGestures: true,
                            child: Container(
                              height: 400,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(widget.product.image), fit: BoxFit.cover)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(Icons.ac_unit, size: 14),
                      const SizedBox(width: 6),
                      Text(
                        widget.product.sellerName,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.product.productDesc,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 23, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 18),
                          const SizedBox(width: 4.0),
                          Text(
                            "${widget.product.rating} Ratings",
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Text(
                        "${widget.product.reviews} Reviews",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "2.9K + Sold",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Stack(
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(top: 25), child: Divider(thickness: 2.3)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => _changeTab(_SelectedViewTab.aboutItem),
                                  child: Text(
                                    "About Item",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          fontSize: 16,
                                          fontWeight:
                                              _isOnAboutsTab ? FontWeight.w600 : FontWeight.w500,
                                          color: _isOnAboutsTab ? Colors.teal : Colors.grey,
                                        ),
                                  ),
                                ),
                                if (_isOnAboutsTab)
                                  const Divider(color: Colors.teal, thickness: 2, height: 26),
                                Padding(
                                  padding: EdgeInsets.only(top: _isOnReviewsTab ? 23 : 0, left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 12),
                                      _ItemRowDescription(
                                        title: "Brand:",
                                        value: widget.product.brandName,
                                      ),
                                      const SizedBox(height: 5),
                                      _ItemRowDescription(
                                        title: "Category:",
                                        value: widget.product.category,
                                      ),
                                      const SizedBox(height: 5),
                                      _ItemRowDescription(
                                        title: "Condition:",
                                        value: widget.product.condition,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () => _changeTab(_SelectedViewTab.reviews),
                                  child: Text(
                                    "Reviews",
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                        fontSize: 16,
                                        fontWeight:
                                            _isOnReviewsTab ? FontWeight.w600 : FontWeight.w500,
                                        color: _isOnReviewsTab ? Colors.teal : Colors.grey),
                                  ),
                                ),
                                if (_isOnReviewsTab)
                                  const Divider(color: Colors.teal, thickness: 2, height: 26),
                                Padding(
                                  padding: EdgeInsets.only(top: _isOnAboutsTab ? 28 : 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 12),
                                      _ItemRowDescription(
                                        title: "Color:",
                                        value: widget.product.color,
                                      ),
                                      const SizedBox(height: 5),
                                      _ItemRowDescription(
                                        title: "Material:",
                                        value: widget.product.material,
                                      ),
                                      const SizedBox(height: 5),
                                      _ItemRowDescription(
                                        title: "Size:",
                                        value: widget.product.size,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.grey.shade800, fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  ...widget.product.productCheckLists.map(
                    (checklist) => Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0, left: 4, right: 4),
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: "• ",
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 24),
                          children: [
                            TextSpan(
                              text: checklist,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.grey.shade700),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total Price",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      "\$${widget.product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.teal),
                    ),
                  ],
                ),
                Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.shopping_cart, color: Colors.white),
                                const SizedBox(width: 5),
                                Text(
                                  "1",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontSize: 20, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))),
                          child: Center(
                            child: Text(
                              "Buy Now",
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ItemRowDescription extends StatelessWidget {
  final String title;
  final String value;

  const _ItemRowDescription({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 12.0),
        Flexible(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
