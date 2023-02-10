import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/searchbar.dart';

import '../../utils/colors.dart';
import 'messages_chats_scrollview.dart';
import 'messages_messages_row.dart';
import 'messages_notes_row.dart';
import 'messages_notes_scrollview.dart';

class MessagesScrollView extends StatelessWidget {
  const MessagesScrollView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.black,
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: MessagesSearchBar(),
            ),
            const SliverToBoxAdapter(
              child: MessagesNotesRow(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: height * 0.14,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.013),
                      child: const MessagesNotesScrollView(),
                    );
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: MessagesMessagesRow(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (BuildContext context, int index) {
                  return const MessagesChatsScrollView();
                },
              ),
            ),
          ],
        ));
  }
}
