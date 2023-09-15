// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import '../../../../../core/utils/app_routers.dart';
// import '../../../../search/presentation/controller/search_cubit.dart';
// import '../../../../search/presentation/views/screens/search_screen.dart';
// import '../../../../search/presentation/views/widgets/custom_field.dart';
//
// class HomeAppBar extends StatelessWidget {
//   HomeAppBar({Key? key}) : super(key: key);
//   final controller = TextEditingController();
//
//   _submit(BuildContext context) {
//     FocusScope.of(context).unfocus();
//     if (_key.currentState!.validate()) {
//
//
//       SearchCubit.getObject(context).search(
//         textSearch: controller.text,
//       );
//     } else {
//       return;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.sizeOf(context);
//
//     return Padding(
//       padding: EdgeInsets.only(top: 15.h, left: 5, bottom: 80),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Image.asset(
//               //   AppConstants.kLogo,
//               //   width: deviceSize.width * 0.25,
//               //   height: deviceSize.height * 0.1,
//               // ),
//
//               Container(
//                 transform: Matrix4.rotationZ(pi / 180 * -9),
//                 decoration: BoxDecoration(
//                   color: const Color(0xff023047),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
//                 child: Text(
//                   'BoOKly',
//                   style: GoogleFonts.raleway(
//                       fontSize: 30,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w900,
//                       letterSpacing: 2),
//                 ),
//               ),
//               IconButton(
//                 onPressed: () =>
//                     AppRouters.go(context: context, route: SearchScreen.route),
//                 icon: Icon(
//                   FontAwesomeIcons.magnifyingGlass,
//                   size: 22.sp,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Builder(builder: (context) {
//             return InkWell(
//                  onTap: () {
//
//                  //  showSearch(context: context, delegate: SearchScreen());
//                   AppRouters.go(context: context, route: SearchScreen.route);
//                  },
//               child: CustomField(
//                 controller: controller,
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Please Enter a search value.';
//                   } else {
//                     return null;
//                   }
//                 },
//                 onFieldSubmitted: (_) => _submit(context),
//                 iconOnPressed: () => _submit(context),
//               ),
//             );
//           }),
//         ],
//       ),
//     );
//   }
// }
