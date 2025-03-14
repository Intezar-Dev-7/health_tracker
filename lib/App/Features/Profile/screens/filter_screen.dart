import 'package:flutter/material.dart';
import 'package:health_tracker/App/Common/widgets/back_button.dart';
import 'package:health_tracker/App/Utils/Constants/MyColors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool availabilityToday = false;
  int selectedGender = 0; // 0 for Male, 1 for Female
  int workExperience = 0; // 0: 1-5, 1: 6-9, 2: >10
  double age = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primary,
        elevation: 0,
        leading: backButton(context),
        title: Text(
          'Filter',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(color: MyColors.white),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Reset logic here
              setState(() {
                availabilityToday = false;
                selectedGender = 0;
                workExperience = 0;
                age = 40;
              });
            },
            child: const Text(
              'Reset',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Availability Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Availability Today',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: availabilityToday,
                  onChanged: (value) {
                    setState(() {
                      availabilityToday = value;
                    });
                  },
                  activeColor: MyColors.primary,
                ),
              ],
            ),
            const Divider(),

            // Gender Selection
            const Text(
              'Gender',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: const Text('Male'),
                    selected: selectedGender == 0,
                    onSelected: (selected) {
                      setState(() {
                        selectedGender = 0;
                      });
                    },
                    selectedColor: MyColors.primary,
                    labelStyle: TextStyle(
                      color: selectedGender == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ChoiceChip(
                    label: const Text('Female'),
                    selected: selectedGender == 1,
                    onSelected: (selected) {
                      setState(() {
                        selectedGender = 1;
                      });
                    },
                    selectedColor: MyColors.primary,
                    labelStyle: TextStyle(
                      color: selectedGender == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),

            // Top Rated
            const Text(
              'Top Rated',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(
                5,
                (index) => Icon(
                  index < 3 ? Icons.star : Icons.star_border,
                  color: MyColors.primary,
                ),
              ),
            ),
            const Divider(),

            // Work Experience
            const Text(
              'Work Experience (Years)',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ChoiceChip(
                    label: const Text('1 - 5'),
                    selected: workExperience == 0,
                    onSelected: (selected) {
                      setState(() {
                        workExperience = 0;
                      });
                    },
                    selectedColor: MyColors.primary,
                    labelStyle: TextStyle(
                      color: workExperience == 0 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ChoiceChip(
                    label: const Text('6 - 9'),
                    selected: workExperience == 1,
                    onSelected: (selected) {
                      setState(() {
                        workExperience = 1;
                      });
                    },
                    selectedColor: MyColors.primary,
                    labelStyle: TextStyle(
                      color: workExperience == 1 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ChoiceChip(
                    label: const Text('10 >'),
                    selected: workExperience == 2,
                    onSelected: (selected) {
                      setState(() {
                        workExperience = 2;
                      });
                    },
                    selectedColor: MyColors.primary,
                    labelStyle: TextStyle(
                      color: workExperience == 2 ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            // Specialty
            const Text(
              'Specialty',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon:
                      const Icon(Icons.arrow_back_ios, color: MyColors.primary),
                  onPressed: () {},
                ),
                ...List.generate(
                  4,
                  (index) => Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.teal[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.ac_unit, // Replace with your specialty icons
                      color: MyColors.primary,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: MyColors.primary),
                  onPressed: () {},
                ),
              ],
            ),
            const Divider(),

            // Age Slider
            const Text(
              'Age',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: age,
              min: 20,
              max: 80,
              divisions: 60,
              label: age.round().toString(),
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
              activeColor: MyColors.primary,
              inactiveColor: Colors.teal[100],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('20'),
                Text('80'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
