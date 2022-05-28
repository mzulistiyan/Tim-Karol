part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionLoading extends SubscriptionState {}

class SubscriptionSuccess extends SubscriptionState {
  final List<SubscriptionModel> subscriptions;
  const SubscriptionSuccess(this.subscriptions);
  @override
  List<Object> get props => [subscriptions];
}

class SubscriptionFailed extends SubscriptionState {
  final String error;

  SubscriptionFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
