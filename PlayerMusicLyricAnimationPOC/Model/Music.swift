//
//  Music.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 29/04/2023.
//

import Foundation

// MARK: - Music model

struct Music: Identifiable, Hashable {
	var id: String { title }
	let artist: String
	let cover: String
	let title: String
	let lyrics: [String]
}

// MARK: Music data

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
