import SwiftUI

struct CallView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isMuted: Bool = false
    
    let agoraManager = AgoraManager.shared
    
    var body: some View {
        VStack {
            Text("Welcome to the call!")
                .bold()
            Spacer()
            HStack {
                Image(systemName: "mic.circle.fill")
                    .font(.system(size: 64.0))
                    .foregroundColor(isMuted ? Color.yellow : Color.blue)
                    .padding()
                    .onTapGesture {
                        isMuted.toggle()
                        agoraManager.mute(value: isMuted)
                    }
                
                Spacer()
                
                Image(systemName: "phone.circle.fill")
                    .font(.system(size: 64.0))
                    .foregroundColor(.red)
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
            }
            .padding()
        }
        .onAppear {
            agoraManager.initializeAgoraEngine()
            agoraManager.joinChannel()
        }
        .onDisappear {
            agoraManager.leaveChannel()
        }
    }
}

struct CallView_Previews: PreviewProvider {
    static var previews: some View {
        CallView()
            .previewLayout(.device)
            .previewDevice("iPhone 12 Pro")
    }
}
