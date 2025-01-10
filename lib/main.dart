import 'package:eviq/app/services/colors.dart';

import 'app/modules/home/bindings/home_binding.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/services/storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initGetServices();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  return runApp(GestureDetector(
    onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
    child: GetMaterialApp(
      // theme: AppTheme.light,
      // darkTheme: AppTheme.dark,
      theme: ThemeData(
        cardTheme: CardTheme(color: ColorUtil.kcPrimaryWhite),
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: ColorUtil.kcPrimaryWhite,
        ),
        scaffoldBackgroundColor: ColorUtil.kcPrimaryWhite,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        cardColor: ColorUtil.kcPrimaryBlack,
        appBarTheme: AppBarTheme(
            backgroundColor: ColorUtil.kcPrimaryBlack,
            foregroundColor: ColorUtil.kcPrimaryWhite),
        scaffoldBackgroundColor: ColorUtil.kcPrimaryBlack,
      ),
      themeMode: ThemeMode.light,
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en', 'US'),
      // translationsKeys: AppTranslation.translations,
      initialRoute: AppPages.INITIAL,
      initialBinding: HomeBinding(),
      getPages: AppPages.routes,
    ),
  ));
}

Future<void> initGetServices() async {
  await Get.putAsync<GetStorageService>(() => GetStorageService().initState());
}
