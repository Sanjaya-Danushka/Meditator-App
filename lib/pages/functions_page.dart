import 'package:flutter/material.dart';
import 'package:meditation/models/functions_model.dart';
import 'package:meditation/utils/colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Functionspage extends StatefulWidget {
  final FunctionsData functionsData;
  const Functionspage({
    super.key,
    required this.functionsData,
  });

  @override
  State<Functionspage> createState() => _FunctionspageState();
}

class _FunctionspageState extends State<Functionspage> {
  // Controller
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Get video ID from URL
    final videoId =
        YoutubePlayer.convertUrlToId(widget.functionsData.url) ?? '';
    // Initialize controller
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.functionsData.title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (_controller.initialVideoId.isNotEmpty)
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: YoutubePlayer(controller: _controller),
                    ),
                  )
                else
                  const Text('No video available'),
                const SizedBox(height: 40),
                Text(
                  'Duration: ${widget.functionsData.duration} min',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGrey,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Category: ${widget.functionsData.category}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryGreen,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.functionsData.description,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: AppColors.primaryDarkBlue,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
