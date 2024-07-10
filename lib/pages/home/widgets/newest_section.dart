import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:myapp/blocs/newest/newest_cubit.dart';
import 'package:myapp/constants/app_route.dart';
import 'package:myapp/models/news.dart';
import 'package:myapp/pages/detail/detail_page.dart';
import 'package:myapp/widgets/shimmer_widget.dart';

class NewestSection extends StatelessWidget {
  const NewestSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestCubit, NewestState>(
      builder: (context, state) {
        if (state is NewestLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              bottom: 20.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.data.length,
            separatorBuilder: (context, index) {
              return Gap(10.h);
            },
            itemBuilder: (context, index) {
              return NewestItem(
                data: state.data[index],
              );
            },
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            bottom: 20.h,
          ),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          separatorBuilder: (context, index) {
            return Gap(10.h);
          },
          itemBuilder: (context, index) {
            return ShimmerWidget(
              height: 150.h,
              width: double.maxFinite,
              radius: 15.sp,
            );
          },
        );
      },
    );
  }
}

class NewestItem extends StatelessWidget {
  const NewestItem({
    super.key,
    required this.data,
  });
  final News data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
       // TODO: Navigasi ke detail
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.sp),
        child: SizedBox(
          height: 150.h,
          child: Stack(
            children: [
              Positioned.fill(
                bottom: 5.h,
                child: Hero(
                  tag: Key('${data.id}-newest'),
                  child: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
             // TODO: Informasi berita
            ],
          ),
        ),
      ),
    );
  }
}
