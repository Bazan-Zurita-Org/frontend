import 'package:app_gym/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homebloc = context.read<HomeBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [FlutterLogo(), Text("User")],
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return homebloc.listpage[state.indexpage ?? 0];
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.shifting,
            currentIndex: state.indexpage ?? 0,
            onTap: (value) {
              homebloc.add(HomeEvent.onchangedIndexPage(indexpage: value));
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Rutinas",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Rankings Oficiales",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Retos Semanales"),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Duelo",
              )
            ],
          );
        },
      ),
    );
  }
}
