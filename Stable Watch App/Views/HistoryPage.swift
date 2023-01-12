//
//  HistoryPage.swift
//  Stable Watch App
//
//  Created by Hajar on 1/8/23.
//

import SwiftUI
import CoreData

struct HistoryPage: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext

    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Content.date, ascending: false)], animation: .default) private var content: FetchedResults<Content>
    
    
    
    var body: some View {
        ScrollView {
            VStack{
//                HStack{
//                    Text("Today")
//                        .fontWeight(.semibold)
//                        .padding(.leading)
//                    Spacer()
//                }
                    ForEach(content){content in
                        DataVieww(date: content.date!, result: content.measurement)
//                            .swipeActions{
//                            Button(role: .destructive){
//                            } label: {
//                                Label("Delete", systemImage: "trash.circle")
//                            }
//                        }
                    }
                    .onDelete(perform: deleteMeasurement)
                    .listStyle(.plain)
                }
               
        }.onAppear {
            print(content.count)
        }
    }
    private func deleteMeasurement(offsets: IndexSet){
        withAnimation{
            offsets.map{
                content[$0]
            }.forEach(managedObjectContext.delete)
            DataController().save(context: managedObjectContext)
        }
    }

}







struct DataVieww: View{
    
     var date: Date
//     var dateF = DateFormatter()
     var result:Int64
    
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.161, green: 0.161, blue: 0.165))
                .frame(height: 53)
            VStack{
                HStack{
                    Text(getDate(theDate: date))
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.6078431372549019, green: 0.6274509803921569, blue: 0.6666666666666666))
                        .accessibilityLabel("date")
                        .accessibilityValue(getDate(theDate: date))
                    Spacer()
//                    Text(timingF.string(from: timing))
                    Text(date, style: .time)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 0.6078431372549019, green: 0.6274509803921569, blue: 0.6666666666666666)).accessibilityLabel("time")
                        .accessibilityValue(Text(date, style: .time))
                }
                .padding(.horizontal)
                HStack{
                    Text("\(result) mg/dl ")
                        .padding(.leading)
                        .accessibilityLabel("measurement")
                        .accessibilityValue(Text("\(result)"+" mg/dl"))
                    Spacer()
                }
            }
            .padding()
        }
        
        
    }
}






//struct DataViewButton: View{
//
//    var date:String = "5 jan"
//    var timing:String = "now"
//    var result:Int = 120
//
//    var body: some View{
//        Button{
//
//        } label: {
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
//        }
//    }
//}




struct HistoryPage_Previews: PreviewProvider {
    static var previews: some View {
        HistoryPage()
    }
}
