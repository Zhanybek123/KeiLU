//
//  ContentView.swift
//  KeiLU
//
//  Created by zhanybek salgarin on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    @State var selectedMonth = 0
    
    var body: some View {
        VStack{
            Image("myFace")
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipShape(.capsule)
            
            Text("Marco Luciano")
                .font(.title)
                .bold()
            
            Rectangle()
                .frame(height: 1)
            
            Text("Select day")
                .font(.title2)
                .bold()
            
            HStack{
                Button {
                    print("something")
                } label: {
                    Image(systemName: "lessthan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 28)
                }
                
                Text("January 2024")
                    .font(.title2)
                    .padding([.leading, .trailing], 20)
                
                Button {
                    print("something")
                } label: {
                    Image(systemName: "greaterthan")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 16, height: 28)
                }
            }
            HStack {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(5)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 6), content: {
                ForEach(fetchDates()) { value in
                    Text("\(value.day)")
                }
            })
        }
    }
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        let datesOfMonth = currentMonth.datesOfTheMonth().map ({ CalendarDate(day: calendar.component(.day, from: $0), date: $0)})
        return datesOfMonth
    }
    
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        guard let month = month else { return Date()}
        return month
    }
}

struct CalendarDate: Identifiable {
    let id = UUID()
    let day: Int
    let date: Date
}

#Preview {
    ContentView()
}


extension Date {
    func datesOfTheMonth() -> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        var startDateComponents = DateComponents()
        startDateComponents.year = currentYear
        startDateComponents.month = currentMonth
        startDateComponents.day = 1
        let startDate = calendar.date(from: startDateComponents)!
        
        var endDateComponents = DateComponents()
        endDateComponents.month = 1
        endDateComponents.day = -1
        let endDate = calendar.date(byAdding: endDateComponents, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}
