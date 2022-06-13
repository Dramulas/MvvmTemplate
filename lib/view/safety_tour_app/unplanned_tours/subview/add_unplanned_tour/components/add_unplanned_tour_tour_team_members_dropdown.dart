import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../core/init/theme/light/color_scheme_light.dart';
import '../../../../model/tour_model.dart';
import '../viewmodel/add_unplanned_tour_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';

class AddUnplannedTourTourTeamMembersDropdown extends StatelessWidget {
  const AddUnplannedTourTourTeamMembersDropdown({
    Key? key,
    required this.tour,
    required this.viewModel,
  }) : super(key: key);

  final TourModel tour;
  final AddUnPlannedTourViewModel viewModel;

  @override
  Widget build(BuildContext context) {
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
        dataSource: viewModel.users!
            .map((e) => {"id": e.id, "fullName": e.fullName})
            .toList(),
        textField: 'fullName',
        valueField: 'id',
        filterable: true,
        onSaved: (value) {
          print(value);
          if (value != null) {
            tour.tourTeamMembersIds = [...value];
            print(tour.tourTeamMembersIds);
          }
        },
        change: (value) {
          if (value != null) {
            tour.tourTeamMembersIds = [...value];
          }
        });
  }
}
