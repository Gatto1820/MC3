//
//  MessageBubble.swift
//  MC3
//
//  Created by Francesco Merola on 21/02/23.
//

import SwiftUI

struct MessageBubble: View {
    
    var message: Message
    
    var body: some View {
        VStack (alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .foregroundColor(.black)
                    .padding()
                    .background(message.received ? Color("LeftBubbleColor") : Color("RightBubbleColor"))
                    .cornerRadius(30)
                    .overlay (alignment: message.received ? .bottomLeading : .bottomTrailing) {
                        Image (systemName: "arrowtriangle.down.fill")
                            .font(.title)
                            .rotationEffect(.degrees(message.received ? 45 : -45))
                            .offset(x: message.received ? -10 : 10, y: 10)
                            .foregroundColor(message.received ? Color("LeftBubbleColor") : Color("RightBubbleColor"))
                    }
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
        }
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(text: "Hello", received: false))
    }
}
