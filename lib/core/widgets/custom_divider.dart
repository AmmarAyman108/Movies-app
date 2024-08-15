

import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      thickness: .3,
      endIndent: MediaQuery.of(context).size.width * .04,
      indent: MediaQuery.of(context).size.width * .04,
    );
  }
}