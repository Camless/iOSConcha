//
//  ContentView.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/14/22.
//

import SwiftUI

struct MainView: View {
	@State private var selectedValue: Double = 50.0
	
    var body: some View {
		VStack {
			Text("Please take this test")
				.font(.custom("Georgia", size: 24, relativeTo: .headline))
				.padding(.bottom, 50)
			
			Text("Current value: ")
				.padding(.bottom, 100)
			
			HStack {
				Slider(value: $selectedValue,
					   in: (0...50)
				)
				.rotationEffect(.degrees(-90))
				.frame(width: CGFloat(200))
			}
			.padding(.bottom, 100)
			
			Button(action: {
				
			}, label: {
				Text("Next")
					.bold()
					
			})
			.frame(width: 300, height: 15, alignment: .center)
			.padding()
			.background(Color.yellow)
			.foregroundColor(Color.black)
			.cornerRadius(30)
		}
		
		
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
			.previewDevice("iPhone 11 Pro")
    }
}
