import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final bool readOnly, isEnabled;
  final String hint;

  const SearchBar({
    Key? key,
    this.readOnly = true,
    this.isEnabled = false,
    this.hint = "Search",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        readOnly: readOnly,
        enabled: isEnabled,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: const Icon(Icons.search),
        ),
      ),
    );
  }
}
