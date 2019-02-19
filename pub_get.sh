#!/usr/bin/env bash

cd counter_app && flutter packages get && cd .. &&
cd dart_pos &&  pub get && cd .. &&
cd dart_pos_end &&  pub get && cd .. &&
cd e_commerce_complete &&  flutter packages get && cd .. &&
cd flutter_firebase_repository &&  flutter packages get && cd .. &&
cd shared_lib && pub get && pub run build_runner build && cd .. &&
cd weather_app_complete && flutter pub get && cd .. &&
cd weather_app_start_chapter_5 && flutter pub get && cd .. &&
cd weather_app_start_chapter_6 && flutter pub get && cd .. &&
echo Got all packages and set up respositoy!
