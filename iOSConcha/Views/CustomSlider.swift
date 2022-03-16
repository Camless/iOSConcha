//
//  CustomSlider.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/14/22.
//

import Foundation
import SwiftUI

struct CustomSlider: View {
	@State private var yOffset: CGFloat = 14
	@State private var lastOffset: CGFloat = 0
	@State private var knobSize: CGFloat = 25
	
//	@Binding var value: Float
	
	let gradient = LinearGradient(gradient: Gradient(colors: [.yellow, .brown]), startPoint: .leading, endPoint: .trailing)
	
	var body: some View {
		
		ZStack {
			RoundedRectangle(cornerRadius: 20)
				.frame(width: 25)
				.foregroundColor(Color("inactiveSliderBackgroundColor"))
			VStack {
				Spacer()
				ZStack {
					Circle()
						.frame(width: knobSize + 30, height: knobSize + 30, alignment: .center)
						.foregroundColor(Color("knobBackgroundAccent"))
						.offset(y: self.yOffset)
					Circle()
						.frame(width: knobSize, height: knobSize, alignment: .center)
						.foregroundColor(.white)
						.offset(y: self.yOffset)
				}
			}
		}
		.frame(width: 25, height: 350, alignment: .center)
	}
}

struct CustomSlider_Previews: PreviewProvider {
	static var previews: some View {
		CustomSlider()
	}
}
