import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/api_manager/api_manager.dart';

import '../../../model/source_response/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState(message: 'Loading...'));

  void loadSources(String catId) async {
    try {
      var response = await ApiManager.getSources(catId);
      if (response.status == 'error') {
        emit(ErrorState(errorMessage: response.message));
      } else {
        emit(SuccessState(sourcesList: response.sources));
      }
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}

sealed class CategoryDetailsState {} // make the class sealed instead of abstract => to make the states to be only the states in this class (only)

class LoadingState extends CategoryDetailsState {
  String message;
  LoadingState({required this.message});
}

class SuccessState extends CategoryDetailsState {
  List<Source>? sourcesList;
  SuccessState({required this.sourcesList});
}

class ErrorState extends CategoryDetailsState {
  String? errorMessage;
  ErrorState({this.errorMessage});
}
