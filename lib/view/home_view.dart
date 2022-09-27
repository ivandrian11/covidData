import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view_model/data_view_model.dart';
import '../model/api_response.dart';
import '../widget/data_container.dart';
import '../widget/symptoms_container.dart';
import '../widget/tab_option.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataC = Get.put(DataViewModel());

    Widget buttonContainer() => Container(
          height: 56,
          decoration: BoxDecoration(
            color: Color(0xffF49E6F),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            children: [
              TabOption(
                onTap: () => dataC.switchTrackOn(),
                text: 'Tracker',
                isTrackerOn: dataC.isTrackerOn.value,
              ),
              TabOption(
                onTap: () => dataC.switchTrackOff(),
                text: 'Symptoms',
                isTrackerOn: !dataC.isTrackerOn.value,
              ),
            ],
          ),
        );

    Widget trackerWidget() => Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                filled: true,
                fillColor: Colors.greenAccent,
              ),
              dropdownColor: Colors.greenAccent,
              value: dataC.dropwdownValue.value,
              onChanged: (newValue) => dataC.dropwdownValue = newValue,
              items: dataC.province
                  .map<DropdownMenuItem<String>>(
                    (String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          value.toTitleCase(),
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 20),
            GridView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              children: [
                DataContainer(
                  color: Color(0xffFC1441),
                  label: 'Confirmed',
                  data: dataC.confirmed[dataC.getIndexByValue()],
                ),
                DataContainer(
                  color: Color(0xff157FFB),
                  label: 'Active',
                  data: dataC.active[dataC.getIndexByValue()],
                ),
                DataContainer(
                  color: Color(0xff30A64A),
                  label: 'Recovered',
                  data: dataC.recovered[dataC.getIndexByValue()],
                ),
                DataContainer(
                  color: Color(0xff6D757D),
                  label: 'Deceased',
                  data: dataC.deceased[dataC.getIndexByValue()],
                ),
              ],
            ),
          ],
        );

    Widget symptomsWidget() => GridView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          children: const [
            SymptomsContainer(label: 'Nausea'),
            SymptomsContainer(label: 'Cough'),
            SymptomsContainer(label: 'Headache'),
            SymptomsContainer(label: 'Fever'),
            SymptomsContainer(label: 'Short Breath'),
            SymptomsContainer(label: 'Sore Throat'),
          ],
        );

    Widget appWidget() {
      switch (dataC.response.value.status) {
        case Status.loading:
          return Center(child: CircularProgressIndicator());
        case Status.completed:
          return SafeArea(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                doctorContainer(),
                SizedBox(height: 30),
                buttonContainer(),
                SizedBox(height: 24),
                dataC.isTrackerOn.value ? trackerWidget() : symptomsWidget(),
              ],
            ),
          );
        case Status.error:
          return Center(
            child: Text('Please try again later!'),
          );
        case Status.initial:
        default:
          return Center(
            child: Text('Nothing'),
          );
      }
    }

    return Scaffold(
      body: Obx(
        () => appWidget(),
      ),
    );
  }
}

Widget doctorContainer() => SizedBox(
      height: 142,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                backgroundContainer(true),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/doctor2.png'),
                ),
              ],
            ),
          ),
          Expanded(
            child: backgroundContainer(
              false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Know safety tips and precautions from top Doctors.',
                  ),
                  SizedBox(height: 8),
                  Container(
                    width: 52,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Color(0xff9156EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

Widget backgroundContainer(bool isLeft, {Widget? child}) => Container(
      child: child,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Color(0xffCFE3FC),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(isLeft ? 24 : 0),
          right: Radius.circular(isLeft ? 0 : 24),
        ),
      ),
    );
