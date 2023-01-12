//
//  AddPage.swift
//  Stable Watch App
//
//  Created by Hajar on 1/9/23.
//

import SwiftUI
import UserNotifications

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
                
                //requesting permission for notification
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { (success, error) in
                    if success{
                        print("All set for requesting notification permission in save button")
                    } else if let error = error {
                        print("a problem in requesting notification permission in save button \(error.localizedDescription)")
                    }
                }
                
                //schedule notification
                let content = UNMutableNotificationContent()
                content.title = "Reminder"
                content.subtitle = "you have 10 sec"
                content.sound = .default
                content.categoryIdentifier = "myCategory"
                let category = UNNotificationCategory(identifier: "myCategory", actions: [], intentIdentifiers: [], options: [])
                UNUserNotificationCenter.current().setNotificationCategories([category])
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
                let request = UNNotificationRequest(identifier: "milk", content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error) in
                    if let error = error{
                        print(error.localizedDescription)
                    }else{
                        print("scheduled successfully")
                    }
                }
                
            }
            .padding(.top)
            .accessibilityLabel("Save button")
        }
    }
}


struct NotificationView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Text("Your last measurement was abnormal, please check again?")
    }
}




struct AddPage_Previews: PreviewProvider {
    static var previews: some View {
        AddPage()
    }
}
