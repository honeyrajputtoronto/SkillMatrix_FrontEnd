import 'dart:core';
import 'package:get/get.dart';

String username = '';
var questionData = [];
String matchId = '';
RxString player = ''.obs;
RxString opponent = ''.obs;
double score = 0.0;
String participantId = '';
String competitionId = '';
String accessToken = '';
int userId = 0;
int competitionHour = 0;
int competitionMinute = 0;
int competitionSecond = 0;
int participantLevel = 0;
RxBool isCompetitionWinner = false.obs;
String baseUrl = 'http://127.0.0.1:8000/';