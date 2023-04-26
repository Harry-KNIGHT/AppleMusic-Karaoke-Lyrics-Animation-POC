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
				HeadBandMusic(music: music)
					.padding(.horizontal)

				ScrollView(.vertical, showsIndicators: false) {
					VStack(alignment: .leading, spacing: 15) {
						ForEach(Array(music.lyrics.enumerated()), id: \.0) { index, row in
							Text(row)
								.font(.largeTitle)
								.foregroundColor(index == count ? .white : .secondary)
								.fontDesign(.default)
								.fontWeight(.heavy)
								.multilineTextAlignment(.leading)
								.padding(.vertical, 7)
						}
					}
				}
				.padding(.horizontal, 20)
			}
			.edgesIgnoringSafeArea(.bottom)
			.onReceive(timer) { _ in
				if count < music.lyrics.count - 1 {
					count += 1
				} else {
					count = 0
				}
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
				"May I have your attention, please ?",
				"Will the real Slim Shady please stand up ?",
				"I repeat, will the real Slim Shady please stand up ?",
				"We're gonna have a problem here...",
				"May I have your attention, please ?",
				"May I have your attention, please ?",
				"Will the real Slim Shady please stand up ?",
				"I repeat, will the real Slim Shady please stand up ?",
				"We're gonna have a problem here..."
			]
	)
}


struct HeadBandMusic: View {
	let music: Music
	var body: some View {
		HStack(alignment: .center) {
			Image(music.cover)
				.resizable()
				.scaledToFit()
				.frame(height: 65)
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
	}
}
