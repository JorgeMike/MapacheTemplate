//
//  CalendarView.swift
//  MapacheTemplate
//
//  Created by CEDAM 13 on 16/04/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var currentDate = Date()
    let daysOfWeek = ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"]

    var body: some View {
        VStack {
            Text("Calendario")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading) // Alinea el texto a la izquierda
                .padding(.leading)

            HStack {
                Button(action: {
                    self.currentDate = Calendar.current.date(byAdding: .month, value: -1, to: currentDate)!
                }) {
                    Image(systemName: "chevron.left")
                }

                Text(monthYear(from: currentDate))
                    .font(.title2)
                
                Button(action: {
                    self.currentDate = Calendar.current.date(byAdding: .month, value: 1, to: currentDate)!
                }) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()

            HStack(spacing: 0) {
                ForEach(daysOfWeek, id: \.self) { day in
                    Text(day)
                        .frame(maxWidth: .infinity)
                }
            }

            let days = daysInMonth(currentDate)
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7)) {
                ForEach(0..<days.count, id: \.self) { index in
                    Text("\(days[index].0)")
                        .frame(width: 40, height: 40)
                        .background(Color.blue.opacity(days[index].1 ? 0.3 : 0.1))  // Ajusta la opacidad basada en si el día es del mes actual
                        .cornerRadius(5)
                }
            }

            Spacer()
        }.padding()
    }
    
    func monthYear(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.locale = Locale(identifier: "es") // Configura el locale a español
        return formatter.string(from: date)
    }
    
    func daysInMonth(_ date: Date) -> [(Int, Bool)] {
        let calendar = Calendar.current
        let range = calendar.range(of: .day, in: .month, for: date)!
        let components = calendar.dateComponents([.year, .month], from: date)
        let firstOfMonth = calendar.date(from: components)!
        let lastOfMonth = calendar.date(byAdding: DateComponents(month: 1, day: -1), to: firstOfMonth)!

        let startDayOfWeek = calendar.component(.weekday, from: firstOfMonth)
        let endDayOfWeek = calendar.component(.weekday, from: lastOfMonth)
        
        var days: [(Int, Bool)] = []
        
        if startDayOfWeek != 1 {
            let prevMonthDays = calendar.range(of: .day, in: .month, for: calendar.date(byAdding: .month, value: -1, to: date)!)!
            let numPrevDays = startDayOfWeek - 1
            days += (prevMonthDays.count - numPrevDays + 1...prevMonthDays.count).map { ($0, false) }
        }
        
        days += range.map { ($0, true) }
        
        if endDayOfWeek != 7 {
            let numNextDays = 7 - endDayOfWeek
            days += (1...numNextDays).map { ($0, false) }
        }
        
        return days
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
