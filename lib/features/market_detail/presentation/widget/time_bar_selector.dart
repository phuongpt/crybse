import 'package:crybse/shared/core/extensions/Iterable_extension.dart';
import 'package:crybse/shared/providers/time_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimeBarSelector extends HookConsumerWidget {
  const TimeBarSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: timeList
            .mapIndexed(
              (e, i) => InkWell(
                onTap: () {
                  ref.read(timeDataProvider.notifier).updateTimeGraphData(e);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  decoration: BoxDecoration(
                    color: ref.watch(timeDataProvider).name == e.name ? Theme.of(context).cardColor : Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Center(
                    child: Text(
                      e.name,
                      style: ref.watch(timeDataProvider).name == e.name
                          ? Theme.of(context).textTheme.displaySmall!.apply(color: Colors.white)
                          : Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
