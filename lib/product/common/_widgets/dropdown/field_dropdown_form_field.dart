import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../view/safety_tour_app/model/abstract/ITourViewModel.dart';
import '../../../../view/safety_tour_app/model/field_dd_model.dart';
import '../../../../view/safety_tour_app/model/tour_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FieldDropdownField<T extends IEditUnplannedTourViewModel>
    extends StatelessWidget {
  const FieldDropdownField({
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
          labelText: 'Saha',
          labelStyle: context.textTheme.headline6!.copyWith(fontSize: 14.sp),
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
          return null;
        },
        isDense: true,
        hint: const Text('Saha Seçiniz'),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        value: tour.fieldId,
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),
        iconSize: 24,
        onChanged: (int? newValue) {
          tour.fieldId = newValue!;
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        items:
            viewModel.fields.map<DropdownMenuItem<int>>((FieldDDModel value) {
          return DropdownMenuItem<int>(
            value: value.id,
            child: Text(value.fieldName!),
          );
        }).toList(),
      );

      // DropdownButtonFormField<int>(
      //   validator: (val) {
      //     if (val == null) {
      //       return "Bu alan boş bırakılamaz";
      //     }
      //   },
      //   hint: Text('Saha Seçiniz.'),
      //   autovalidateMode: AutovalidateMode.onUserInteraction,
      //   value: tour.fieldId,
      //   icon: const Icon(
      //     Icons.arrow_drop_down_outlined,
      //   ),
      //   iconSize: 24,
      //   elevation: 20,
      //   onChanged: (int? newValue) {
      //     FocusScope.of(context).requestFocus(new FocusNode());
      //     tour.fieldId = newValue!;
      //   },
      //   onSaved: (int? newValue) {
      //     FocusScopeNode currentFocus = FocusScope.of(context);
      //     if (!currentFocus.hasPrimaryFocus) {
      //       currentFocus.unfocus();
      //     }
      //     tour.fieldId = newValue!;
      //   },
      //   items:
      //       viewModel.fields.map<DropdownMenuItem<int>>((FieldDDModel value) {
      //     return DropdownMenuItem<int>(
      //       value: value.id,
      //       child: Text(value.fieldName!),
      //     );
      //   }).toList(),
      // );
    });
  }
}
