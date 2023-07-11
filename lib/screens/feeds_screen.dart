import 'package:flutter/material.dart';

import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 4,
        title: const Text('All Products'),
      ),
      body: SingleChildScrollView(
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 0.0, mainAxisSpacing: 0.0, childAspectRatio: 0.7),
            itemBuilder: (ctx, index) {
              return const FeedsWidget();
            }),
      ),
    );
  }
}
