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
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

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
					ScrollView(.vertical, showsIndicators: false) {
						VStack(alignment: .leading) {
							ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, lyric in
								Text(lyric)
									.id(index)
									.font(.largeTitle)
									.foregroundColor(.white.opacity(index == count ? 1 : 0.5))
									.blur(radius: index == count ? 0 : 1)
									.fontDesign(.default)
									.fontWeight(.heavy)
									.multilineTextAlignment(.leading)
									.padding(.vertical, 15)
							}
							.onChange(of: self.count) { count in
								withAnimation {
									proxy.scrollTo(count, anchor: .top)
								}
							}

							CopyrightView(music: music)
						}
					}
					.padding(.horizontal, 20)
				}
			}
			.edgesIgnoringSafeArea(.bottom)
			.onReceive(timer) { _ in
				if count < music.lyrics.count - 1 {
					count += 1
				} else {
					count = music.lyrics.startIndex
				}
			}
		}
	}
}

// MARK: Preview

struct LyricsPlayerView_Previews: PreviewProvider {
	static var previews: some View {
		LyricsPlayerView(music: .musicSample)

	}
}
