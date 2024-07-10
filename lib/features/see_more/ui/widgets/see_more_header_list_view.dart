import 'package:flutter/material.dart';
import 'package:food_recipes_app/features/see_more/ui/widgets/see_more_header_list_veiw_item.dart';

class SeeMoreHeaderListView extends StatelessWidget {
  const SeeMoreHeaderListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (ctx, index) => const SeeMoreHeaderListViewItem(
        title: 'See More Screen',
      ),
    );
  }
}
