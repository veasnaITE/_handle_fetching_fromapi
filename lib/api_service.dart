
import 'package:foodpanda_clone/constants.dart';
import 'package:foodpanda_clone/model/restaurant_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<RestuarantModel> getRestaurant() async {
    try {
      var url = Uri.parse(ApiConstrants.baseUrl+ApiConstrants.restaurantsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        return restuarantModelFromJson(response.body);
      }else{
        throw Exception('Failed to fetch restaurants.');
      }
    } catch (e) {
      throw Exception('Failed to fetch restaurants.');
    }
  }
}
