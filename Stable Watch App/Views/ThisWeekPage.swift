//
//  ThisWeekPage.swift
//  Stable Watch App
//
//  Created by Hajar on 1/8/23.
//

import SwiftUI
import Charts
struct ValuePerCategory {
    var type: String
    var count: Double
}

struct ThisWeekPage: View {
    
    let data: [ValuePerCategory] = [
        .init(type: "Sun", count: 99),
        .init(type: "Mon", count: 127),
        .init(type: "Tue", count: 128),
        .init(type: "Wed", count: 130),
        .init(type: "Thu", count: 100),
        .init(type: "Fri", count: 99),
        .init(type: "Sat", count: 123),
    ]
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Content.measurement, ascending: true)], animation: .default) private var content: FetchedResults<Content>
    
//    @State var maxM = calcMaxM
//    @State var maxD = calcMaxD
//    @State var minM = calcMinM
//    @State var minD = calcMinD
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Average")
                        .fontWeight(.semibold)
                        .padding(.leading)
                    Spacer()
                }
                Chart(data, id: \.type) { item in
                    BarMark(
                        x: .value("type", item.type),
                        y: .value("count", item.count)
                    )
                }
                HStack{
                    Text("Maximum")
                        .fontWeight(.semibold)
                        .padding(.leading)
                    Spacer()
                }
                DataVieww(date: content[content.count-1].date!, result: content[content.count-1].measurement)
                HStack{
                    Text("Minimum")
                        .fontWeight(.semibold)
                        .padding(.leading)
                    Spacer()
                }
                DataVieww(date: content[0].date!, result: content[0].measurement)
            }
        }
    }
//    func calcMaxM() -> Int64{
//        return content[content.count-1].measurement
//    }
//    func calcMaxD() -> Date!{
//        return content[content.count-1].date
//    }
//    func calcMinM() -> Int64{
//        return content[0].measurement
//    }
//    func calcMinD() -> Date!{
//        return content[0].date
//    }
}




//struct DataView: View{
//
//    var date:String = "5 jan"
//    var timing:String = "now"
//    var result:Int = 120
//
//    var body: some View{
//        ZStack{
//            RoundedRectangle(cornerRadius: 10)
//                .fill(Color(red: 0.161, green: 0.161, blue: 0.165))
//                .frame(height: 53)
//            VStack{
//                HStack{
//                    Text(date)
//                        .font(.system(size: 12))
//                        .foregroundColor(Color(red: 0.6078431372549019, green: 0.6274509803921569, blue: 0.6666666666666666))
//                    Spacer()
//                    Text(timing)
//                        .font(.system(size: 12))
//                        .foregroundColor(Color(red: 0.6078431372549019, green: 0.6274509803921569, blue: 0.6666666666666666))
//                }
//                .padding(.horizontal)
//                HStack{
//                    Text("\(result) mg/dl")
//                        .padding(.leading)
//                    Spacer()
//                }
//            }
//            .padding()
//        }
//
//    }
//}







struct ThisWeekPage_Previews: PreviewProvider {
    static var previews: some View {
        ThisWeekPage()
    }
}
