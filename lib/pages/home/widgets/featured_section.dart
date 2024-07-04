import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:myapp/blocs/featured/featured_cubit.dart';
import 'package:myapp/constants/app_route.dart';
import 'package:myapp/models/news.dart';
import 'package:myapp/pages/detail/detail_page.dart';
import 'package:myapp/widgets/shimmer_widget.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedCubit, FeaturedState>(
      builder: (context, state) {
        if (state is FeaturedLoaded) {
          return SizedBox(
            height: 200.h,
            width: double.maxFinite,
            child: PageView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return FeaturedItem(data: state.data[index]);
              },
            ),
          );
        }

        return ShimmerWidget(
          height: 200.h,
          width: double.maxFinite,
          radius: 0,
        );
      },
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
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black12, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'by ${data.writer}',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.white60,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gap(10.w),
                      Text(
                        data.date,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white60,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
