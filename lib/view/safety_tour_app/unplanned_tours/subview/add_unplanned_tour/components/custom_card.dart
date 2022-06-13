import '../../../../model/tour_model.dart';
import '../viewmodel/add_unplanned_tour_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String? title;
  final AddUnPlannedTourViewModel? viewModel;
  final Widget child;
  final TourModel? tour;
  const CustomCard({
    Key? key,
    this.tour,
    this.viewModel,
    required this.child,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: context.colors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Container(
        padding: context.paddingLowAll,
        child: ListTile(
          title: title != null
              ? Text(
                  title ?? "",
                  style: context.textTheme.headline6!.copyWith(fontSize: 16),
                )
              : null,
          subtitle: child,
        ),
      ),
    );
  }
}
