import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tokosmile/ui/components/shared/icon_counter.dart';
import 'package:tokosmile/ui/components/search_bar.dart';

class SearchTopBar extends StatelessWidget {
  const SearchTopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        children: [
          const Expanded(child: SearchBar()),
          const SizedBox(width: 18),
          IconCounter(
            counterValue: "1",
            child: SvgPicture.asset("assets/images/svg/ic_shopping_bag.svg", width: 23, height: 23),
          ),
          const SizedBox(width: 10),
          IconCounter(
            counterValue: "9+",
            child: SvgPicture.asset("assets/images/svg/ic_message.svg", width: 23, height: 23),
          ),
        ],
      ),
    );
  }
}