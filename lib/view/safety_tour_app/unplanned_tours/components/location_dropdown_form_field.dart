import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../model/location_dd_model.dart';
import '../../model/tour_model.dart';
import '../subview/add_unplanned_tour/model/IDropdownFormField.dart';
import '../subview/add_unplanned_tour/viewmodel/add_unplanned_tour_view_model.dart';

class LocationDropdownFormField extends StatefulWidget
    implements IDropdownFormField {
  const LocationDropdownFormField({
    Key? key,
    required this.tour,
    required this.viewModel,
    required this.context,
  }) : super(key: key);

  final TourModel tour;
  final BuildContext context;
  final AddUnPlannedTourViewModel viewModel;

  @override
  _LocationDropdownFormFieldState createState() =>
      _LocationDropdownFormFieldState();
}

class _LocationDropdownFormFieldState extends State<LocationDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: 'Lokasyon',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: context.textTheme.headline6!.copyWith(fontSize: 14.sp),
          contentPadding: context.paddingNormalAll,
        ),
        isExpanded: true,
        selectedItemBuilder: (context) => widget.viewModel.locations
            .map((location) => DropdownMenuItem(
                  child: Text(
                    location.locationName!,
                    style: context.textTheme.bodyText2,
                  ),
                  value: location.id,
                ))
            .toList(),
        style: context.textTheme.bodyText2,
        autofocus: true,
        dropdownColor: context.colors.onPrimary,
        menuMaxHeight: context.height * 0.3,
        validator: (val) {
          if (val == null) {
            return "Bu alan boş bırakılamaz";
          }
          return null;
        },
        isDense: true,
        hint: const Text('Lokasyon Seçiniz'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: widget.tour.locationId,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),
        iconSize: 24,
        onChanged: (int? newValue) {
          widget.viewModel.setSelectedLocationId(newValue);
          widget.tour.locationId = newValue!;
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        items: widget.viewModel.locations
            .map<DropdownMenuItem<int>>((LocationDDModel value) {
          return DropdownMenuItem<int>(
            value: value.id,
            child: Padding(
              padding: context.paddingLowAll,
              child: Text(
                value.locationName != null ? value.locationName! : "",
                style: context.textTheme.bodyText2!.copyWith(fontSize: 14),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
