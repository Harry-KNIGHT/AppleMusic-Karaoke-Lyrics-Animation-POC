//
//  SheetIslandView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 29/04/2023.
//

import SwiftUI

struct SheetIslandView: View {
    var body: some View {
		HStack {
			Spacer()
			RoundedRectangle(cornerRadius: 10)
				.fill(Color.secondary)
				.frame(width: 43, height: 5.5)
			Spacer()
		}
    }
}

struct SheetIslandView_Previews: PreviewProvider {
    static var previews: some View {
        SheetIslandView()
			.previewLayout(.sizeThatFits)
    }
}
