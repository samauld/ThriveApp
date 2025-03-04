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
            if !dateRetrieved {
                Image("scheduler").resizable()
                    .frame(width: 200, height: 200)
                    .offset(x: 10, y: -30)
                Text("Adam's Schedule").font(.largeTitle)
                RKViewController(isPresented: self.$singleIsPresented, rkManager: self.rkManager1)
                Button(action: {self.getTextFromDate(date: self.rkManager1.selectedDate)}) {
                    Text("Edit")
                        .foregroundColor(.white)
                        .font(.title)
                        .frame(minWidth: 0, maxWidth: 100)
                        .padding()
                        .background(LinearGradient(gradient: Gradient(colors: [Color("ThriveBlue"), Color(red: 3/255, green: 161/255, blue: 235/255)]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(40)
                }
            }
            else {
                ScheduleDayView(selectedDate: pickedDate)
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
        rkManager1.colors.monthHeaderColor = Color.blue
        rkManager1.colors.weekdayHeaderColor = Color.blue
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        self.pickedDate = date == nil ? "" : formatter.string(from: date)
        self.dateRetrieved = true
        return date == nil ? "" : formatter.string(from: date)
    }
    
}


struct ScheduleCal_Previews : PreviewProvider {
    static var previews: some View {
        ScheduleCal()
    }
}
