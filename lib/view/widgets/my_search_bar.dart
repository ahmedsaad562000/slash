import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> with WidgetsBindingObserver {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    _focusNode.dispose();
    super.dispose();
  }

  void _unfocus() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _unfocus,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: double.maxFinite,
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: TextField(
                    focusNode: _focusNode,
                    showCursor: _focusNode.hasFocus,
                    cursorColor: const Color.fromARGB(255, 150, 150, 150),
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      floatingLabelAlignment: FloatingLabelAlignment.center,
                      prefixIcon: IconButton(
                        icon: const Icon(
                          Iconsax.search_normal_1_outline,
                          size: 20,
                          color: Color.fromARGB(255, 95, 95, 95),
                        ),
                        onPressed: () {},
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 228, 228, 228),
                      hintText: "Search here...",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(
                              color: const Color.fromARGB(255, 150, 150, 150)),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              AspectRatio(
                aspectRatio: 1,
                child: RawMaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 0,
                    fillColor: const Color.fromARGB(255, 228, 228, 228),
                    onPressed: () {},
                    child: Icon(
                      size: 20,
                      Icons.tune_rounded,
                      color: Theme.of(context).cardColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
