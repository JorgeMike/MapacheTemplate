import SwiftUI

struct PieSliceData {
    var startAngle: Angle
    var endAngle: Angle
    var color: Color
}

struct PieChartSlice: Shape {
    let data: PieSliceData

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        path.move(to: center)
        path.addArc(center: center,
                    radius: radius,
                    startAngle: data.startAngle,
                    endAngle: data.endAngle,
                    clockwise: false)
        path.closeSubpath()

        return path
    }
}

struct PieChart: View {
    var slices: [PieSliceData]

    var body: some View {
        ZStack {
            ForEach(0..<slices.count) { index in
                PieChartSlice(data: slices[index])
                    .fill(slices[index].color)
            }
        }
    }
}

struct PieChartView: View {
    var body: some View {
        PieChart(slices: [
            PieSliceData(startAngle: .degrees(0), endAngle: .degrees(100), color: .red),
            PieSliceData(startAngle: .degrees(100), endAngle: .degrees(150), color: .green),
            PieSliceData(startAngle: .degrees(150), endAngle: .degrees(360), color: .blue)
        ])
        .frame(width: 200, height: 200)
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
