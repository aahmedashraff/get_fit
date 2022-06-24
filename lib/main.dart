// @dart=2.9
import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/bloc/bloc.dart';
import 'package:CaptainSayedApp/providers/program_progress.dart';
import 'package:CaptainSayedApp/providers/user_data.dart';
import 'package:CaptainSayedApp/repos/progress_fun.dart';
import 'package:CaptainSayedApp/screens/aftersplash.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/congratulation_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/excercise_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/gender_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/goals_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/height_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/level_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/upload_image_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/weight_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/day_exercises_screen.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/details_for_exercise_in_program.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/program_rest_between_round.dart';
import 'package:CaptainSayedApp/screens/day_exercises_screen/program_timer_screen.dart';
import 'package:CaptainSayedApp/screens/downloads_screen.dart';
import 'package:CaptainSayedApp/screens/exercise_details_screen/exercise_details_screen22.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/exercise_screen.dart';
import 'package:CaptainSayedApp/screens/finesh_workout_screen.dart';
import 'package:CaptainSayedApp/screens/home_Screen/screen_widgets/bottom_navigation_bar.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/articles.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/beaf.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/body_build_new.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/calisth.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/full_body.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/func_train.dart';
import 'package:CaptainSayedApp/screens/home_screen2/widgets/lose_weight.dart';
import 'package:CaptainSayedApp/screens/message_screen/message.dart';
import 'package:CaptainSayedApp/screens/message_screen/screen_widgets/new_messege.dart';
import 'package:CaptainSayedApp/screens/message_screen/screen_widgets/notification_screen.dart';
import 'package:CaptainSayedApp/screens/premium_acc_screen/premium_acc_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/profile_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/home_img.dart';
import 'package:CaptainSayedApp/screens/program_screen/program_Screen.dart';
import 'package:CaptainSayedApp/screens/reset_password.dart';
import 'package:CaptainSayedApp/screens/rest_between_round_screen/rest_between_round_screen.dart';
import 'package:CaptainSayedApp/screens/settings_screen/settings_screen.dart';
import 'package:CaptainSayedApp/screens/sign_up_screen.dart';
import 'package:CaptainSayedApp/screens/splash_screens/new_splash.dart';
import 'package:CaptainSayedApp/screens/timer_screen/timer_screen.dart';
import 'package:CaptainSayedApp/services/auth.dart';
import 'package:CaptainSayedApp/sizeConfig.dart';
import 'package:CaptainSayedApp/theme/theme_constant.dart';
import 'package:CaptainSayedApp/theme/theme_manager.dart';
import 'package:CaptainSayedApp/widgets/layout_of_all_first_screens.dart';
import 'package:animated_button/animated_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

import 'dimensions.dart';
import 'firebase_options.dart';
import 'login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

ThemeManager themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void dispose() {
  //   themeManager.removeListener(themeListener);
  //   super.dispose();
  // }
  //
  // @override
  // void initState() {
  //   themeManager.addListener(themeListener);
  //   super.initState();
  // }
  //
  // themeListener() {
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }

  final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static const initializationSettingsAndroid =
      AndroidInitializationSettings('ic_stat_get_fit');
  static const initializationSettingsIOS = IOSInitializationSettings(
    requestSoundPermission: false,
    requestBadgePermission: false,
    requestAlertPermission: false,
    // onDidReceiveLocalNotification: (_,__,___,____){},
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
    // macOS: initializationSettingsMacOS,
  );

  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'repeating channel id',
    'repeating channel name',
    // 'repeating description',
    color: Color(0xFFEE6F57),
    channelShowBadge: true,
    playSound: true,
    priority: Priority.max,
    importance: Importance.max,
    // sound: RawResourceAndroidNotificationSound()
  );
  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  var _isFirstTimeToCheckAuthState = true;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (_) {
          Navigator.pushNamed(context, "/");
          return;
        },
      );
      await flutterLocalNotificationsPlugin.periodicallyShow(
        1,
        'Get Fit',
        'Come and Practice',
        RepeatInterval.weekly,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProvider<UserData>(create: (_) => UserData()),
        ChangeNotifierProvider<AppData>(
          create: (_) => AppData(),
        ),
        ChangeNotifierProvider(
          create: (_) => Prog(),
        ),
        ChangeNotifierProvider<ProgramProgress>(
          create: (_) => ProgramProgress(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => ThemeManager(),
        child: Consumer<ThemeManager>(
            builder: (context, ThemeManager notifier, child) {
          return MaterialApp(
            title: 'Get Fit',
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme
                ? ThemeClass.darkTheme
                : ThemeClass.lightTheme,
            darkTheme: ThemeClass.darkTheme,
            themeMode: themeManager.themeMode,
            // ThemeData(
            //   unselectedWidgetColor: Colors.white,
            //   sliderTheme: SliderThemeData(
            //     thumbColor: Color(0xFFEE6F57),
            //     activeTrackColor: Color(0xFFEE6F57),
            //     inactiveTrackColor: Color(0xFFEE6F57).withOpacity(.3),
            //   ),
            //   textTheme: TextTheme(
            //     headline2: TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w700,
            //     ),
            //   ),
            //   primaryColor: Color(0xFFEE6F57),
            //   accentColor: Color(0xFFEE6F57),
            //   fontFamily: "Segoe UI",
            // )

            home: Consumer<Auth>(builder: (context, auth, __) {
              SizeConfig().init(context);
              Dimensions().init(context);
              final userData = Provider.of<UserData>(context, listen: false);
              return FutureBuilder(
                  future: userData.prepareAllUserDataAtAppLaunch(),
                  builder: (_, snap) {
                    if (snap.connectionState == ConnectionState.waiting) {
                      return NewSplash(isJustWatingForStreamBuilder: true);
                    } else if (userData.userToken != null &&
                        userData.userToken.isNotEmpty) {
                      if (_isFirstTimeToCheckAuthState) {
                        _isFirstTimeToCheckAuthState = false;

                        return MySplash(isLogedIn: true);
                      } else {
                        print("userLoggedIn");
                        print(userData.userToken);
                        return HomeScreen();
                      }
                    } else if (_isFirstTimeToCheckAuthState) {
                      _isFirstTimeToCheckAuthState = false;
                      //  print("fdf111111111111111111111111111dkj");
                      return MySplash(isLogedIn: false);
                    } else {
                      //  print("fdf222222222222222222222222222222dkj");
                      return AfterSplash();
                    }
                  });
            }),
            routes: {
              GenderScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(GenderScreen()),
              LevelScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(LevelScreen()),
              OldScreen.screenName: (_) => LayoutOfAllFirstScreens(OldScreen()),
              WeightScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(WeightScreen()),
              HeightScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(HeightScreen()),
              CongratulationScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(CongratulationScreen()),

              ExercisePlaceScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(ExercisePlaceScreen()),
              UploadImageScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(UploadImageScreen()),
              GoalsScreen.screenName: (_) =>
                  LayoutOfAllFirstScreens(GoalsScreen()),
              LoginScreen.screenName: (_) => Provider(
                    create: (_) => Bloc(),
                    child: LayoutOfAllFirstScreens(LoginScreen()),
                  ),
              ResetPasswordScreen.screenName: (_) => Provider(
                    create: (_) => Bloc(),
                    child: LayoutOfAllFirstScreens(ResetPasswordScreen()),
                  ),
              SignUpScreen.screenName: (_) => Provider(
                    create: (_) => Bloc(),
                    child: LayoutOfAllFirstScreens(SignUpScreen()),
                  ),
              //HomeScreen.screenName: (_) => HomeScreen(),
              ExerciseScreen.screenName: (_) => ExerciseScreen(),
              TimerScreen.screenName: (_) => TimerScreen(),
              DownloadsScreen.screenName: (_) => DownloadsScreen(),
              ExerciseDetailsScreen.screenName: (_) => ExerciseDetailsScreen(),
              ProfileScreen.screenName: (_) => ProfileScreen(),
              SettingScreen.screenName: (_) => SettingScreen(),
              ProgramScreen.screenName: (_) => ProgramScreen(),
              RestBetweenRoundsScreen.screenName: (_) =>
                  RestBetweenRoundsScreen(),
              FineshWorkoutScreen.screenName: (_) => FineshWorkoutScreen(),
              DayExercisesScreen.screenName: (_) => DayExercisesScreen(),
              DetailsForExerciseInDayScreen.screenName: (_) =>
                  DetailsForExerciseInDayScreen(),
              ProgramTimerScreen.screenName: (_) => ProgramTimerScreen(),
              ProgramRestBetweenRoundsScreen.screenName: (_) =>
                  ProgramRestBetweenRoundsScreen(),
              NewMessageScreen.screenName: (_) => NewMessageScreen(),
              MessageScreen.screenName: (_) => MessageScreen(),
              NotificationScreen.screenName: (_) => NotificationScreen(),
              PremiumAccScreen.screenName: (_) => PremiumAccScreen(),
              // Splash0.screenName: (_) => Splash0()
            },
          );
        }),
      ),
    );
  }
}

class MySplash extends StatelessWidget {
  final bool isLogedIn;

  const MySplash({@required this.isLogedIn});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return NewSplash(
      isJustWatingForStreamBuilder: false,
      wilNavigateToHome: isLogedIn,
    );
  }
}

class HomeScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
        toolbarHeight: 90,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProfileScreen.screenName);
          },
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: UserPhotoHome(false),
          ),
        ),
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 19,
                    color: isDark ? Colors.white : Colors.black45,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<UserData>(
                      builder: (_, data, ch) => Text(
                        'Ahmed Ashraf',
                        style: TextStyle(
                            color: isDark ? Colors.white : Colors.black54,
                            fontSize: 23,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Image.asset('assets/images/strong.png')
              ],
            )
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(NewMessageScreen.screenName),
            child: Image.asset('assets/images/Message.png'),
          ),
          GestureDetector(
            onTap: () =>
                Navigator.of(context).pushNamed(NotificationScreen.screenName),
            child: Image.asset('assets/images/Notifcation.png'),
          ),
        ],
      ),
      // resizeToAvoidBottomInset: true,
      // key: _drawerKey,
      // drawer: Theme(
      //   data: Theme.of(context).copyWith(canvasColor: Color(0xFFE9E9E9)),
      //   child: Drawer(
      //     child: MyDrawer(),
      //   ),
      // ),
      body: ListView(
        children: [
          // DrawerIcon(() => _drawerKey.currentState.openDrawer()),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/premm.png',
                ),
              ),
              // Positioned(
              //   bottom: SizeConfig.safeBlockVertical,
              //   left: 240,
              //   child: SvgPicture.asset(
              //     'assets/images/premfit.svg',
              //     height: SizeConfig.safeBlockVertical * 21,
              //   ),
              // ),
              //PremAccButton
              Positioned(
                top: 105,
                left: 15,
                child: SizedBox(
                  height: SizeConfig.safeBlockVertical * 6,
                  width: SizeConfig.safeBlockVertical * 25,
                  child: AnimatedButton(
                    height: 48,
                    shadowDegree: ShadowDegree.dark,
                    duration: 100,
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => PremiumAccScreen()));
                    },
                    // style: ButtonStyle(
                    //   backgroundColor:
                    //       MaterialStateProperty.all<Color>(Colors.white),
                    // ),
                    child: Text(
                      'Subscribe Now',
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.safeBlockVertical),
          // Stack(
          //   children: [
          //     Positioned.fill(
          //       child: GestureDetector(
          //         child: Container(
          //           color: Colors.transparent,
          //         ),
          //         onTap: () {
          //           Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (_) => ViewRecommendedProgramsScreen(),
          //             ),
          //           );
          //         },
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          // FutureBuilder<Map<String, List<ProgramModel>>>(
          //   future: getCategories(),
          //   builder: (_, snap) {
          //     if (snap.connectionState == ConnectionState.waiting ||
          //         snap.hasError) {
          //       return Padding(
          //         padding:
          //             EdgeInsets.only(bottom: SizeConfig.safeBlockVertical * 3),
          //         child: Center(
          //           child: CircularProgressIndicator(color: primaryColor),
          //         ),
          //       );
          //     }
          //     return Container();
          //
          //     //   Column(
          //     //   children: snap.data.keys
          //     //       .map((programName) => CategoryItem(
          //     //             categoryName: programName,
          //     //             allPrograms: snap.data[programName],
          //     //           ))
          //     //       .toList(),
          //     // );
          //   },
          // ),

          FullBody(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          Calisth(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          BodyBuildNew(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          FuncTrain(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          LoseWeight(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          Articles(),
          SizedBox(height: SizeConfig.safeBlockVertical * 3.5),
          Beaf(),
        ],
        // padding: EdgeInsets.symmetric(
        //   vertical: SizeConfig.safeBlockVertical,
        // ),
      ),
      bottomNavigationBar: BottomNavigationToolBar(),
      // SizedBox(
      //   child: BottomNavigationToolBar(),
      //   // height: SizeConfig.safeBlockVertical * 6,
      //   height: SizeConfig.blockSizeVertical * 7.3,
      // ),
    );
  }
}
