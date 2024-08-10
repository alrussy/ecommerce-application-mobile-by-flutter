import 'package:flutter/material.dart';
import 'package:r_store/const/color_const.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
            isDense: true,
            fillColor: whiteColor,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: 'searsh here....',
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: const Icon(
              Icons.search,
              size: 25,
            )),
      ),
    );
  }
}
