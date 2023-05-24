//
//  LyricsPlayerView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 25/04/2023.
//

import SwiftUI

struct LyricsPlayerView: View {
    let music: Music
    @State private var count = 0
    @State private var isChangingLyric: Bool = false

    //The idea is to assign to each lyrics a boolean which values are toggled
    //successively with a delay and an animation duration by a function.
    @State private var animToggleArray: [Bool] = [false, false, false, false, false, false, false, false, false, false, false, false, false]

    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

    var body: some View {
        
        ZStack {
            PlayerBackgroundColor()
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 0) {
                SheetIslandView()
                    .padding(.bottom, 25)
                    .padding(.top, 10)
                HeadBandView(music: music)
                    .padding(.horizontal)

                ScrollViewReader { proxy in
                    ScrollView(.vertical, showsIndicators: true) {
                        VStack(alignment: .leading) {
                            ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, lyric in
                                Text(lyric)
                                    .id(index)
                                    .scaleEffect(index == count ? 1.1 : 1)
                                
//Basic animation. Note that the ternary refers to the [Bool].
                                    .scaleEffect(animToggleArray[index] && index != count ? 1.06 : 1)

                                    .font(.largeTitle)
                                    .foregroundColor(.white.opacity(index == count ? 1 : 0.5))
                                    .blur(radius: index == count ? 0 : 1)
//                                    .fontDesign(.default)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.leading)
                                    .padding(.vertical, 15)
//                                    .animation(
//
//                                        .interpolatingSpring(
//                                            stiffness: animToggleArray[index] && index != count ? 200 : 0,
//                                            damping: 10,
//                                            initialVelocity: 20
//                                        )
//                                    )
                                    
                                    
                                }
                            .offset(y: isChangingLyric ? 35 : 60)
                            .onChange(of: self.count) { count in
                                withAnimation {
                                isChangingLyric = false
                                    
//The function that handles the animation is called whenever count changes.
                                delayLyrics(count)
                                    
                               proxy.scrollTo(count, anchor: .top)
                                
                            }
                        }
                            
                            EmptyBottomView(music: music)
                        }
                        .padding(.horizontal, 20)
                    }
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .onReceive(timer) { _ in
                if count < music.lyrics.count - 1 {
                    isChangingLyric = true
                    count += 1
                } else {
                    isChangingLyric.toggle()
                    count = music.lyrics.startIndex
                
                }
            }
        }
    }

//DispatchQueue is used to delay the booleans value changes in animToggleArray.
    func delayLyrics(_ count: Int) {
        func delayLyric(_ cpt: Int) {
            let interval = 0.3
            let duration = 0.6
            DispatchQueue.main.asyncAfter(deadline: .now() + CGFloat(cpt - count) * interval) {
                withAnimation(.easeInOut(duration: duration)){
                    self.animToggleArray[cpt].toggle()
                }
            }
            self.animToggleArray[cpt].toggle()
        }
       
//Only 5 lyrics after the focused ones are changed.
        for cpt in count...(count+5<music.lyrics.count ? count+5 : music.lyrics.count-1) {
            delayLyric(cpt);
        }
        
    }
}

// MARK: Preview

struct LyricsPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsPlayerView(music: .musicSample)

    }
}
