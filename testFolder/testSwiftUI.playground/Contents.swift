//: A UIKit based Playground for presenting user interface
  
//import UIKit
//import PlaygroundSupport
//
//class MyViewController : UIViewController {
//    override func loadView() {
//        let view = UIView()
//        view.backgroundColor = .white
//
//        let label = UILabel()
//        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
//        label.text = "Hello World!"
//        label.textColor = .black
//
//        view.addSubview(label)
//        self.view = view
//    }
//}
//// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

//UIKit 지우고 SwiftUI로 바꾸어 보기
import PlaygroundSupport
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("My first SwiftUI on playground")
    }
}
//PlaygroundPage.current.liveView = UIHostingController(rootView: ContentView())     //플레이그라운드의 라이브 뷰를 해당 구조체로 변경
PlaygroundPage.current.setLiveView(ContentView())   //iOS13 부터 가능
