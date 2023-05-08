import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tokosmile/ui/components/product_screen_categories.dart';
import 'package:tokosmile/ui/components/shared/search_top_bar.dart';

class ProductScreenTopSection extends StatelessWidget {
  final colors = [Colors.grey.withOpacity(0.2), Colors.orangeAccent.withOpacity(0.2)];
  final pageController = PageController();

  ProductScreenTopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: pageController,
            itemCount: colors.length,
            itemBuilder: (_, index) {
              return Container(
                color: colors[index],
                padding: const EdgeInsets.only(top: 56.0, right: 8, left: 8),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SearchTopBar(),
                        Padding(
                          padding: const EdgeInsets.only(left: 14.0, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 22.0),
                              Text(
                                "#FASHION DAY",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                "80% OFF",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 30.0, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6.0),
                              Text(
                                "Discover fashion that suits to\nyour style",
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 14.0),
                              Container(
                                width: 120,
                                height: 33,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.circular(6.0)),
                                child: Center(
                                  child: Text(
                                    'Check this out',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 16, left: 20),
                        child: SmoothPageIndicator(
                          controller: pageController, // PageController
                          count: colors.length,
                          effect: const WormEffect(dotHeight: 4, dotWidth: 10),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        const ProductScreenCategories(),
      ],
    );
  }
}
