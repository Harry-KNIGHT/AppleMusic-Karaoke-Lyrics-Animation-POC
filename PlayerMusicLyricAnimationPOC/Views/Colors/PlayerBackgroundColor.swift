//
//  PlayerBackgroundColor.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 29/04/2023.
//

import SwiftUI

struct PlayerBackgroundColor: View {
    var body: some View {
		LinearGradient(
			colors: [
				Color(red: 28/255, green: 28/255, blue: 28/255),
				Color(red: 43/255, green: 43/255, blue: 43/255),
				Color(red: 71/255, green: 71/255, blue: 71/255)],
			startPoint: .topLeading,
			endPoint: .bottomTrailing
		)
    }
}

struct PlayerBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBackgroundColor()
			.previewLayout(.sizeThatFits)
    }
}
