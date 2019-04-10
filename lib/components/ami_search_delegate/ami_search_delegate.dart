import 'package:flutter/material.dart';

class AmiSearchDelegate extends SearchDelegate<String> {
  final List<String> _data = <String>[
    "Facebook, Inc.",
    "Facebook, Inc., Investment Arm",
    "fbFund, L.P.",
    "Facebook Global Holdings II, LLC",
    "Facebook India Online Services Private Limited"
  ];
  final List<String> _history = <String>[
    'facebook',
    'google',
    'apple',
    'microsoft',
    'amazon'
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme;
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<String> suggestions = query.isEmpty ? _history : _data;

    return _SuggestionList(
      query: query,
      suggestions: suggestions,
      onSelected: (String suggestion) {
        this.close(context, suggestion);
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    this.close(context, query);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return query.isEmpty
        ? []
        : [
            IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            ),
          ];
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style:
                  theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}
