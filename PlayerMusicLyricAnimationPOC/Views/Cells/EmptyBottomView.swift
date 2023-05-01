//
//  EmptyBottomView.swift
//  PlayerMusicLyricAnimationPOC
//
//  Created by Elliot Knight on 01/05/2023.
//

import SwiftUI

struct EmptyBottomView: View {
    var body: some View {
        Rectangle()
			.frame(maxWidth: .infinity, minHeight: 2000)
			.foregroundColor(Color.red)
			.opacity(0)
    }
}

struct EmptyBottomView_Previews: PreviewProvider {
    static var previews: some View {
		EmptyBottomView()
    }
}
