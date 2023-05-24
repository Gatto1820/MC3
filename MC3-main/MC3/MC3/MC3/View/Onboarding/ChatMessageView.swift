////
////  ChatMessageView.swift
////  MC3
////
////  Created by Francesco Merola on 21/02/23.
////
//
//import SwiftUI
//
//struct ChatMessageView: View {
//    
//    let message: ChatMessage
//    
//    var body: some View {
//        
//        HStack {
//            Text(message.message)
//                .padding()
//                .background(.blue)
//                .foregroundColor(.white)
//                .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
//                .listRowSeparator(.hidden)
//                .overlay (alignment: message.direction == .left ? .bottomLeading : .bottomTrailing) {
//                    Image (systemName: "arrowtriangle.down.fill")
//                        .font(.title)
//                        .rotationEffect(.degrees(message.direction == .left ? 45 : -45))
//                        .offset(x: message.direction == .left ? -10 : 10, y: 10)
//                        .foregroundColor(.blue)
//                }
//                .frame(maxWidth: 300, alignment: message.direction == .left ?  .leading: .trailing)
//        }
//    }
//}
//
//struct ChatMessageView_Previews: PreviewProvider {
//    
//    static let message: ChatMessage = ChatMessage(message: "Hello", direction: .right)
//    
//    static var previews: some View {
//        ChatMessageView(message: message)
//    }
//}
