import 'package:flutter/material.dart';
import 'package:hotel_menu/constants/app_style.dart';
import 'package:hotel_menu/model/table.dart';
import 'package:hotel_menu/services/api_services.dart';
import 'package:hotel_menu/widget/table_item.dart';

import '../responsive.dart';

class TableScreen extends StatelessWidget {
  const TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tables',
            style: AppStyle.appBar,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Responsive(
                  mobile: TableCard(
                    crossAxisCount: _size.width < 650 ? 2 : 4,
                    childAspectRatio: _size.width < 650 && _size.width > 350 ? 1.3 : 1,
                  ),
                  tablet: TableCard(),
                  desktop: TableCard(
                    childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TableCard extends StatefulWidget {
  TableCard({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  State<TableCard> createState() => _TableCardState();
}

class _TableCardState extends State<TableCard> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TableModel>(
      future: ApiServices.getTableList(),
      builder: (ctx, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              padding: const EdgeInsets.all(5),
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: snapshot.data!.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.crossAxisCount,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: widget.childAspectRatio,
              ),
              itemBuilder: (context, index) {
                var table = snapshot.data!.data![index];
                return TableItem(
                  tablesId: table.tableNo.toString(),
                  tablesStatus: table.bookingStatus ?? '',
                  id: table.id.toString(),
                  color: table.bookingStatus == 'booked' ? Colors.red : Colors.green,
                );
              });
        } else if (snapshot.hasError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Failed to load data'),
              TextButton(
                child: const Text('Try again'),
                onPressed: () {
                  setState(() {
                    ApiServices.getTableList();
                  });
                },
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
