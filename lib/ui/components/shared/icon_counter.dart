import 'package:flutter/material.dart';

class IconCounter extends StatelessWidget {
  final Widget child;
  final String counterValue;

  const IconCounter({
    Key? key,
    required this.child,
    required this.counterValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(padding: const EdgeInsets.all(4), child: child),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(4))),
            width: 17,
            height: 15,
            padding: const EdgeInsets.only(top: 0.5),
            child: Text(
              counterValue,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 10),
            ),
          ),
        )
      ],
    );
  }
}
