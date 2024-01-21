
import 'package:dio/dio.dart';
import 'package:dio_flutter/network/api_helper.dart';
import 'package:flutter/material.dart';
import 'model/jsonModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyApps(),
    );
  }
}

class MyApps extends StatelessWidget {

  SuperheroApiHelper helper = new SuperheroApiHelper();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Superheroes App'),
        ),
        body: FutureBuilder<SuperheroList>(
          future: helper.fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              List<Superhero> superheroList = snapshot.data!.superheros;

              return ListView.builder(
                itemCount: superheroList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(superheroList[index].name),
                    subtitle: Text(superheroList[index].power),
                    leading: Image.network(superheroList[index].url),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}