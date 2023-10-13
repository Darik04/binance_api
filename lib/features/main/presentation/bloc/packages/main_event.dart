part of 'main_bloc.dart';


abstract class MainEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class GetMainEvent extends MainEvent{
  GetMainEvent();
}


class CreateTrackEvent extends MainEvent{
  final String track;
  final String description;
  CreateTrackEvent({required this.track, required this.description});
}
class DeleteTrackEvent extends MainEvent{
  final int id;
  DeleteTrackEvent({required this.id});
}