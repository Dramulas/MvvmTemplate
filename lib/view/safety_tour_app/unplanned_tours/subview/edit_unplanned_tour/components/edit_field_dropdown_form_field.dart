import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/context_extension.dart';
import '../../../../model/field_dd_model.dart';
import '../../../../model/tour_model.dart';
import '../model/tour_dto.dart';
import '../viewmodel/edit_unplanned_tour_view_model.dart';

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
  final EditUnPlannedTourViewModel viewModel;
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
        widget.tourDto.fieldId = newValue!;
        FocusScope.of(context).requestFocus(FocusNode());
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

    // print(widget.items);
    // print(widget.viewModel.selectedLocationId);
    // return CustomSearchableDropDown(
    //   showClearButton: false,
    //   items: widget.items,
    //   label: 'Saha seçiniz',
    //   dropdownHintText: "Saha seçiniz",
    //   hint: "Saha seçiniz",
    //   menuHeight: 90.h,
    //   menuPadding: EdgeInsets.all(8.0),
    //   menuMode: true,
    //   hideSearch: true,
    //   multiSelectValuesAsWidget: true,
    //   dropdownItemStyle: context.textTheme.bodyText2!
    //       .copyWith(fontWeight: FontWeight.w100, fontSize: 12),
    //   dropdownBackgroundColor: context.colors.background,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10.h),
    //       shape: BoxShape.rectangle,
    //       border: Border.all(
    //         width: 1,
    //         color: Colors.black45,
    //       )),
    //   prefixIcon: Container(
    //     width: 20.w,
    //     height: 10.h,
    //     alignment: Alignment.topLeft,
    //     child: Icon(
    //       Icons.how_to_reg_outlined,
    //       size: 16,
    //       semanticLabel: "Bulgu tipini seçiniz",
    //     ),
    //   ),
    //   dropDownMenuItems: widget.items.map((item) {
    //     return item?['name'] ?? "-";
    //   }).toList(),
    //   onChanged: (value) {
    //     widget.tour.fieldId = value?['id'] ?? 0;
    //   },
    // );
  }
}
