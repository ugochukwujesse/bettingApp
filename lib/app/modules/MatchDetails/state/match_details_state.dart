import '../model/response_model/best_player_response_model.dart';
import '../model/response_model/highlight_response_model.dart';
import '../model/response_model/incident_response_model.dart';

abstract class MatchDetailsState {}

class MatchDetailsInitial extends MatchDetailsState {}

class MatchDetailsLoading extends MatchDetailsState {}

class MatchDetailsLoaded extends MatchDetailsState {
  final HighlightResponseModel? highlights;
  final BestPlayerResponseModel? bestPlayer;
  final IncidentResponseModel? incident;

  MatchDetailsLoaded({this.highlights, this.bestPlayer, this.incident});

  MatchDetailsLoaded copyWith({
    HighlightResponseModel? highlights,
    BestPlayerResponseModel? bestPlayer,
    IncidentResponseModel? incident,
  }) {
    return MatchDetailsLoaded(
      highlights: highlights ?? this.highlights,
      bestPlayer: bestPlayer ?? this.bestPlayer,
      incident: incident ?? this.incident,
    );
  }
}

class MatchDetailsError extends MatchDetailsState {
  final String message;
  MatchDetailsError(this.message);
}
