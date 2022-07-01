// @dart=2.9
import 'package:CaptainSayedApp/providers/app_data.dart';
import 'package:CaptainSayedApp/providers/bloc/bloc.dart';
import 'package:sizer/sizer.dart';

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
import 'package:CaptainSayedApp/screens/premium_acc_screen/buy_program.dart';
import 'package:CaptainSayedApp/screens/premium_acc_screen/premium_acc_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/account_data_edit.dart';
import 'package:CaptainSayedApp/screens/profile_screen/change_name.dart';
import 'package:CaptainSayedApp/screens/profile_screen/change_pass_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/personal_edit.dart';
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
import 'package:shared_preferences/shared_preferences.dart';

import 'dimensions.dart';
import 'firebase_options.dart';
import 'login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

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
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp(
                title: 'Get Fit',
                debugShowCheckedModeBanner: false,
                theme: notifier.darkTheme
                    ? ThemeClass.darkTheme
                    : ThemeClass.lightTheme,
                themeMode: _themeManager.themeMode,
                darkTheme: ThemeClass.lightTheme,
                home: Consumer<Auth>(builder: (context, auth, __) {
                  SizeConfig().init(context);
                  Dimensions().init(context);
                  final userData =
                      Provider.of<UserData>(context, listen: false);
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
                  AccountDataEdit.screenName: (_) =>
                      LayoutOfAllFirstScreens(AccountDataEdit()),
                  ChangeNameScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(ChangeNameScreen()),
                  LevelScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(LevelScreen()),
                  OldScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(OldScreen()),
                  WeightScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(WeightScreen()),

                  HeightScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(HeightScreen()),
                  CongratulationScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(CongratulationScreen()),
                  ChangePassScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(ChangePassScreen()),

                  ExercisePlaceScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(ExercisePlaceScreen()),
                  BuyProgramScreen.screenName: (_) =>
                      LayoutOfAllFirstScreens(BuyProgramScreen()),
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
                  PersonalEdit.screenName: (_) => Provider(
                        create: (_) => Bloc(),
                        child: LayoutOfAllFirstScreens(PersonalEdit()),
                      ),
                  //HomeScreen.screenName: (_) => HomeScreen(),
                  ExerciseScreen.screenName: (_) => ExerciseScreen(),
                  TimerScreen.screenName: (_) => TimerScreen(),
                  DownloadsScreen.screenName: (_) => DownloadsScreen(),
                  ExerciseDetailsScreen.screenName: (_) =>
                      ExerciseDetailsScreen(),
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
      resizeToAvoidBottomInset: true,

      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey.shade900 : Colors.grey.shade50,
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfileScreen()),
            );
          },
          child: Padding(
            padding: EdgeInsets.only(left: 1.3.w),
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
                    fontSize: 14.sp,
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
                            fontSize: 17.sp,
                            overflow: TextOverflow.fade,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
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
              Positioned(
                top: 10.3.h,
                left: 2.w,
                child: SizedBox(
                  height: 7.5.h,
                  width: 60.w,
                  child: AnimatedButton(
                    height: 6.h,
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
                      style: TextStyle(
                          color: Colors.grey.shade700, fontSize: 16.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 1.h),
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
          SizedBox(height: 2.h),
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
          SizedBox(height: 1.h),
          Calisth(),
          SizedBox(height: 1.h),
          BodyBuildNew(),
          SizedBox(height: 1.h),
          FuncTrain(),
          SizedBox(height: 1.h),
          LoseWeight(),
          SizedBox(height: 1.h),
          Articles(),
          SizedBox(height: 1.h),
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
