//
//  EmptyBottomView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 01/05/2023.
//

import SwiftUI

struct EmptyBottomView: View {
	let music: Music
    var body: some View {
		ZStack(alignment: .topLeading) {
			Rectangle()
				.frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.size.height)
				.foregroundColor(Color.red)
				.opacity(0)
			CopyrightView(music: music)
				.offset(y: 50)
		}
    }
}

struct EmptyBottomView_Previews: PreviewProvider {
    static var previews: some View {
		EmptyBottomView(music:  .musicSample)
    }
}
