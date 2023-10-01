import 'package:flutter/material.dart';
import 'package:foodpanda_clone/api_service.dart';
import 'package:foodpanda_clone/model/restaurant_model.dart';

class RestaurantListPage extends StatefulWidget {
  @override
  _RestaurantListPageState createState() => _RestaurantListPageState();
}
class _RestaurantListPageState extends State<RestaurantListPage> {
  @override
  void initState() {
    super.initState();
  }
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
      ),
      body: FutureBuilder<RestuarantModel>(
        future: apiService.getRestaurant(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black12,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          child: Image.network(
                            'https://cms.istad.co${snapshot.data!.data[index].attributes.picture.data.attributes.url}',
                            width: 100,
                          ),
                        ),
                        SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.data[index].attributes.name),
                            Text(snapshot.data!.data[index].attributes.category),
                            Text(snapshot.data!.data[index].attributes.createdAt.toString()),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('No data available.'),
          );
        },
      ),
    );
  }
}