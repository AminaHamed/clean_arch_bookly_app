part of 'launch_url_cubit.dart';

@immutable
abstract class LaunchUrlState {}

class LaunchUrlInitial extends LaunchUrlState {}

class LaunchUrlLoading extends LaunchUrlState {}

class LaunchUrlSuccess extends LaunchUrlState {}

class LaunchUrlFailure extends LaunchUrlState {
  final String msg;

  LaunchUrlFailure(this.msg);
}
