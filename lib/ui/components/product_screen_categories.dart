import 'package:flutter/material.dart';
import 'package:tokosmile/data/models/product_screen_category.dart';

class ProductScreenCategories extends StatelessWidget {
  const ProductScreenCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ...productScreenCategories.map((category) {
            return _CategoryItem(category: category);
          })
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final ProductScreenCategory category;

  const _CategoryItem({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Center(child: Icon(category.iconData)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          category.name,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 13,
              ),
        )
      ],
    );
  }
}
