import 'dart:convert';

import '../model/abstract/ITourViewModel.dart';
import '../model/finding_model.dart';
import 'package:flutter/material.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindingCategoriesMultiSelectDropdown<T extends ICategoryModel>
    extends StatefulWidget {
  const FindingCategoriesMultiSelectDropdown({
    Key? key,
    required this.finding,
    required this.viewModel,
  }) : super(key: key);

  final FindingModel finding;
  final T viewModel;

  @override
  State<FindingCategoriesMultiSelectDropdown> createState() =>
      _FindingCategoriesMultiSelectDropdownState();
}

class _FindingCategoriesMultiSelectDropdownState
    extends State<FindingCategoriesMultiSelectDropdown> {
  List selectedList = [];
  var selected;

  @override
  Widget build(BuildContext context) {
    return CustomSearchableDropDown(
      showClearButton: false,
      menuMode: true,
      items: widget.viewModel.jsonCategories,
      label: 'Kategori seçiniz',
      multiSelect: true,
      multiSelectTag: 'Kategoriler',
      multiSelectValuesAsWidget: true,
      menuHeight: 80.h,
      menuPadding: EdgeInsets.all(8.0),
      hideSearch: true,
      showLabelInMenu: false,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black54,
      )),
      dropDownMenuItems: widget.viewModel.jsonCategories.map((item) {
        return item['name'];
      }).toList(),
      onChanged: (value) {
        widget.finding.categoryIds =
            json.decode(value).map((e) => e['id']).cast<int>().toList();
      },
    );
  }
}
