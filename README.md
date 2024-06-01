
# Responsive Container

**responsive_container** is a package to create responsive layouts in flutter projects.
Thinked to handle responsive layouts in Flutter web projects, it works for any platform.

**Inspired to [Bootstrap](https://getbootstrap.com) framework**

Try at [demo on DartPad](https://dartpad.dev/?id=adc568d0883ec002c51c25945649391a)

## Getting Started
Follow these steps to use this package

### Add dependency

```yaml  
dependencies:  
	responsive_container: ^1.0.0  
```  

### Add import package

```dart  
import 'package:responsive_container/responsive_container.dart';  
```  

### Easy to use
Simple example of use ResponsiveContainer
Put this code in your project and learn how it works 😊

```dart  
  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(children: [
      ResponsiveColumn(
        child: const Card(child: Center(child: Text('box 1'))),
      ),
      ResponsiveColumn(
        child: const Card(child: Center(child: Text('box 2'))),
      ),
      ResponsiveColumn(
        child: const Card(child: Center(child: Text('box 3'))),
      ),
      ResponsiveColumn(
        child: const Card(child: Center(child: Text('box 4'))),
      ),
    ]);
  }
```  

#### ResponsiveContainer
ResponsiveContainer is the basic layout element.
Default grid system is setted to 12 columns but you can override cols number using **layoutColumns** parameter.
You can also modify **mode** parameter to choose container width:
* Use ContainerMode.container to set max-width at each responsive breakpoint;
* Use ContainerMode.containerFluid set width at 100% at each breakpoints.

##### ContainerMode.container  breakpoint width size
|	xs 		 |	sm		  |	md		   |	lg		    |	xl		    |	xxl			|
|-----------|-----------|-----------|-----------|-----------|-------------|		
|	100% 	|	540px	|	720px	|	960px	|	1140px	|	1320px	|	


Default breakpoint sizes for every ResponsiveColumn are:
| breakpoint 			| identifier 	| columns 	|
|-----------------------|---------------|-----------|
| Extra Small			| xs 			| 12 		|
| Small		 			| sm 			| 12 		|
| Medium	 			| md 			| 6 		|
| Large		 			| lg 			| 6 		|
| Extra Large			| xl 			| 3 		|
| Extra extra Large 	| xxl 			| 3 		|

Following describing breakpoints:
| breakpoint 	| dimensions	|
----------------|---------------|
| xs 			| <576px		|
| sm 			| ≥576px 		|
| md 			| ≥768px 		|
| lg 			| ≥992px 		|
| xl 			| ≥1200px 		|
| xxl 			| ≥1400px 		|

## Contributions
All contributions are welcome!  
Contributions are what make the open source community such an amazing place to be learned, inspire, and create. Any contributions you make are greatly appreciated.