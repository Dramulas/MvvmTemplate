import '../../../../model/tour_model.dart';
import '../viewmodel/add_unplanned_tour_view_model.dart';
import 'package:flutter/material.dart';

abstract class IDropdownFormField extends Widget {
  final AddUnPlannedTourViewModel viewModel;
  final TourModel? tour;
  final BuildContext context;
  IDropdownFormField(this.viewModel, this.tour, this.context);
}
