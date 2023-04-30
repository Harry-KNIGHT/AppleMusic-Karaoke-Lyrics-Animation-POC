//
//  CopyrightView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 29/04/2023.
//

import SwiftUI

struct CopyrightView: View {
	let music: Music
    var body: some View {
		VStack(alignment: .leading, spacing: 5) {
			HStack(alignment: .bottom) {
				Text("Written By:")
					.fontWeight(.bold)

				Text("Marshall Mathers,")
					.font(.title2)
					.fontWeight(.semibold)
			}
			Text(music.artist)
		}
		.font(.title2)
		.foregroundColor(.secondary)
    }
}

struct CopyrightView_Previews: PreviewProvider {
    static var previews: some View {
		CopyrightView(music: .musicSample)
			.previewLayout(.sizeThatFits)
    }
}
