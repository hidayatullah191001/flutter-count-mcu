import 'dart:async';
import 'dart:io';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mcu/bloc/auth/auth_bloc.dart';
import 'package:flutter_mcu/bloc/count/count_bloc.dart';
import 'package:flutter_mcu/bloc/peserta/peserta_bloc.dart';
import 'package:flutter_mcu/models/count_form_model.dart';
import 'package:flutter_mcu/models/count_model.dart';
import 'package:flutter_mcu/models/peserta_form_model.dart';
import 'package:flutter_mcu/models/peserta_model.dart';
import 'package:flutter_mcu/models/sign_in_form_model.dart';
import 'package:flutter_mcu/models/sign_up_form_model.dart';
import 'package:flutter_mcu/models/user_model.dart';
import 'package:flutter_mcu/presentations/widgets/widgets.dart';
import 'package:flutter_mcu/shared/shared.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';

part "login_page.dart";
part "register_page.dart";
part "splash_page.dart";
part "home_page.dart";
part "count_page.dart";
part "detail_page.dart";
part "add_page.dart";
