// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class FindingChip extends StatefulWidget {
//   final String title;
//   final VoidCallback onPressed;
//   // final PlannedTourDetailViewModel viewModel;
//   // final int index;
//   // final String tourKey;
//   FindingChip(this.title, {Key? key, required this.onPressed})
//       : super(key: key);

//   @override
//   _FindingChipState createState() => _FindingChipState();
// }

// class _FindingChipState extends State<FindingChip> {
//   bool active = false;
//   // List<FindingModel> list = [];

//   @override
//   void initState() {
//     super.initState();
//     // widget.viewModel.findingList = widget.viewModel.getFindings(widget.tourKey);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(5),
//       child: FlatButton(
//           color: active ? Colors.black12 : Colors.white,
//           //if active == true then background color is black
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.0),
//               side: const BorderSide(color: Colors.black12, width: 2)
//               //set border radius, color and width
//               ),
//           onPressed: () {
//             // widget.viewModel.selectedFinding =
//             //     widget.viewModel.findingList[widget.index];

//             // setState(() {
//             //   if (!active) {
//             //     active = widget.index ==
//             //         widget.viewModel.findingList
//             //             .indexOf(widget.viewModel.selectedFinding);
//             //     widget.viewModel.changeVisibilityTrue();
//             //   } else {
//             //     active = false;
//             //     widget.viewModel.changeVisibilityFalse();
//             //   }
//             // });
//           }, //set function
//           child: Text(widget.title) //set title
//           ),
//     );
//   }
// }
