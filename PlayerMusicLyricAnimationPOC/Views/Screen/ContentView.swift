//
//  ContentView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
	let music: Music
	@State private var count = 0
	let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
	@State private var scrollToId: Int = 0

    var body: some View {
		ZStack {
			LinearGradient(
				colors: [
					Color(red: 28/255, green: 28/255, blue: 28/255),
					Color(red: 43/255, green: 43/255, blue: 43/255),
					Color(red: 71/255, green: 71/255, blue: 71/255)],
				startPoint: .topLeading,
				endPoint: .bottomTrailing
			)
			.edgesIgnoringSafeArea(.all)

			VStack(alignment: .leading, spacing: 0) {
				HStack {
					Spacer()
					RoundedRectangle(cornerRadius: 10)
						.fill(Color.secondary)
						.frame(width: 43, height: 5.5)
					Spacer()
				}
				.padding(.bottom, 25)
				.padding(.top, 10)
				HeadBandView(music: music)
					.padding(.horizontal)

				ScrollViewReader { proxy in
					ScrollView(.vertical, showsIndicators: false) {
						VStack(alignment: .leading) {
							ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, row in
								Text(row)
									.id(index)
									.font(.largeTitle)
									.foregroundColor(.white.opacity(index == count ? 1 : 0.5))
									.fontDesign(.default)
									.fontWeight(.heavy)
									.multilineTextAlignment(.leading)
									.padding(.vertical, 15)
							}
							.onChange(of: self.scrollToId) { scrollId in
								withAnimation {
									proxy.scrollTo(scrollId)
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
					scrollToId += 1
					count += 1
				} else {
					scrollToId = 0
					count = 0
				}
			}
		}
    }
}

// MARK: Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(music: .musicSample)

    }
}
