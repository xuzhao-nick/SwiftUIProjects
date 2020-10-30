# SwiftUI Projects

 ## BullsEye
 - The usage of modifier

```
...
modifier(ButtonStyle())
...
struct ButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .background(Image("Button"))
            .modifier(Shadow())
    }
}
```

<image src="images/bullseye.png" width="500"></image>
<br><br>
<image src="images/bullseye1.png" width="500"></image>

 ## FaveFlicks

- Data Flow in SwiftUI: ObservableObject, @Published, @State, @Binding, @StateObject, @EnvironmentObject, @ObservedObject
<p float="left">
<image src="images/faveflicks.png" height="300"></image>
<image src="images/faveflicks2.png" height="300"></image>
<image src="images/faveflicks3.png" height="300"></image>
</p>
 
 <image src="images/dataflow.png"></image>

 ## TaskList
 - Extension of ForEach, IndexedCollection, Binding for resolve array element binding/indexing in SwiftUI
<p float="left">
 <image src="images/tasklist.png" height="300"></image>
 <image src="images/addtask.png" height="300"></image>
</p>

 
 Reference link: 

 [Understanding Data Flow in SwiftUI](https://www.raywenderlich.com/11781349-understanding-data-flow-in-swiftui)


