
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:initial_setup/Utils/AppHelper/shared_preferences.dart';
import 'package:initial_setup/flutter_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs.initMySharedPreferences();
  runApp(MyApp());
}

/// Git setup

// Upload project to git
// - create repo in Github
// - open terminal and follow below command
// - git init
// - git remote add origin "enter git repo link"
// - git add .
// - git commit -m "commit message"
// - git push
//
// Remove git from project
// - project files > remove git folder
// - Android studio setting(preference) > version control  > remove from Directory Mappings

/// FireBase Project SetUp
// curl -sL https://firebase.tools | bash
// firebase login
// dart pub global activate flutterfire_cli
// export PATH="$PATH":"$HOME/.pub-cache/bin"
// flutterfire configure --project=fir-da115

// if already login first
// firebase logout
// firebase login add:krunalgajera98@gmail.com
