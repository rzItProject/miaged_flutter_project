import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_project_miaged/data/providers/cart_provider.dart';
import 'package:flutter_app_project_miaged/data/models/item.model.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailBodyView extends ConsumerWidget {
  const DetailBodyView({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.3),
                padding: EdgeInsets.only(top: size.height * 0.18),
                // height: 500,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      priceAndSize(context, item),
                      const SizedBox(height: 15.0),
                      description(),
                      const Spacer(),
                      addToCart(ref, context),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
              productTitleAndImage(context)
            ],
          ),
        )
      ],
    );
  }

  Row addToCart(WidgetRef ref, BuildContext context) {
    return Row(
      children: [
        Container(
          height: 50,
          width: 50,
          margin: const EdgeInsets.only(right: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            shape: BoxShape.rectangle,
            color: Colors.black,
          ),
          child: IconButton(
            icon: const Icon(FontAwesomeIcons.cartShopping),
            color: Colors.white,
            onPressed: () {
              ref.read(cartStateProvider.notifier).addItemToCart(item);
              showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                  title: Text("Article ajouté au panier avec succes !"),
                  content: Text('Vérifiez votre panier'),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
                // padding: const EdgeInsets.all(16.0),
                textStyle: const TextStyle(fontSize: 24),
              ),
              onPressed: () {},
              child: Text(
                'Acheter'.toUpperCase(),
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding description() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis at dignissim lacus. Etiam cursus finibus odio, id placerat urna tincidunt vulputate. Curabitur a varius est',
        style: TextStyle(height: 1.5),
      ),
    );
  }

  Padding productTitleAndImage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.brand,
            style: kNornalStyle.copyWith(color: Colors.white, fontSize: 20),
          ),
          Text(
            item.title,
            style: kTitleStyle.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28.0),
                  child: CachedNetworkImage(
                    height: 250,
                    imageUrl: item.url,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Row priceAndSize(BuildContext context, Item item) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Prix\n',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: '${item.price}€',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Taille\n',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                TextSpan(
                  text: item.size,
                  style: Theme.of(context).textTheme.headlineSmall,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
