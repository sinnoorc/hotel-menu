// import 'package:flutter/material.dart';
// import 'package:hotel_menu/model/home_menu.dart';

// class HomeMenu extends StatelessWidget {
//   const HomeMenu({
//     Key? key,
//     required this.home,
//   }) : super(key: key);

//   final HomeMenuCard home;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//                 padding: EdgeInsets.all(12),
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                   color: home.color.withOpacity(0.1),
//                   borderRadius: const BorderRadius.all(Radius.circular(10)),
//                 ),
//                 child: Center(
//                   child: Icon(
//                     home.icon,
//                     color: home.color,
//                     size: 16,
//                   ),
//                 ),
//               ),
//               const Icon(
//                 Icons.more_vert,
//                 color: Colors.black,
//               )
//             ],
//           ),
//           Text(
//             home.title,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           ProgressLine(
//             color: home.color,
//             percentage: home.percentage,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "${home.subtitle} Order",
//                 style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),
//               ),
//               Text(
//                 home.percentage.toStringAsFixed(2) + "%",
//                 style: Theme.of(context).textTheme.caption!.copyWith(color: Colors.black),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class ProgressLine extends StatelessWidget {
//   const ProgressLine({
//     Key? key,
//     this.color = Colors.red,
//     required this.percentage,
//   }) : super(key: key);

//   final Color? color;
//   final int? percentage;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Container(
//           width: double.infinity,
//           height: 5,
//           decoration: BoxDecoration(
//             color: color!.withOpacity(0.1),
//             borderRadius: const BorderRadius.all(Radius.circular(10)),
//           ),
//         ),
//         LayoutBuilder(
//           builder: (context, constraints) => Container(
//             width: constraints.maxWidth * (percentage! / 100),
//             height: 5,
//             decoration: BoxDecoration(
//               color: color,
//               borderRadius: const BorderRadius.all(Radius.circular(10)),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
