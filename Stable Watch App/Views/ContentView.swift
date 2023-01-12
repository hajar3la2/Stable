//
//  ContentView.swift
//  Stable Watch App
//
//  Created by Hajar on 1/8/23.
//

import SwiftUI

//#if os(watchOS)
//struct NavigationView< Content: View >: View{
//    let content: () -> Content
//
//    init(@ViewBuilder content: @escaping () -> Content) {
//        self.content = content
//    }
//
//    var body: some View{
//        VStack(spacing: 0){
//            content()
//        }
//    }
//}
//#endif

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("Stable")
                        .fontWeight(.semibold)
                        .accessibilityLabel("add Stable")
                    Text("Monitor your glucose measurements and keep a healthy lifestyle from your apple watch")
                        .accessibilityLabel("Monitor your glucose measurements and keep a healthy lifestyle from your apple watch")
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom, .trailing])
                    
                    NavigationLink(destination: AddPage(), label: {
                        Text("Add +")
                    })
                    .accessibilityLabel("add button")
                    .cornerRadius(25)
                    
                    NavigationLink(destination: ThisWeekPage(), label: {
                        Text("Week Summary")
                    })
                    .accessibilityLabel("Week Summary")
                    .cornerRadius(25)
                    
                    NavigationLink(destination: HistoryPage(), label: {
                        Text("Record")
                    })
                    .accessibilityLabel("Record")
                    .cornerRadius(25)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
