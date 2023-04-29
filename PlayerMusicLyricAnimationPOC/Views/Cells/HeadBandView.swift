//
//  HeadBandView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 29/04/2023.
//

import SwiftUI

struct HeadBandView: View {
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
		.foregroundColor(.white)
	}
}

struct HeadBandView_Previews: PreviewProvider {
    static var previews: some View {
		HeadBandView(music: .musicSample)
    }
}
