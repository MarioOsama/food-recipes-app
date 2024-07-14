import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/models/food_response_model.dart';
import 'package:food_recipes_app/core/networking/api_constant.dart';
import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';
import 'package:food_recipes_app/features/see_more/data/models/food_filter_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'food_api_services.g.dart';

@RestApi(baseUrl: ApiConstant.foodBaseUrl)
abstract class FoodApiServices {
  factory FoodApiServices(Dio dio, {String baseUrl}) = _FoodApiServices;

  @GET(ApiConstant.randomRecipe)
  Future<FoodResponseModel> getRandomRecipeData();

  @GET(ApiConstant.categories)
  Future<FoodCategoriesResponseModel> getCategoriesData();

  @GET(ApiConstant.filter)
  Future<FoodFilterResponseModel> getFilteredData(
    @Query('c') String category,
  );

  @GET(ApiConstant.search)
  Future<FoodResponseModel> getByID(
    @Query('i') String id,
  );
}
