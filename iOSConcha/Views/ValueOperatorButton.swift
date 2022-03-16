//
//  IncrementDecrementButton.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/15/22.
//

import SwiftUI

enum ButtonDirection {
	case up
	case down
}


struct ValueOperatorButton: View {
	@State var direction: ButtonDirection
	@State var size: CGFloat
	
    var body: some View {
		if direction == .up {
			Circle()
				.frame(width: size, height: size, alignment: .center)
				.foregroundColor(Color("circleButtonColor"))
				.overlay(Text(Image(systemName: "chevron.up"))
					.bold()
					.bold()
					.foregroundColor(.yellow))
		} else {
			Circle()
				.frame(width: size, height: size, alignment: .center)
				.foregroundColor(Color("circleButtonColor"))
				.overlay(Text(Image(systemName: "chevron.down"))
					.bold()
					.bold()
					.foregroundColor(.yellow))
		}
    }
}

struct ValueOperatorButton_Previews: PreviewProvider {
    static var previews: some View {
		ValueOperatorButton(direction: .down, size: 50)
    }
}
