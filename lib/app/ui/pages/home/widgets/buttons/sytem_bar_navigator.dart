// import 'package:app_transport/app/home_page.dart';
// import 'package:app_transport/app/ui/pages/home/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_meedu/state.dart';

// class HomePage extends ConsumerWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, ref) {
//     final controller = ref.watch(homeProvider);
//     final state = controller.state;
//     final hide = controller.originAndDestinationReady ||
//         state.fetching ||
//         state.pickFromMap != null;

//     if (hide) {
//       return Container();
//     }
//     return const SystemBar();
//   }
// }
