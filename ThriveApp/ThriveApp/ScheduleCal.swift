//
//  Calendar.swift
//  ThriveApp
//
//  Created by Katherine Griffin on 4/5/20.
//  Used RKCalendar content: Created by Raffi Kian on 7/14/19.
//  Copyright © 2020 Katherine Griffin. All rights reserved.
//
import SwiftUI

struct ScheduleCal : View {
    
    @State var singleIsPresented = false
    @State var startIsPresented = false
    @State var multipleIsPresented = false
    @State var deselectedIsPresented = false
    @State var pickedDate = ""
    @State var dateRetrieved = false;
    

    
    var rkManager1 = RKManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    var body: some View {
        VStack (spacing: 25) {
            Image("scheduler").resizable()
            .frame(width: 200, height: 200)
                .offset(x: 10, y: -30)
            Text("Adam's Schedule").font(.largeTitle)
            RKViewController(isPresented: self.$singleIsPresented, rkManager: self.rkManager1)
            Button(action: {self.getTextFromDate(date: self.rkManager1.selectedDate)}) {
                    Text("Edit")
            .foregroundColor(.blue)
            .font(.title)
            .padding()
            .border(Color.blue, width: 5)
            }.sheet(isPresented: self.$dateRetrieved){
                    
                ScheduleDayView(selectedDate: self.pickedDate)
                  
            }
        }.onAppear(perform: startUp)
            .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    func datesView(dates: [Date]) -> some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(dates, id: \.self) { date in
                    Text(self.getTextFromDate(date: date))
                }
            }
        }.padding(.horizontal, 15)
    }
 
    func startUp() {
        let testOnDates = [Date().addingTimeInterval(60*60*24), Date().addingTimeInterval(60*60*24*2)]
        rkManager1.colors.monthHeaderColor = Color.blue
        rkManager1.colors.weekdayHeaderColor = Color.blue
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        pickedDate = date == nil ? "" : formatter.string(from: date)
        self.dateRetrieved = true
        return date == nil ? "" : formatter.string(from: date)
    }

}


struct ScheduleCal_Previews : PreviewProvider {
    static var previews: some View {
        ScheduleCal()
    }
}
