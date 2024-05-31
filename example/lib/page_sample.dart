import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

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
                  breakpoints: Breakpoints(colXs: 12, colSm: 12, colMd: 12, colLg: 12, colXl: 12, colXxl: 12),
                  child: Container(
                    color: Colors.yellow,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text("Responsive Container"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.greenAccent,
              child: const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text('Container Fluid', style: TextStyle(fontSize: 24.0),),
                    ),
                    ResponsiveContainer(
                      mode: ContainerMode.containerFluid,
                      children: [
                        ResponsiveColumn(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Card(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dictum varius justo quis porta. Nullam sit amet sodales lectus. Vivamus mattis odio eu urna ultrices porta. Nulla lectus arcu, tristique id augue malesuada, pellentesque viverra mauris. Vestibulum nec ipsum at est tincidunt tincidunt. Suspendisse feugiat dignissim justo, in tincidunt nulla laoreet et. Aenean odio quam, condimentum ac ante a, interdum bibendum nulla. In cursus lobortis interdum. Duis vehicula neque vitae turpis mollis, vitae convallis tortor interdum. Proin est leo, feugiat ac iaculis ut, fermentum in est. Maecenas nec tempus neque. Vestibulum consequat orci at tincidunt pulvinar. Praesent molestie ex eget libero tincidunt faucibus. Vestibulum malesuada porta ante et malesuada."),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ResponsiveColumn(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Card(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text("Curabitur consequat interdum tincidunt. Cras ac augue magna. Maecenas ipsum tortor, placerat sed diam non, mollis commodo metus. In aliquet nec odio vitae efficitur. Etiam ut malesuada nisl, et posuere odio. Fusce sed ultricies ex. Suspendisse consectetur rhoncus magna ac eleifend. Nullam tristique vehicula luctus. Ut magna augue, cursus eu elit condimentum, dapibus tristique dui."),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ResponsiveColumn(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Card(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text("Donec posuere maximus tellus, varius elementum justo fringilla quis. Aliquam in nisi augue. Fusce quis rutrum massa. Nullam volutpat ex tortor, eget blandit nunc lacinia sed. Nulla facilisi. Praesent cursus sodales felis eu bibendum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ResponsiveColumn(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            child: Card(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text("Etiam cursus ante nunc, et consequat elit vestibulum nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor lobortis est, et blandit ex posuere et. Fusce lectus turpis, tempus a erat nec, dapibus eleifend lectus. Integer iaculis ac nisl in iaculis. Nulla eget maximus odio. Proin quis lectus at lorem ullamcorper rutrum. Cras et diam at diam viverra lobortis in eu nisl. Nam placerat luctus felis sit amet tempor. Curabitur at tortor non risus iaculis viverra."),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ResponsiveContainer(
                    mode: ContainerMode.container,
                    color: Colors.lightBlueAccent,
                    children: [
                      ResponsiveColumn(
                        breakpoints: Breakpoints(colXs: 12),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text('Container', style: TextStyle(fontSize: 24.0),),
                          ),
                        ),
                      ),
                      const ResponsiveColumn(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dictum varius justo quis porta. Nullam sit amet sodales lectus. Vivamus mattis odio eu urna ultrices porta. Nulla lectus arcu, tristique id augue malesuada, pellentesque viverra mauris. Vestibulum nec ipsum at est tincidunt tincidunt. Suspendisse feugiat dignissim justo, in tincidunt nulla laoreet et. Aenean odio quam, condimentum ac ante a, interdum bibendum nulla. In cursus lobortis interdum. Duis vehicula neque vitae turpis mollis, vitae convallis tortor interdum. Proin est leo, feugiat ac iaculis ut, fermentum in est. Maecenas nec tempus neque. Vestibulum consequat orci at tincidunt pulvinar. Praesent molestie ex eget libero tincidunt faucibus. Vestibulum malesuada porta ante et malesuada."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ResponsiveColumn(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Curabitur consequat interdum tincidunt. Cras ac augue magna. Maecenas ipsum tortor, placerat sed diam non, mollis commodo metus. In aliquet nec odio vitae efficitur. Etiam ut malesuada nisl, et posuere odio. Fusce sed ultricies ex. Suspendisse consectetur rhoncus magna ac eleifend. Nullam tristique vehicula luctus. Ut magna augue, cursus eu elit condimentum, dapibus tristique dui."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ResponsiveColumn(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Donec posuere maximus tellus, varius elementum justo fringilla quis. Aliquam in nisi augue. Fusce quis rutrum massa. Nullam volutpat ex tortor, eget blandit nunc lacinia sed. Nulla facilisi. Praesent cursus sodales felis eu bibendum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus."),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const ResponsiveColumn(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          child: Card(
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20.0),
                                child: Text("Etiam cursus ante nunc, et consequat elit vestibulum nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor lobortis est, et blandit ex posuere et. Fusce lectus turpis, tempus a erat nec, dapibus eleifend lectus. Integer iaculis ac nisl in iaculis. Nulla eget maximus odio. Proin quis lectus at lorem ullamcorper rutrum. Cras et diam at diam viverra lobortis in eu nisl. Nam placerat luctus felis sit amet tempor. Curabitur at tortor non risus iaculis viverra."),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
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
    return Card(child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(child: Text(title)),
    ));
  }
}

