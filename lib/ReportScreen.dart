import 'package:bigg_bite_manager/Models/report_model/report_response_model.dart';
import 'package:bigg_bite_manager/api/api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late Future<ReportResponseModel> futureReport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                dateTimeRangePicker();
              },
              child: Text('Select Range'),
            ),
            FutureBuilder<ReportResponseModel>(builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(itemBuilder: (context, index) {
                  return Container(
                    child: Text('text'),
                  );
                });
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }

  dateTimeRangePicker() async {
    DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year),
      // initialDateRange: DateTimeRange(
      //   end: DateTime(
      //       DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
      //   start: DateTime.now(),
      // ),
    );
    if (picked != null) {
      String fromDate = DateFormat('yyyy-MM-dd').format(picked!.start);
      String toDate = DateFormat('yyyy-MM-dd').format(picked!.end);
      // ReportResponseModel response = await getReport(context, fromDate, toDate);
      futureReport = getReport(context, fromDate, toDate);
      setState(() {});
    }
  }
}
