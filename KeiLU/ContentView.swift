//
//  ContentView.swift
//  KeiLU
//
//  Created by zhanybek salgarin on 1/5/24.
//

import SwiftUI

struct ContentView: View {
    let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    @State var selectedMonth = 0
    @State var selectedDate = Date()
    @State var availableTime: [String] = ["8am - 9am", "9am - 10am", "10am - 11am", "11am - 12pm", "12pm - 1pm"]
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 8) {
                    HStack {
                        Image("myFace")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 150)
                            .clipShape(.capsule)
                            .padding(2)
                        Text("Marco Luciano")
                            .font(.title)
                            .bold()
                    }
                    
                    Rectangle()
                        .frame(height: 1)
                    
                    Text("Select day")
                        .font(.title3)
                        .bold()
                    
                    HStack{
                        Button {
                            withAnimation {
                                selectedMonth -= 1
                            }
                        } label: {
                            Image(systemName: "lessthan")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 18)
                        }
                        
                        Text(selectedDate.monthAndYear())
                            .font(.title3)
                            .padding([.leading, .trailing], 10)
                        
                        Button {
                            withAnimation {
                                selectedMonth += 1
                            }
                        } label: {
                            Image(systemName: "greaterthan")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 16, height: 18)
                        }
                    }
                    HStack {
                        ForEach(days, id: \.self) { day in
                            Text(day)
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .padding(5)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), content: {
                        ForEach(fetchDates()) { value in
                            if value.day != -1 {
                                Text("\(value.day)")
                                    .padding(5)
                                    .background {
                                        ZStack(alignment: .bottom) {
                                            Circle()
                                                .frame(width: 35, height: 35)
                                                .foregroundStyle(value.day % 2 != 0 ? Color("Main") : .clear)
                                            if value.date.toString() == Date().toString() {
                                                Circle()
                                                    .frame(width: 7, height:  7)
                                                    .foregroundStyle(.black)
                                            }
                                        }
                                    }
                            } else {
                                Text("")
                            }
                        }
                    })
                    Rectangle()
                        .frame(height: 1)
                    
                    VStack(spacing: 30) {
                        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2), content: {
                            ForEach(availableTime, id: \.self) { time in
                                NavigationLink {
                                    EmptyView()
                                } label: {
                                    Capsule()
                                        .fill(Color("Main")).opacity(0.2)
                                        .frame(width: 150, height: 50)
                                        .overlay {
                                            Text(time)
                                        }
                                }
                            }
                        })
                        NavigationLink {
                            EmptyView()
                        } label: {
                            Text("Select time")
                                .padding()
                                .background {
                                    Capsule()
                                        .stroke()
                                }
                        }
                    }
                    Spacer()
                }
                .onChange(of: selectedMonth) {
                    selectedDate = fetchSelectedMonth()
                }
            }
        }
    }
    
    func fetchDates() -> [CalendarDate] {
        let calendar = Calendar.current
        let currentMonth = fetchSelectedMonth()
        var datesOfMonth = currentMonth.datesOfTheMonth().map ({ CalendarDate(day: calendar.component(.day, from: $0), date: $0)})
        let firstDayOfWeek = calendar.component(.weekday, from: datesOfMonth.first?.date ?? Date())
        for _ in 0..<firstDayOfWeek - 1 {
            datesOfMonth.insert(CalendarDate(day: -1, date: Date()), at: 0)
        }
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
    func toString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/DD/YYYY"
        return formatter.string(from: self)
    }
    
    func monthAndYear() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM YYYY"
        return formatter.string(from: self)
    }
    
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
