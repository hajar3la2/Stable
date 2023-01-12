//
//  AddPage.swift
//  Stable Watch App
//
//  Created by Hajar on 1/9/23.
//

import SwiftUI

struct AddPage: View {
    
    
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
//    @State private var amount:Int = 0
    
    @State private var selection :Int = 0
    
    
    var body: some View {
        VStack{
            HStack{
                Text(getDateToday())
                    .font(.system(size: 16))
            }
            .accessibilityValue(getDateToday())
            Picker(selection: $selection, label: Text(""),content:{
                ForEach(25..<700){
                    number in
                    Text("\(number)")
                        .tag("\(number)")
                }
            })
//            .accessibilityValue(selection)
            .frame(width: 70 , height: 85)
            .labelsHidden()
            
            
            Button("Save"){
                DataController().addMeasurement(amount: selection, context: managedObjectContext)
                dismiss()
            }
            .padding(.top)
            .accessibilityLabel("Save button")
        }
    }
    

}
//            Text("You selected: \(selection)")



struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}
