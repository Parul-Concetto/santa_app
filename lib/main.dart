import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:santa_app/core/routes/app_routes.dart';
import 'package:santa_app/presentation/blocs/data_bloc/data_bloc.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// add bloc in root so we can use it any where in app
      providers: [
        BlocProvider(create: (context) => DataBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        theme: ThemeData(useMaterial3: true, fontFamily: 'Poppins'),
      ),
    );
  }
}
