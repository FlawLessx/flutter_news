import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:myapp/blocs/detail/detail_cubit.dart';

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
    // TODO: Ambil data dengan bloc
    super.initState();
  }

  @override
  void dispose() {
    detailCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: wrap dengan bloc provider
    return RefreshIndicator(
      onRefresh: () async {
        // TODO: Ambil data dengan bloc
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              // TODO: Navigasi ke menu sebelumnya
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
        // TODO: Tampilkan body di belakang appbar
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
            // TODO: List category dari berita yang di pilih
            Gap(10.h),
            // TODO: Title berita
            Gap(10.h),
            // TODO: Informasi penulis
            Gap(10.h),
            // TODO: Content isi berita
          ],
        ),
      ),
    );
  }
}
