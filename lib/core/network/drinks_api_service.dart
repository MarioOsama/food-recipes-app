import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/models/drink_response.dart';
import 'package:food_recipes_app/core/network/api_constants.dart';
import 'package:retrofit/http.dart';

part 'drinks_api_service.g.dart';

@RestApi(baseUrl: Apiconstant.drinkBaseUrl)
abstract class DrinksApiServices {
  factory DrinksApiServices(Dio dio) = _DrinksApiServices;

  @GET(Apiconstant.searchById)
  Future<DrinkResponse> getDrinkById(@Query("i") String query);
}
