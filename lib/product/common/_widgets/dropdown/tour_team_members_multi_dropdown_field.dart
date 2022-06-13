import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/theme/light/color_scheme_light.dart';
import '../../../../view/safety_tour_app/model/abstract/ITourViewModel.dart';
import '../../../../view/safety_tour_app/model/tour_model.dart';

class TourTeamMembersMultiDropdownField<T extends IEditUnplannedTourViewModel>
    extends StatelessWidget {
  const TourTeamMembersMultiDropdownField({
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
      return MultiSelect(
          buttonBarColor: Colors.red,
          cancelButtonText: "Geri",
          titleText: "Tur Ekip Üyeleri",
          titleTextColor: ColorSchemeLight.instance!.appBarTitleColor,
          checkBoxColor: Colors.black,
          selectedOptionsInfoText: "Seçilen Ekip Üyeleri (silmek için dokunun)",
          selectedOptionsBoxColor: Colors.green,
          searchBoxColor: context.colors.surface,
          maxLength: viewModel.users!.length,
          validator: (dynamic value) {
            if (value == null) {
              return 'Lütfen en az bir tur ekip üyesi seçiniz.';
            }
            return null;
          },
          selectIconColor: Colors.black54,
          maxLengthText: "",
          inputBoxFillColor: context.colors.surface,
          searchBoxHintText: "Ara",
          autovalidateMode: AutovalidateMode.onUserInteraction,
          maxLengthIndicatorColor: context.colors.primary,
          clearButtonText: "Temizle",
          saveButtonText: "Kaydet",
          errorText: 'Lütfen en az bir tur ekip üyesi seçiniz',
          initialValue: tour.tourTeamMemberUsers!.map((e) => e.id).toList(),
          dataSource: viewModel.users!
              .map((e) => {"id": e.id, "fullName": e.fullName})
              .toList(),
          textField: 'fullName',
          valueField: 'id',
          filterable: true,
          onSaved: (value) {
            if (value != null) {
              tour.tourTeamMembersIds = [...value];
              // print(tour.tourTeamMembersIds);
            }
          },
          change: (value) {
            if (value != null) {
              tour.tourTeamMembersIds = [...value];
            }
          });
    });
  }
}
