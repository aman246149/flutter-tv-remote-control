# flutter-tv-remote-control

![image](https://user-images.githubusercontent.com/53884276/174712691-728d0e8c-c5f5-4f1e-b73c-2da96981a78c.png)

## To control app you only need these five button  Left,Right,Top,Bottom and center for select

### Basic thing to control TV remote button (You can achive this by using ShortCuts and focus)
- You need shortCut keys widget -- to determine different Intent (Like select Intent) 
-  Select Intent is enough to control the remote 
  
``` Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.select): ActivateIntent(),
        // LogicalKeySet(LogicalKeyboardKey.enter): SelectIntent()
      },
      child: MaterialApp(
        title: 'Flutter Demo',
``` 
- Last thing you need focus so that your tv remote knows where to click -- For This we use a widget which have autoFocus property
```
   return ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  autofocus: true,    //here is autofocus
                  focusColor: Colors.green,
                  onTap: () {
                    print(index);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Details(
                              key: Key(index.toString()),
                              data: state.todos[index].title.toString()),
                        ));
                  },
 ```
 - ![image](https://user-images.githubusercontent.com/53884276/174714294-9531b572-b5bf-4e0d-975f-66b9c4dc3596.png)

 
 _______________________________________________________________________________________________________________________________________________________
 ##  If you want to perform any specific task from these four keys that is also very simple  
 - visit this link to see the example to perform specific button task
  https://github.com/aman246149/flutter-tv-remote-control/blob/master/mysample/lib/main.dart 
  
  source -https://api.flutter.dev/flutter/widgets/FocusNode-class.html
  
  - Similar thing can be achieve by using ShortCut widget ,Actions Widget and Focus Widget  and combination of all three widget is FocusDetectorWidget
