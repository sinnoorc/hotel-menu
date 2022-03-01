import 'package:flutter/material.dart';
import 'package:string_extensions/string_extensions.dart';

class TableItem extends StatelessWidget {
  const TableItem({
    Key? key,
    required this.tablesId,
    required this.tablesStatus,
    required this.id,
    required this.color,
  }) : super(key: key);
  final String tablesId, tablesStatus, id;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/explore', arguments: id),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Table $tablesId',
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: color.computeLuminance() > 0.7 ? Colors.black : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                // Text(
                //   DateFormat('H:mm a').format(DateTime.now()),
                //   style: Theme.of(context).textTheme.caption!.copyWith(
                //         color: color.computeLuminance() > 0.7 ? Colors.black : Colors.white,
                //         fontSize: 15,
                //         fontWeight: FontWeight.normal,
                //       ),
                //   maxLines: 1,
                //   overflow: TextOverflow.ellipsis,
                // ),
              ],
            ),
            Text(
              tablesStatus.capitalize().toString(),
              style: Theme.of(context).textTheme.caption!.copyWith(
                    color: color.computeLuminance() > 0.7 ? Colors.black : Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = Colors.orange,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
