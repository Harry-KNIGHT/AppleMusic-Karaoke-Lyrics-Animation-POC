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

