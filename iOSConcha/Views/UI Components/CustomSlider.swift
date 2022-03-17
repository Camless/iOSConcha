//
//  CustomSlider.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/14/22.
//

import SwiftUI

struct CustomSlider: View {
	@ObservedObject var viewModel: CustomSliderViewModel
	let gradient = LinearGradient(gradient: Gradient(colors: [.brown, .yellow]), startPoint: .bottom, endPoint: .top)
	let containerHeight: CGFloat = 360
	let containerWidth: CGFloat = 25
	let containerRadius: CGFloat = 20
	
	var body: some View {
			ZStack {
				ZStack {
					RoundedRectangle(cornerRadius: containerRadius)
						.frame(width: containerWidth)
						.foregroundColor(Color("inactiveSliderBackgroundColor"))
						.overlay(TickLineCapsule(color: .black)
						.clipShape(RoundedRectangle(cornerRadius: containerRadius)))
					VStack {
						Spacer()
						RoundedRectangle(cornerRadius: 20)
							.fill(gradient)
							.frame(width: containerWidth, height: containerHeight - viewModel.yPosition - viewModel.knobSize / 2)
							.overlay(TickLineCapsule(color: .white)
							.clipShape(RoundedRectangle(cornerRadius: containerRadius)))
					}
				}
				VStack {
					Spacer()
					ZStack {
						Circle()
							.frame(width: viewModel.knobBackgroundSize, height: viewModel.knobBackgroundSize, alignment: .center)
							.foregroundColor(Color("knobBackgroundAccent"))
							.position(x: viewModel.xPosition, y: viewModel.yPosition)
						Circle()
							.frame(width: viewModel.knobSize, height: viewModel.knobSize, alignment: .center)
							.foregroundColor(.white)
							.position(x: viewModel.xPosition, y: viewModel.yPosition)
					}
				}
			}
			.frame(width: containerWidth, height: containerHeight, alignment: .center)
	}
}

struct CustomSlider_Previews: PreviewProvider {
	static var previews: some View {
		CustomSlider(viewModel: CustomSliderViewModel())
	}
}
