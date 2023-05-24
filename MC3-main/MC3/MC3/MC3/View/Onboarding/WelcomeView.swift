import SwiftUI

struct HalfCircleShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = rect.width / 2
        let startAngle = Angle(degrees: 150)
        let endAngle = Angle(degrees: 32)
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        return path
    }
}

struct WelcomeView: View {
    
    var body: some View {
        ZStack {
            HalfCircleShape()
            
                .fill(LinearGradient(gradient: Gradient(colors: [(Color("WelcomeColor")), .black]), startPoint: .top, endPoint: .bottom))                    .frame(width: 390, height: 370)
            
            
            Circle()
                .frame(width: 400,height: 340)
                .foregroundColor(.black)
            
            HalfCircleShape()
                .fill(LinearGradient(gradient: Gradient(colors: [(Color("WelcomeColor")), .black]), startPoint: .top, endPoint: .bottom))                .frame(width: 330, height: 290)
            
            Circle()
                .frame(width: 800,height: 280)
                .foregroundColor(.black)
            
            
            HalfCircleShape()
                .fill(LinearGradient(gradient: Gradient(colors: [(Color("WelcomeColor")), .black]), startPoint: .top, endPoint: .bottom))
                .frame(width: 270, height: 250)
            
            Circle()
                .frame(width: 750,height: 210)
                .foregroundColor(.black)
            
            
            
            VStack
            {
                Text(NSLocalizedString("Welcome", comment: ""))
                    .font(.title)
                    .offset(y:150)
                    .foregroundColor(Color("WelcomeColor"))
                    .fontWeight(.heavy)
                .frame (width: 600, height: 50)}
        }
        
    }
    
}



struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
