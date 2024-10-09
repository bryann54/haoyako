import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_listing_event.dart';
part 'home_listing_state.dart';

class HomeListingBloc extends Bloc<HomeListingEvent, HomeListingState> {
  HomeListingBloc() : super(HomeListingInitial()) {
    on<HomeListingEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
