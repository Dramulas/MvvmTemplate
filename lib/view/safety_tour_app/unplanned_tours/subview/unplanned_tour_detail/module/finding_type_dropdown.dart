import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import '../../../../model/abstract/ITourViewModel.dart';
import '../../../../model/finding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindingTypeDropdown<T extends ICategoryModel> extends StatelessWidget {
  const FindingTypeDropdown({
    Key? key,
    required this.finding,
    required this.viewModel,
  }) : super(key: key);

  final FindingModel finding;
  final T viewModel;

  @override
  Widget build(BuildContext context) => CustomSearchableDropDown(
        showClearButton: false,
        items: viewModel.jsonCategories,
        label: 'Bulgu tipi seçiniz',
        dropdownHintText: "Bulgu tipi Seçiniz",
        hint: "Bulgu tipi Seçiniz",
        showLabelInMenu: true,
        menuHeight: 80.h,
        menuPadding: EdgeInsets.all(8.0),
        menuMode: true,
        hideSearch: true,
        multiSelectValuesAsWidget: true,
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.black54,
        )),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            width: 20.w,
            height: 10.h,
            alignment: Alignment.topLeft,
            child: Icon(
              Icons.admin_panel_settings_outlined,
              size: 16,
              semanticLabel: "Bulgu tipini seçiniz",
            ),
          ),
        ),
        dropDownMenuItems: viewModel.jsonCategories.map((item) {
          return item['findingTypeStr'];
        }).toList(),
        onChanged: (value) {
          print(value);
          finding.findingType = value['findingType'];
          print(finding.findingType);
        },
      );
}
