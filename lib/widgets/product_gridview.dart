import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_app_project_miaged/screens/detail_page.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductView extends StatelessWidget {
  final List<Item> list;
  const ProductView({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      // scrollDirection: Axis.horizontal,
      crossAxisCount: 2,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return singleItemWidgetV1(
            context, list[index], index == list.length - 1 ? true : false);
      },
    );
  }

  Widget singleItemWidgetV1(BuildContext context, Item item, bool lastItem) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: item),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: 180,
                width: 160,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.0),
                  child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: item.url,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  top: 10.0,
                ),
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: kTitleStyle.copyWith(fontSize: 15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  "${item.price} €",
                ),
              ),
              SizedBox(
                height: lastItem == true
                    ? MediaQuery.of(context).size.height * 0.50
                    : 0,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget singleItemWidgetV2(BuildContext context, Item item, bool lastItem) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(item: item),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(1, 1),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: CachedNetworkImage(
                        imageUrl: item.url,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 10.0,
                      ),
                      child: Text(
                        item.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: kTitleStyle.copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        "${item.price} €",
                      ),
                    )
                  ],
                ),
              ),
              // ajout favoris
            ],
          ),
        ),
        SizedBox(
          height:
              lastItem == true ? MediaQuery.of(context).size.height * 0.50 : 0,
        ),
      ],
    );
  }
}
