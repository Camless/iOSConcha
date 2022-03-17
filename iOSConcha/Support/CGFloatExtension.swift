//
//  CGFloatExtension.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/16/22.
//

import SwiftUI

extension CGFloat {
	func map(from: ClosedRange<CGFloat>, to: ClosedRange<CGFloat>) -> CGFloat {
		let result = ((self - from.lowerBound) / (from.upperBound - from.lowerBound)) * (to.upperBound - to.lowerBound) + to.lowerBound
		return result
	}
}
