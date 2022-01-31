import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampleapi/home/bloc/home_bloc.dart';
import 'package:sampleapi/services/bored_service.dart';
import 'package:sampleapi/services/connectivity_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<BoredService>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sample API'),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeLoadedState) {
            return Column(
              children: [
                Text(state.activityName),
                Text(state.activityType),
                Text(state.participants.toString()),
                ElevatedButton(
                    onPressed: () =>
                        BlocProvider.of<HomeBloc>(context).add(LoadApiEvent()),
                    child: Text('Load Next'))
              ],
            );
          }
          if (state is HomeNoInternetState) {
            return Text('No Internet');
          }
          return Container();
        }),
      ),
    );
  }
}
