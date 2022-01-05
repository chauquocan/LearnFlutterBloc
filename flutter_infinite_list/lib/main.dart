import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'simple_bloc_observer.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(App()),
      blocObserver: SimpleBlocObserver());
}

