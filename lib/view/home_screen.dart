import 'package:flutter/material.dart';
import 'package:mvvm_complete/view_model/home_screen_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final provider = Provider.of<Homenotifier>(context, listen: false);
    provider.userApiCall(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api call'),
        ),
        body: Consumer<Homenotifier>(
            builder: ((context, value, child) => value.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: value.userData.length,
                    itemBuilder: (context, index) {
                      return Text(value.userData[index]['first_name']);
                    }))));
  }
}
