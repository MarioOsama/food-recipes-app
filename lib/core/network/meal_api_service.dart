import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/models/meals_response.dart';
import 'package:food_recipes_app/core/network/api_constants.dart';
import 'package:retrofit/http.dart';
part 'meal_api_service.g.dart';

@RestApi(baseUrl: Apiconstant.mealBaseUrl)
abstract class MealApiService {
  factory MealApiService(Dio dio, ) = _MealApiService;

  @GET(Apiconstant.search)
  Future<MealsResponse> getSearch(@Query("s") String query );

   @GET(Apiconstant.searchById)
  Future<MealsResponse> getSearchById(@Query("i") String query );

}
