import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoTooltip extends StatelessWidget {
  const InfoTooltip({
    super.key,
    required this.tooltipKey,
  });

  final GlobalKey<TooltipState> tooltipKey;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      triggerMode: TooltipTriggerMode.manual,
      key: tooltipKey,
      message:
          "Cash flow data is updated monthly. Configure whether the update should occur at the beginning or end of the month.",
      showDuration: const Duration(seconds: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.black.withOpacity(0.8),
      ),
      enableFeedback: true,
      verticalOffset: 1,
      textStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w200,
      ),
      height: 50,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      child: IconButton(
        onPressed: () {
          tooltipKey.currentState?.ensureTooltipVisible();
        },
        icon: const Icon(
          CupertinoIcons.info_circle,
          color: Colors.white,
        ),
      ),
    );
  }
}
