import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:myapp/blocs/detail/detail_cubit.dart';
import 'package:myapp/widgets/category_item.dart';
import 'package:myapp/widgets/shimmer_widget.dart';

class DetailPageArgs {
  final int id;
  final String image;
  final String heroTag;

  DetailPageArgs({
    required this.id,
    required this.image,
    required this.heroTag,
  });
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.args});
  final DetailPageArgs args;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late DetailCubit detailCubit;

  @override
  void initState() {
    detailCubit = DetailCubit()..getDetail(widget.args.id);
    super.initState();
  }

  @override
  void dispose() {
    detailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => detailCubit,
      child: RefreshIndicator(
        onRefresh: () async {
          detailCubit.getDetail(widget.args.id);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(40.sp),
              child: Container(
                margin: EdgeInsets.all(8.sp),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.sp),
                ),
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Hero(
                tag: Key(widget.args.heroTag),
                child: Image.network(
                  widget.args.image,
                  fit: BoxFit.cover,
                  height: 250.h,
                  width: double.maxFinite,
                ),
              ),
              Gap(10.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  child: BlocBuilder<DetailCubit, DetailState>(
                    builder: (context, state) {
                      if (state is DetailLoaded) {
                        return Row(
                          children: state.data.category.map(
                            (e) {
                              return Padding(
                                padding: EdgeInsets.only(right: 5.w),
                                child: CategoryItem(
                                  title: e,
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
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: BlocBuilder<DetailCubit, DetailState>(
                  builder: (context, state) {
                    if (state is DetailLoaded) {
                      return Text(
                        state.data.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }

                    return ShimmerWidget(
                      height: 60.h,
                      width: double.maxFinite,
                      radius: 5.sp,
                    );
                  },
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: BlocBuilder<DetailCubit, DetailState>(
                  builder: (context, state) {
                    if (state is DetailLoaded) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'by ',
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  TextSpan(
                                    text: state.data.writer,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Gap(10.w),
                          Text(
                            state.data.date,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      );
                    }

                    return ShimmerWidget(
                      height: 30.h,
                      width: double.maxFinite,
                      radius: 5.sp,
                    );
                  },
                ),
              ),
              Gap(10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: BlocBuilder<DetailCubit, DetailState>(
                  builder: (context, state) {
                    if (state is DetailLoaded) {
                      return HtmlWidget(
                        state.data.content!,

                        renderMode: RenderMode.column,
                        // set the default styling for text
                        textStyle: Theme.of(context).textTheme.bodySmall,
                      );
                    }

                    return ShimmerWidget(
                      height: 250.h,
                      width: double.maxFinite,
                      radius: 5.sp,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
