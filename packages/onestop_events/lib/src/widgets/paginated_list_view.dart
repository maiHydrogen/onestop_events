import 'package:flutter/material.dart';
import 'package:onestop_ui/index.dart';

/// A generic, reusable list widget that handles infinite scroll / lazy loading.
///
/// Attach it to any paginated data source by providing:
/// - [itemCount]: total currently-loaded items.
/// - [itemBuilder]: builds each item widget at the given index.
/// - [onLoadMore]: callback fired when the user scrolls near the bottom.
///   Add your BLoC's `LoadMore` event here.
/// - [isLoadingMore]: whether a next-page fetch is in progress.
///   Shows a bottom spinner while true.
/// - [hasReachedMax]: when true, scroll-to-bottom no longer fires [onLoadMore].
/// - [padding]: optional padding around the list.
/// - [scrollThreshold]: how far from the bottom (0.0–1.0) to trigger load.
///   Defaults to 0.9 (90% of the list scrolled).
class PaginatedListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final VoidCallback onLoadMore;
  final bool isLoadingMore;
  final bool hasReachedMax;
  final EdgeInsetsGeometry? padding;
  final double scrollThreshold;

  const PaginatedListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onLoadMore,
    this.isLoadingMore = false,
    this.hasReachedMax = false,
    this.padding,
    this.scrollThreshold = 0.9,
  });

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    if (widget.hasReachedMax || widget.isLoadingMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;

    if (maxScroll > 0 && currentScroll / maxScroll >= widget.scrollThreshold) {
      widget.onLoadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: widget.padding,
      // +1 to accommodate the bottom loader / end-of-list indicator
      itemCount: widget.itemCount + 1,
      itemBuilder: (context, index) {
        // Last item: show loader or end indicator
        if (index == widget.itemCount) {
          if (widget.isLoadingMore) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: CircularProgressIndicator(
                  color: OColor.green600,
                  strokeWidth: 2.5,
                ),
              ),
            );
          }
          if (widget.hasReachedMax && widget.itemCount > 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: OText(
                  text: "You're all caught up!",
                  style: OTextStyle.bodySmall
                      .copyWith(color: OColor.gray500),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }

        return widget.itemBuilder(context, index);
      },
    );
  }
}
