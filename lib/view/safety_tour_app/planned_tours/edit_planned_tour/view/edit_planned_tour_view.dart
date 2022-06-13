import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/base/view/base_view.dart';
import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../product/common/_product/_widgets/big_little_text_widget.dart';
import '../../../../../../product/common/_widgets/datepicker/tour_datepicker.dart';
import '../../../../../../product/common/_widgets/dropdown/tour_team_members_multi_dropdown_field.dart';
import '../../../../../../product/common/_widgets/text_field/tour_accompanies_text_field.dart';
import '../../../model/field_dd_model.dart';
import '../../../model/tour_model.dart';
import '../../../unplanned_tours/subview/edit_unplanned_tour/model/tour_dto.dart';
import '../components/edit_field_dropdown_form_field.dart';
import '../components/edit_location_dropdown_form_field.dart';
import '../viewmodel/edit_planned_tour_view_model.dart';

class EditPlannedTourView extends StatefulWidget {
  const EditPlannedTourView({Key? key}) : super(key: key);

  @override
  _EditPlannedTourViewState createState() => _EditPlannedTourViewState();
}

class _EditPlannedTourViewState extends State<EditPlannedTourView> {
  var _controllerPositiveFindings = TextEditingController();
  var _controllerTourAccompaniers = TextEditingController();
  late TextEditingController _datePickerController;
  int _currentOrgScoreValue = 0;
  TourDto tourDto = TourDto();

  @override
  void initState() {
    super.initState();
    _datePickerController =
        TextEditingController(text: DateTime.now().toString());
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TourModel tour = ModalRoute.of(context)!.settings.arguments as TourModel;
    _controllerPositiveFindings.text =
        tour.observatedSecureCasesPositiveFindings ?? '';
    _controllerTourAccompaniers.text = tour.tourAccompaniers ?? '';

    if (this.mounted) {
      return BaseView<EditPlannedTourViewModel>(
          viewModel: EditPlannedTourViewModel(),
          onModelReady: (EditPlannedTourViewModel model) async {
            model.setContext(context);
            model.init();
          },
          onPageBuilder: (BuildContext context,
                  EditPlannedTourViewModel viewModel) =>
              Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: Text(
                    "Planlı Tur Güncelle",
                    style: context.textTheme.headline6,
                  ),
                ),
                body: Observer(builder: (_) {
                  return viewModel.userList.isEmpty ||
                          viewModel.fields.isEmpty ||
                          viewModel.locations.isEmpty ||
                          viewModel.isClicked
                      ? Center(child: CircularProgressIndicator())
                      : Card(
                          elevation: 5,
                          color: context.colors.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          margin: context.paddingNormalAll,
                          child: Padding(
                            padding: context.paddingLowAll,
                            child: Form(
                              key: _formKey,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.all(24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      EditLocationDropdownFormField<
                                              EditPlannedTourViewModel>(
                                          context: context,
                                          viewModel: viewModel,
                                          tour: tour),
                                      SizedBox(height: context.highFreeSpace),
                                      Observer(builder: (_) {
                                        return FutureBuilder<
                                                List<FieldDDModel?>?>(
                                            future: viewModel
                                                .getFieldsBasedOnSelectedLocation(
                                                    viewModel
                                                            .selectedLocationId ??
                                                        tour.locationId),
                                            builder: (context, snapshot) {
                                              print(snapshot.data);
                                              if (snapshot.data != null &&
                                                  snapshot.data!.isNotEmpty) {
                                                return EditFieldDropdownFormField(
                                                  tourDto: tourDto,
                                                  tour: tour,
                                                  context: context,
                                                  viewModel: viewModel,
                                                  items: snapshot.data ??
                                                      [
                                                        FieldDDModel(
                                                            id: 0,
                                                            fieldName:
                                                                "Bu lokasyon altında saha yok")
                                                      ],
                                                );
                                              }
                                              return Center(
                                                child: Text(
                                                    "Bu lokasyon altında saha yok"),
                                              );
                                            });
                                      }),
                                      SizedBox(height: context.highFreeSpace),
                                      TourTeamMembersMultiDropdownField<
                                              EditPlannedTourViewModel>(
                                          context: context,
                                          viewModel: viewModel,
                                          tour: tour),
                                      SizedBox(height: context.highFreeSpace),
                                      TourAccompaniesTextField(
                                          controllerTourAccompaniers:
                                              _controllerTourAccompaniers,
                                          tour: tour),
                                      SizedBox(height: context.highFreeSpace),
                                      TourDatePicker(
                                          datePickerController:
                                              _datePickerController,
                                          tour: tour),
                                      SizedBox(height: context.highFreeSpace),
                                      buildLittleTextWidget(
                                          "Saha Tertip Skoru"),
                                      buildFieldOrganizationScoreField(tour),
                                      SizedBox(height: context.highFreeSpace),
                                      buildPositiveFindingTextFormField(tour),
                                      SizedBox(height: context.normalFreeSpace),
                                      FloatingActionButton.extended(
                                        label: Text("Kaydet"),
                                        onPressed: !viewModel.isClicked
                                            ? () async {
                                                viewModel.changeIsClicked();
                                                final isValid = _formKey
                                                    .currentState!
                                                    .validate();
                                                if (isValid) {
                                                  _formKey.currentState!.save();
                                                  tour.isPlanned = true;

                                                  await viewModel
                                                      .updatePlannedTour(tour);
                                                } else {
                                                  final snackBar = SnackBar(
                                                    content: Text(
                                                        "Lütfen gerekli alanları doldurunuz."),
                                                    backgroundColor: Colors.red,
                                                  );
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(snackBar);
                                                }
                                                viewModel.changeIsClicked();
                                              }
                                            : null,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                }),
              ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  TextFormField buildPositiveFindingTextFormField(TourModel tour) {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: "Gözlenen Pozitif Bulgular",
        labelStyle: context.textTheme.headline6!.copyWith(fontSize: 14.sp),
      ),
      focusNode: FocusNode(canRequestFocus: false),
      controller: _controllerPositiveFindings,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      onSaved: (val) {
        tour.observatedSecureCasesPositiveFindings =
            _controllerPositiveFindings.text;
      },
      onChanged: (val) {
        tour.observatedSecureCasesPositiveFindings =
            _controllerPositiveFindings.text;
      },
      style: context.textTheme.bodyText2!.copyWith(fontSize: 12.sp),
    );
  }

  Center buildFieldOrganizationScoreField(TourModel tour) {
    if (tour.fieldOrganizationOrderScore == null)
      tour.fieldOrganizationOrderScore = 0;
    return Center(
      child: Slider(
        divisions: 10,
        label: "${tour.fieldOrganizationOrderScore}",
        activeColor: context.colors.onSurface,
        min: 0,
        max: 10,
        value: tour.fieldOrganizationOrderScore?.toDouble() ?? 0,
        onChanged: (double value) {
          setState(() {
            _currentOrgScoreValue = value.toInt();
          });
          tour.fieldOrganizationOrderScore = _currentOrgScoreValue;
        },
      ),

      // NumberPicker(
      //     value: tour.fieldOrganizationOrderScore!,
      //     axis: Axis.horizontal,
      //     itemWidth: 50,
      //     textStyle: TextStyle(fontSize: 12),
      //     selectedTextStyle: TextStyle(
      //         fontSize: 24,
      //         color: context.colors.onSurface,
      //         fontWeight: FontWeight.w500),
      //     itemHeight: 40,
      //     minValue: 0,
      //     maxValue: 10,
      //     step: 1,
      //     haptics: true,
      //     onChanged: (value) {
      //       setState(() {
      //         _currentOrgScoreValue = value;
      //       });
      //       tour.fieldOrganizationOrderScore = _currentOrgScoreValue;
      //     }),
    );
  }
}
