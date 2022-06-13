import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/extensions/context_extension.dart';
import '../../../model/abstract/ITourViewModel.dart';
import '../../../model/location_dd_model.dart';
import '../../../model/tour_model.dart';

class EditLocationDropdownFormField<T extends IEditUnplannedTourViewModel>
    extends StatelessWidget {
  const EditLocationDropdownFormField({
    Key? key,
    required this.context,
    required this.viewModel,
    required this.tour,
  }) : super(key: key);

  final BuildContext context;
  final T viewModel;
  final TourModel tour;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return DropdownButtonFormField<int>(
        decoration: InputDecoration(
          labelText: 'Lokasyon',
          labelStyle: context.textTheme.headline6!.copyWith(fontSize: 14.sp),
          contentPadding: context.paddingNormalAll,
        ),
        isExpanded: true,
        selectedItemBuilder: (context) => viewModel.locations
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
        value: tour.locationId,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),
        iconSize: 24,
        onChanged: (int? newValue) {
          viewModel.setSelectedLocationId(newValue);
          tour.locationId = newValue!;
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        items: viewModel.locations
            .map<DropdownMenuItem<int>>((LocationDDModel value) {
          return DropdownMenuItem<int>(
            value: value.id,
            child: Padding(
              padding: context.paddingLowAll,
              child: Text(
                value.locationName != null ? value.locationName! : "",
                style: context.textTheme.headline6!.copyWith(fontSize: 14),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
