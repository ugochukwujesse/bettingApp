import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/service/match_details_service.dart';
import '../event/match_details_event.dart';
import '../state/match_details_state.dart';

class MatchDetailsBloc extends Bloc<MatchDetailsEvent, MatchDetailsState> {
  final MatchDetailsService matchDetailsService;

  MatchDetailsBloc(this.matchDetailsService) : super(MatchDetailsInitial()) {
    on<FetchHighlightsEvent>((event, emit) async {
      try {
        final highlights = await matchDetailsService.loadHighlightData();
        final currentState = state;
        if (currentState is MatchDetailsLoaded) {
          emit(currentState.copyWith(highlights: highlights));
        } else {
          emit(MatchDetailsLoaded(highlights: highlights));
        }
      } catch (e) {
        emit(MatchDetailsError('Failed to load highlights: $e'));
      }
    });

    on<FetchBestPlayerEvent>((event, emit) async {
      try {
        final bestPlayer = await matchDetailsService.loadBestPlayerData();
        final currentState = state;
        if (currentState is MatchDetailsLoaded) {
          emit(currentState.copyWith(bestPlayer: bestPlayer));
        } else {
          emit(MatchDetailsLoaded(bestPlayer: bestPlayer));
        }
      } catch (e) {
        emit(MatchDetailsError('Failed to load best player: $e'));
      }
    });

    on<FetchIncidentEvent>((event, emit) async {
      try {
        final incident = await matchDetailsService.loadIncidentData();
        final currentState = state;
        if (currentState is MatchDetailsLoaded) {
          emit(currentState.copyWith(incident: incident));
        } else {
          emit(MatchDetailsLoaded(incident: incident));
        }
      } catch (e) {
        emit(MatchDetailsError('Failed to load incident : $e'));
      }
    });
  }
}
