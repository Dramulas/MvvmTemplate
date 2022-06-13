import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/base/view/base_view.dart';
import '../../../../../../core/extensions/context_extension.dart';
import '../../../../../../product/common/_product/_widgets/big_little_text_widget.dart';
import '../../../../../../product/common/_widgets/datepicker/tour_datepicker.dart';
import '../../../../../../product/common/_widgets/text_field/tour_accompanies_text_field.dart';
import '../../../../model/field_dd_model.dart';
import '../../../../model/tour_model.dart';
import '../../../components/field_dropdown_form_field.dart';
import '../../../components/location_dropdown_form_field.dart';
import '../components/add_unplanned_tour_tour_team_members_dropdown.dart';
import '../viewmodel/add_unplanned_tour_view_model.dart';

class AddUnPlannedTourView extends StatefulWidget {
  const AddUnPlannedTourView({Key? key}) : super(key: key);

  @override
  _AddUnPlannedTourViewState createState() => _AddUnPlannedTourViewState();
}

class _AddUnPlannedTourViewState extends State<AddUnPlannedTourView> {
  final _controllerPositiveFindings = TextEditingController();
  final _controllerTourAccompaniers = TextEditingController();
  late TextEditingController _datePickerController;
  int _currentOrgScoreValue = 0;
  late TourModel tour;

  @override
  void initState() {
    super.initState();
    tour = TourModel();
    _datePickerController = TextEditingController();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (this.mounted) {
      return BaseView<AddUnPlannedTourViewModel>(
          viewModel: AddUnPlannedTourViewModel(),
          onModelReady: (AddUnPlannedTourViewModel model) async {
            model.setContext(context);
            model.init();
          },
          onPageBuilder: (BuildContext context,
                  AddUnPlannedTourViewModel viewModel) =>
              Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: Text(
                    "Plansız Tur Ekle",
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
                                      LocationDropdownFormField(
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
                                                return FieldDropdownFormField(
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
                                                    "Lütfen önce bir lokasyon seçiniz"),
                                              );
                                            });
                                      }),
                                      SizedBox(height: context.highFreeSpace),
                                      AddUnplannedTourTourTeamMembersDropdown(
                                        tour: tour,
                                        viewModel: viewModel,
                                      ),
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
                                                  tour.isPlanned = false;
                                                  await viewModel
                                                      .addUnPlannedTour(
                                                          tour, context);
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
        labelText: "Gözlenen Pozitif Bulgular",
        floatingLabelBehavior: FloatingLabelBehavior.always,
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
      style: context.textTheme.headline6!.copyWith(fontSize: 12.sp),
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
    );
  }
}
