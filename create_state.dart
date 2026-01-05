class CreateState {}
class CreateInitialState extends CreateState{}
class CreateLoadingState extends CreateState{}
class CreateLoaded extends CreateState{}
class CreateError extends CreateState{
  String message;
  CreateError({required this.message});
}
