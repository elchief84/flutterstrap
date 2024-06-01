import 'package:flutter/material.dart';
import 'package:flutterstrap_ui/flutterstrap.dart';

class PageSample extends StatefulWidget {
  const PageSample({super.key});

  @override
  State<PageSample> createState() => _PageSampleState();
}

class _PageSampleState extends State<PageSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            ResponsiveContainer(
              children: [
                ResponsiveColumn(
                  breakpoints: Breakpoints(colSm: 12, colLg: 6, colXxl: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://picsum.photos/2000?image=10'),
                  ),
                ),
                ResponsiveColumn(
                  breakpoints: Breakpoints(colSm: 12, colLg: 6, colXxl: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://picsum.photos/2000?image=20'),
                  ),
                ),
                ResponsiveColumn(
                  breakpoints: Breakpoints(colSm: 12, colLg: 6, colXxl: 4),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://picsum.photos/2000?image=30'),
                  ),
                ),
                ResponsiveColumn(
                  breakpoints: Breakpoints(colSm: 12, colLg: 6, colXxl: 2),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://picsum.photos/2000?image=40'),
                  ),
                ),
              ],
            ),
            ResponsiveContainer(
              children: [
                ResponsiveColumn(
                    breakpoints: Breakpoints(colLg: 12, colXxl: 6),
                    child: ResponsiveColumn(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                            Image.network('https://picsum.photos/2000?image=1'),
                      ),
                    )),
                ResponsiveColumn(
                  breakpoints: Breakpoints(colLg: 12, colXxl: 6),
                  child: ResponsiveContainer(
                    children: [
                      ResponsiveColumn(
                        breakpoints: Breakpoints(colLg: 12, colXxl: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://picsum.photos/2000?image=10'),
                        ),
                      ),
                      ResponsiveColumn(
                        breakpoints: Breakpoints(colLg: 12, colXxl: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://picsum.photos/2000?image=20'),
                        ),
                      ),
                      ResponsiveColumn(
                        breakpoints: Breakpoints(colSm: 12, colXxl: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://picsum.photos/2000?image=30'),
                        ),
                      ),
                      ResponsiveColumn(
                        breakpoints: Breakpoints(colSm: 12, colXxl: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              'https://picsum.photos/2000?image=40'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ResponsiveItem extends StatelessWidget {
  final String title;
  const ResponsiveItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text(title)),
    ));
  }
}
