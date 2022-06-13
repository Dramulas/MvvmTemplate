import 'package:flutter/material.dart';

import '../../../../model/abstract/ITourViewModel.dart';
import '../../../../model/finding_model.dart';
import '../../../../model/tour_model.dart';
import '../../../../planned_tours/planned_tour_detail/view/subview/planned_tour_finding_detail.dart';
import '../model/finding_entry_model.dart';
import '../subview/unplanned_tour_finding_detail/unplanned_tour_finding_detail_view.dart';

class SaveTourFindingFabButton<T extends IFabButton> extends StatefulWidget {
  SaveTourFindingFabButton({
    Key? key,
    required GlobalKey<FormState> formKey,
    required this.tour,
    required this.finding,
    required this.viewModel,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final TourModel tour;
  final FindingModel finding;
  final T viewModel;

  @override
  _SaveTourFindingFabButtonState<T> createState() =>
      _SaveTourFindingFabButtonState<T>();
}

class _SaveTourFindingFabButtonState<T extends IFabButton>
    extends State<SaveTourFindingFabButton<T>> {
  bool isClicked = false;

  void changeIsClicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text("Kaydet"),
      onPressed: !isClicked
          ? () async {
              if (this.mounted) {
                changeIsClicked();
                final isValid = widget._formKey.currentState!.validate();
                if (isValid &&
                    widget.finding.findingType != null &&
                    widget.finding.categoryIds != null) {
                  widget.tour.findings!.add(widget.finding);
                  FindingEntryModel findingEntry = FindingEntryModel();
                  findingEntry.actionsShouldBeTaken =
                      widget.finding.actionsShouldBeTaken;
                  findingEntry.actionsTakenRightInTheField =
                      widget.finding.actionsTakenRightInTheField;
                  findingEntry.findingType = widget.finding.findingType;
                  findingEntry.observations = widget.finding.observations;
                  findingEntry.categoryIds = widget.finding.categoryIds;

                  print(findingEntry.toJson());

                  widget._formKey.currentState!.save();

                  final refreshedFinding = await widget.viewModel
                      .createFindingFourTour(findingEntry, widget.tour.id!);

                  if (refreshedFinding != null) {
                    final snackBar = SnackBar(
                      content: Text(
                          "Bulgu başarıyla oluşturuldu. Dosyalarınızı ekleyebilirsiniz."),
                      backgroundColor: Colors.green,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          settings: RouteSettings(arguments: refreshedFinding),
                          builder: (_) => widget.tour.isPlanned == true
                              ? PlannedTourFindingDetailView()
                              : UnplannedTourFindingDetailView()),
                    );
                  } else {
                    final snackBar = SnackBar(
                      content: Text("Hata!!!"),
                      backgroundColor: Colors.red,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else {
                  final SnackBar snackBar = SnackBar(
                    content: Text("Lütfen zorunlu alanları doldurunuz."),
                    backgroundColor: Colors.red,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                changeIsClicked();
              }
            }
          : null,
    );
  }
}
