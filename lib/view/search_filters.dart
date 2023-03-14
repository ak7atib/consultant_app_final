import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../components/category_list_tile.dart';
import '../components/my_app_bar.dart';
import '../components/status_list_tile.dart';
import '../constant/const.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int valueCategory = 0;
  int valueStatus = 0;
  Widget customListTileButtonCategory(String text, int index) {
    return ListTile(
      onTap: () {
        setState(() {
          valueCategory = index;
        });
      },
      title: Text(
        text,
      ),
      trailing: (valueCategory == index)
          ? Icon(
              Icons.check,
              color: ksecColor,
            )
          : SizedBox(),
    );
  }

  Widget customListTileButtonStatus(String text, int index, Color color) {
    return ListTile(
      onTap: () {
        setState(() {
          valueStatus = index;
        });
      },
      title: Text(
        text,
      ),
      leading: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      trailing: (valueStatus == index)
          ? Icon(
              Icons.check,
              color: ksecColor,
            )
          : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgrondColor,
      appBar: MyAppBar(title: "filter"),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 280,
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customListTileButtonCategory("Organization", 1),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonCategory("ngos", 2),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonCategory("Border", 3),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonCategory("Others", 4)
                    ],
                  )),
              Container(
                  height: 280,
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.only(left: 8, right: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      customListTileButtonStatus("inbox", 1, Colors.red),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonStatus("Pending", 2, Colors.amber),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonStatus("inProgress", 3, Colors.blue),
                      const Divider(
                        color: Colors.grey,
                      ),
                      customListTileButtonStatus("Completed", 4, Colors.green)
                    ],
                  )),
              ExpansionTile(
                  title: Text("Date", style: TextStyle(fontSize: 18)),
                  leading: const Icon(
                    Icons.date_range,
                    color: Colors.red,
                  ),
                  subtitle: const Text(
                    'Tuesday, July 5, 2022',
                    style: TextStyle(color: ksecColor, fontSize: 12),
                  ),
                  children: [
                    // SfDateRangePicker(
                    //   selectionMode:
                    //   DateRangePickerSelectionMode.single,
                    //   initialSelectedRange: PickerDateRange(
                    //       DateTime.now()
                    //           .subtract(const Duration(days: 4)),
                    //       DateTime.now().add(const Duration(days: 3))),
                    // ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
