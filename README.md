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

 - Data Flow in SwiftUI: @State, @Binding, @StateObject, @EnvironmentObject, @ObservedObject

 <image src="images/dataflow.png"></image>

 Reference link: 

 [Understanding Data Flow in SwiftUI](https://www.raywenderlich.com/11781349-understanding-data-flow-in-swiftui)


