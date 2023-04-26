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

    var body: some View {
		ScrollView(showsIndicators: false) {
			VStack(alignment: .center) {
				HStack(alignment: .center) {
					Image(music.cover)
						.resizable()
						.scaledToFit()
						.frame(height: 80)
						.cornerRadius(10)
						.shadow(radius: 10)
					VStack(alignment: .leading, spacing: 3) {
						Text(music.title)
							.imageScale(.large)
							.font(.title2)
							.fontWeight(.semibold)
						Text(music.artist)
							.opacity(0.8)
					}
					.padding(.leading, 8)
					Spacer()
					Image(systemName: "ellipsis.circle.fill")
						.font(.title2)
				}
				ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, row in
					Text(row)
						.font(.title)
						.foregroundColor(index == count ? .red : .black)
						.fontDesign(.rounded)
						.fontWeight(.heavy)
						.multilineTextAlignment(.center)
						.padding(.vertical, 7)
				}
			}
			.padding()
		}
		.onReceive(timer) { _ in
			if count < music.lyrics.count - 1 {
				count += 1
			} else {
				count = 0
			}
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		ContentView(music: .musicSample)

    }
}


struct Music: Identifiable, Hashable {
	var id: String { title }
	let artist: String
	let cover: String
	let title: String
	let lyrics: [String]
}

extension Music {
	static let musicSample: Music = Music(
		artist: "Eminem",
		cover: "eminemCover",
		title: "The Real Slim Shady",
		lyrics:
			[
				"May I have your attention, please ?",
				"May I have your attention, please ?\n Will the real Slim Shady please stand up ?",
				"I repeat, will the real Slim Shady please stand up ?",
				"We're gonna have a problem here...",
				"May I have your attention, please ?",
				"May I have your attention, please ?\n Will the real Slim Shady please stand up ?",
				"I repeat, will the real Slim Shady please stand up ?",
				"We're gonna have a problem here..."
			]
	)
}



