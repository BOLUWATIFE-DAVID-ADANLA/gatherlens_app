// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:gatherlens/main.dart';

// class CameraView extends StatefulWidget {
//   const CameraView({super.key});

//   @override
//   State<CameraView> createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView> {
//   late CameraController _cameraController;
//   bool isRearCameraSelected = true;

//   // This sets up the camera based on the selected camera (front or rear)
//   Future<void> setupCamera(CameraDescription cameraDescription) async {
//     _cameraController = CameraController(
//       cameraDescription,
//       ResolutionPreset.max,
//     );
//     try {
//       await _cameraController.initialize();
//       setState(() {}); // Update UI after the camera is initialized
//     } catch (e) {
//       if (e is CameraException) {
//         switch (e.code) {
//           case 'CameraAccessDenied':
//             // Handle access errors here.
//             break;
//           default:
//             // Handle other errors here.
//             break;
//         }
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     setupCamera(cameras[0]); // Start with the rear camera'
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             child: AspectRatio(
//               aspectRatio: 0.6,
//               child: FittedBox(
//                 fit: BoxFit.cover,
//                 child: SizedBox(
//                   width: _cameraController.value.previewSize?.height,
//                   height: _cameraController.value.previewSize?.width,
//                   child: Transform(
//                     alignment: Alignment.center,
//                     transform: isRearCameraSelected
//                         ? Matrix4.identity()
//                         : Matrix4.rotationY(3.14159), // Flip for front c
//                     child: CameraPreview(_cameraController),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               setState(() {
//                 isRearCameraSelected = !isRearCameraSelected;
//               });
//               setupCamera(cameras[isRearCameraSelected ? 0 : 1]);
//             },
//             child: const Text('Switch Camera'),
//           ),
//         ],
//       ),
//     );
//   }
// }
