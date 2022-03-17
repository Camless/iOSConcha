//
//  TickLineCapsule.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/16/22.
//

import SwiftUI

struct TickLineCapsule: View {
	@State var color: Color
	
	var body: some View {
		Path { path in
			for y in stride(from: 10, through: 345, by: 23) {
				path.move(to: CGPoint(x: 0, y: y))
				path.addLine(to: CGPoint(x: 25, y: y))
			}
		}
		.stroke(color, lineWidth: 1)
	}
}

struct TickLineCapsule_Previews: PreviewProvider {
    static var previews: some View {
		TickLineCapsule(color: .black)
    }
}
