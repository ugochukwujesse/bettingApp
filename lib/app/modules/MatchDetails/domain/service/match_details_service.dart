import 'dart:convert';

import 'package:betting_app/app/modules/MatchDetails/model/response_model/best_player_response_model.dart';
import 'package:betting_app/app/modules/MatchDetails/model/response_model/highlight_response_model.dart';
import 'package:betting_app/app/modules/MatchDetails/model/response_model/incident_response_model.dart';
import 'package:flutter/services.dart';

class MatchDetailsService {
  Future<HighlightResponseModel> loadHighlightData() async {
    try {
      final response =
          await rootBundle.loadString('assets/json/videoHighlight.json');

      final Map<String, dynamic> data = json.decode(response);

      return HighlightResponseModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load highlights: $e');
    }
  }

  Future<BestPlayerResponseModel> loadBestPlayerData() async {
    try {
      final response =
          await rootBundle.loadString('assets/json/bestPlayer.json');

      final Map<String, dynamic> data = json.decode(response);

      return BestPlayerResponseModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load highlights: $e');
    }
  }

  Future<IncidentResponseModel> loadIncidentData() async {
    try {
      final response = await rootBundle.loadString('assets/json/incident.json');

      final Map<String, dynamic> data = json.decode(response);

      return IncidentResponseModel.fromJson(data);
    } catch (e) {
      throw Exception('Failed to load highlights: $e');
    }
  }
}
