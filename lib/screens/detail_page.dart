import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/models/item.model.dart';
import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_app_project_miaged/widgets/detail_body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: buildAppBar(context),
        body: DetailBodyView(
          item: item,
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(FontAwesomeIcons.arrowLeft),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(FontAwesomeIcons.cartShopping),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(
          width: 10.0,
        )
      ],
    );
  }
}
