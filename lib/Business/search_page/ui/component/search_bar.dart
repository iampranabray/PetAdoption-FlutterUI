import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchTagWidget extends StatefulWidget {
  const SearchTagWidget(
      {Key? key,
      required this.onChangeAction,
      this.onClear,
      required this.tagFlag})
      : super(key: key);
  final Function(String) onChangeAction;
  final Function()? onClear;

  final bool tagFlag;

  @override
  _SearchTagWidgetState createState() => _SearchTagWidgetState();
}

class _SearchTagWidgetState extends State<SearchTagWidget> {
  late TextEditingController controller;

  late String? dbValues;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        height: 38,
        decoration: BoxDecoration(
          color: themeData.colorScheme.surface,
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
        ),
        //padding: Spacing.all(6),
        child: Row(children: <Widget>[
          widget.tagFlag
              ? Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 32,
                    width: 32,
                    child: IconButton(
                        iconSize: 16,
                        onPressed: () async {},
                        icon: const Icon(CupertinoIcons.search)),
                  ),
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                left: 16,
              ),
              child: TextField(
                controller: controller,
                autocorrect: false,
                onChanged: (str) {
                  // _searchText = str;
                  widget.onChangeAction(str);
                  setState(() {});
                },
                decoration: const InputDecoration(
                  hintText: "Search",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8,
                      ),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        8,
                      ),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.all(0),
                ),
                textInputAction: TextInputAction.search,
                textCapitalization: TextCapitalization.sentences,
              ),
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          controller.text.isEmpty || controller.text == ""
              ? const SizedBox.shrink()
              : Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    child: Container(
                      height: 28,
                      width: 28,
                      child: IconButton(
                          iconSize: 14,
                          // style: IconButtonStyle.filledTonalIconButtonStyle(
                          //     themeData: themeData),
                          onPressed: () {
                            controller.clear();
                            // controller!.text = "";
                            widget.onChangeAction("");
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.clear,
                          )),
                    ),
                  ))
        ]));
  }
}
