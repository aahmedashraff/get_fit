import 'package:CaptainSayedApp/screens/before_signup_screens/gender_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/goals_screen.dart';
import 'package:CaptainSayedApp/screens/before_signup_screens/old_screen.dart';
import 'package:CaptainSayedApp/screens/exercise_screen/exercise_screen.dart';
import 'package:CaptainSayedApp/screens/profile_screen/screen_widgets/create_before_after.dart';
import 'package:CaptainSayedApp/screens/settings_screen/widget_of_screen/weightSlider.dart';

List currentIndexPage = [
  GenderScreen(),
  OldScreen(),
  WeightSlider(),
  ExerciseScreen(),
  GoalsScreen(),
  CreateBeforeAfter(),
];
