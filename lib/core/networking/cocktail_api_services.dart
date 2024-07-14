import 'package:dio/dio.dart';
import 'package:food_recipes_app/core/models/cocktail_response_model.dart';
import 'package:food_recipes_app/core/networking/api_constant.dart';
import 'package:food_recipes_app/features/see_more/data/models/category_model.dart';
import 'package:food_recipes_app/features/see_more/data/models/cocktail_filter_response_model.dart';
import 'package:retrofit/http.dart';

part 'cocktail_api_services.g.dart';

@RestApi(baseUrl: ApiConstant.cocktailBaseUrl)
abstract class CocktailApiServices {
  factory CocktailApiServices(Dio dio, {String baseUrl}) = _CocktailApiServices;

  @GET(ApiConstant.randomRecipe)
  Future<CocktailResponseModel> getRandomRecipeData();

  @GET(ApiConstant.list)
  Future<CocktailCategoriesResponseModel> getCategoriesData(
    @Query('c') String method,
  );

  @GET(ApiConstant.filter)
  Future<CocktailFilterResponseModel> getFilteredData(
    @Query('c') String category,
  );

  @GET(ApiConstant.search)
  Future<CocktailResponseModel> getByID(
    @Query('i') String id,
  );
}
