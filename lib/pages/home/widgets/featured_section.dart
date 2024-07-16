import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:myapp/constants/app_route.dart';
import 'package:myapp/models/news.dart';
import 'package:myapp/pages/detail/detail_page.dart';
import 'package:myapp/widgets/shimmer_widget.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidget(
      height: 200.h,
      width: double.maxFinite,
      radius: 0,
    );
  }
}

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key, required this.data});
  final News data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoute.detail,
          arguments: DetailPageArgs(
            id: data.id,
            image: data.image,
            heroTag: '${data.id}-featured',
          ),
        );
      },
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag: Key('${data.id}-featured'),
              child: Image.network(
                data.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
