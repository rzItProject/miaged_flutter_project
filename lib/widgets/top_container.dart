// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_app_project_miaged/utils/color.dart';
import 'package:flutter_app_project_miaged/utils/utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopContainer extends ConsumerWidget {
  final String title;

  const TopContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: kNornalStyle.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        /* const Spacer(),
        Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreygroundColor.withOpacity(0.8),
          ), */
        /* child: Stack(
            children: [
              const Icon(
                FontAwesomeIcons.bell,
                color: Colors.black54,
                size: 20,
              ),
              Positioned(
                right: 0,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kOrangeColor,
                  ),
                ),
              )
            ],
          ), 
        ),*/
        /* const SizedBox(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: CachedNetworkImage(
            imageUrl:
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8',
            height: 40,
            width: 40,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ), */
        // const SizedBox(width: 10),
        /* Container(
          height: 40,
          width: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreygroundColor.withOpacity(0.8),
          ),
          child: IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authRepositoryProvider).signOut();
            },
          ),
        ), */
      ],
    );
  }
}
