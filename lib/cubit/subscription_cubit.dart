import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_hackathon_karol/models/subscription_page.dart';
import 'package:flutter_application_hackathon_karol/services/subscription_service.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  void createSubscription(String userid) async {
    try {
      emit(SubscriptionLoading());
      await SubscriptionService().createSubscription(userid);
      emit(SubscriptionSuccess(const []));
    } catch (e) {
      emit(SubscriptionFailed(e.toString()));
    }
  }
}
