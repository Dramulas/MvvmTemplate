import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../model/field_dd_model.dart';
import '../../../model/tour_model.dart';
import '../../../unplanned_tours/subview/edit_unplanned_tour/model/tour_dto.dart';
import '../viewmodel/edit_planned_tour_view_model.dart';

class EditFieldDropdownFormField extends StatefulWidget {
  const EditFieldDropdownFormField({
    Key? key,
    required this.tour,
    required this.context,
    required this.viewModel,
    required this.items,
    required this.tourDto,
  }) : super(key: key);

  final TourModel tour;
  final BuildContext context;
  final EditPlannedTourViewModel viewModel;
  final List<FieldDDModel?>? items;
  final TourDto tourDto;

  @override
  _EditFieldDropdownFormFieldState createState() =>
      _EditFieldDropdownFormFieldState();
}

class _EditFieldDropdownFormFieldState
    extends State<EditFieldDropdownFormField> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<int?>(
      decoration: InputDecoration(
        labelText: 'Saha',
        labelStyle: context.textTheme.headline6!.copyWith(
          fontSize: 14.sp,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: context.paddingNormalAll,
      ),
      isExpanded: true,
      style: context.textTheme.bodyText2,
      autofocus: true,
      dropdownColor: context.colors.onPrimary,
      menuMaxHeight: context.height * 0.3,
      validator: (val) {
        if (val == null) {
          return "Bu alan boş bırakılamaz";
        }
      },
      isDense: true,
      hint: const Text('Saha Seçiniz'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      value: widget.items?.first?.id,
      icon: const Icon(
        Icons.arrow_drop_down_outlined,
      ),
      iconSize: 24,
      onChanged: (int? newValue) {
        widget.tour.fieldId = newValue!;
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      items: widget.items?.map<DropdownMenuItem<int?>>((FieldDDModel? value) {
            return DropdownMenuItem<int?>(
              value: value?.id ?? null,
              child: Text(value?.fieldName ?? "Bu lokasyon altında saha yok"),
            );
          }).toList() ??
          [
            DropdownMenuItem(
                value: null, child: Text("Bu lokasyon altında saha yok"))
          ],
    );
  }
}
