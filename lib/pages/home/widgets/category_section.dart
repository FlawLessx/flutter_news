import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/blocs/category/category_cubit.dart';
import 'package:myapp/blocs/newest/newest_cubit.dart';
import 'package:myapp/widgets/category_item.dart';
import 'package:myapp/widgets/shimmer_widget.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CategoryCubit, CategoryState>(
      listener: (context, state) {
        if (state is CategoryLoading) {
          selectedIndex = 0;
        }
      },
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoaded) {
                return Row(
                  children: state.data.asMap().entries.map(
                    (e) {
                      return Padding(
                        padding: EdgeInsets.only(right: 5.w),
                        child: CategoryItem(
                          title: e.value,
                          isSelected: selectedIndex == e.key,
                          onTap: () {
                            selectedIndex = e.key;
                            setState(() {});
                            BlocProvider.of<NewestCubit>(context).getNewest(
                              category: selectedIndex == 0 ? null : e.value,
                            );
                          },
                        ),
                      );
                    },
                  ).toList(),
                );
              }

              return Row(
                children: List.generate(5, (value) => value).map(
                  (element) {
                    return Padding(
                      padding: EdgeInsets.only(right: 5.w),
                      child: ShimmerWidget(
                        height: 30.h,
                        width: 90.w,
                        radius: 20.w,
                      ),
                    );
                  },
                ).toList(),
              );
            },
          ),
        ),
      ),
    );
  }
}
