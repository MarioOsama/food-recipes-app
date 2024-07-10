import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/networking/api_constant.dart';
import 'package:retrofit/retrofit.dart';

part 'food_api_services.g.dart';

@RestApi(baseUrl: ApiConstant.foodBaseUrl)
abstract class FoodApiServices {
  factory FoodApiServices(Dio dio, {String baseUrl}) = _FoodApiServices;

  @GET(ApiConstant.randomRecipe)
  Future<FoodResponseModel> getRandomRecipeData();
}
