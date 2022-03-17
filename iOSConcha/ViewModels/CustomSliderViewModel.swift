//
//  CustomSliderViewModel.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/16/22.
//

import Foundation
import SwiftUI

class CustomSliderViewModel: ObservableObject {
	@Published var knobSize: CGFloat = 25
	@Published var knobBackgroundSize: CGFloat = 55
	@Published var yPosition: CGFloat = 345
	@Published var xPosition: CGFloat = 12.5
	let yMaxPosition: CGFloat = 345
	let yMinPosition: CGFloat = 0
	
	
	public func increaseKnobPosition() {
		if yPosition - 23 >= yMinPosition {
			yPosition -= 23
		}
	}
	
	public func decreaseKnobPosition() {
		if yPosition + 23 <= yMaxPosition {
			yPosition += 23
		}
	}
}
