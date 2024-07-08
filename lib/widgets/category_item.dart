import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });
  final String title;
  final bool isSelected;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.w),
      onTap: onTap,
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          // TODO: Ubah border radius
          border: isSelected || onTap == null
              ? null
              : Border.all(
                  color: Theme.of(context).primaryColor,
                ),
          // TODO: Ubah warna jika selected atau jika ontap null
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: isSelected ? Colors.white : Colors.black,
                ),
          ),
        ),
      ),
    );
  }
}
