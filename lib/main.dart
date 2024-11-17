import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gatherlens/app/views/camera_view.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  await Supabase.initialize(
    url: 'https://icdlnuxcbciwaxjvjxqa.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImljZGxudXhjYmNpd2F4anZqeHFhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzE1OTg4MzEsImV4cCI6MjA0NzE3NDgzMX0.yv__4y1PKwuryAt7YFifEv7bQnvSk92DScEQhzfkUhk',
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    handlePermissions();
  }

  void handlePermissions() async {
    if (!kIsWeb) {
      var status = await Permission.storage.status;

      if (!status.isGranted) {
        await Permission.storage.request();
      }

      var camreraStatus = await Permission.camera.status;
      if (!camreraStatus.isGranted) {
        await Permission.camera.request();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CameraView(),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
