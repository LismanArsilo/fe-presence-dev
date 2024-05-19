import 'package:flutter/material.dart';

class RecognitionEmbedding {
  Rect location;
  final List<double> embedding;

  RecognitionEmbedding(this.location, this.embedding);
}
