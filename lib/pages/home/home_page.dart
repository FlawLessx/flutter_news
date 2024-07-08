import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:myapp/blocs/category/category_cubit.dart';
import 'package:myapp/blocs/newest/newest_cubit.dart';
import 'package:myapp/pages/home/widgets/category_section.dart';
import 'package:myapp/pages/home/widgets/featured_section.dart';
import 'package:myapp/pages/home/widgets/newest_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: Masukan fungsi bloc
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initData() {
    BlocProvider.of<CategoryCubit>(context).getCategory();
    BlocProvider.of<NewestCubit>(context).getNewest();

    // TODO: Tambahkan bloc untuk featured
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _initData();
      },
      child: Scaffold(
        appBar: null,
        body: SafeArea(
          child: ListView(
            children: [
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Breaking News!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    viewAllText(),
                  ],
                ),
              ),
              Gap(10.h),
              const FeaturedSection(),
              Gap(10.h),
              // TODO: Text trending
              Gap(10.h),
              const CategorySection(),
              Gap(10.h),
              const NewestSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget viewAllText() {
    return Text(
      'View all',
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            decoration: TextDecoration.underline,
          ),
    );
  }
}
