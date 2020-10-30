# SwiftUIProjects

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

 ## FaveFlicks

 - Data Flow in SwiftUI: ObservableObject, @Published, @State, @Binding, @StateObject, @EnvironmentObject, @ObservedObject

 <image src="images/dataflow.png"></image>

 ## TaskList
<p float="left">
 <image src="images/tasklist.png" height="300"></image>
 <image src="images/addtask.png" height="300"></image>
</p>
 - Data Flow in SwiftUI

 - Extension of ForEach, IndexedCollection, Binding for resolve array element binding/indexing in SwiftUI

 Reference link: 

 [Understanding Data Flow in SwiftUI](https://www.raywenderlich.com/11781349-understanding-data-flow-in-swiftui)


