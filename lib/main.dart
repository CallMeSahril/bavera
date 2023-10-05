import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://dqkrpdkhevvfmcshtpdk.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRxa3JwZGtoZXZ2Zm1jc2h0cGRrIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTY0MDY1NjQsImV4cCI6MjAxMTk4MjU2NH0.j8Oee57wQvdm-WaXpBLqTUszXtMXeCfCp3HI8RGir0I',
  );
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
