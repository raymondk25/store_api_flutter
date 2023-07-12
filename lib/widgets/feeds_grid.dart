import 'package:flutter/material.dart';

import '../models/products_model.dart';
import '../widgets/feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList}) : super(key: key);
  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: productsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (ctx, index) {
            return FeedsWidget(
              title: productsList[index].title.toString(),
              imageUrl: productsList[index].images!.first,
            );
          }),
    );
  }
}
