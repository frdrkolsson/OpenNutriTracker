import 'package:flutter/material.dart';
import 'package:opennutritracker/core/domain/entity/user_activity_entity.dart';
import 'package:opennutritracker/core/presentation/widgets/activity_card.dart';
import 'package:opennutritracker/core/presentation/widgets/placeholder_intake_card.dart';

class ActivityVerticalList extends StatelessWidget {
  final String title;
  final List<UserActivityEntity> userActivityList;
  final Function(BuildContext, UserActivityEntity) onItemLongPressedCallback;

  const ActivityVerticalList(
      {Key? key,
      required this.title,
      required this.userActivityList,
      required this.onItemLongPressedCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 8.0),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        userActivityList.isEmpty
            ? const Align(
                alignment: Alignment.centerLeft,
                child:
                    PlaceholderIntakeCard(icon: Icons.directions_run_outlined))
            : SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: userActivityList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final userActivity = userActivityList[index];
                    return ActivityCard(
                      activityEntity: userActivity,
                      onItemLongPressed: onItemLongPressedCallback,
                    );
                  },
                ),
              ),
      ],
    );
  }
}