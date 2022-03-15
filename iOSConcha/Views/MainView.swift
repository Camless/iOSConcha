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
		ZStack {
			Color("backgroundColor")
				.edgesIgnoringSafeArea(.all)
			VStack {
				Text("Please take this test")
					.font(.custom("Georgia", size: 24, relativeTo: .headline))
					.padding(.bottom, 25)
					.padding(.top, 150)
				
				Text("Current value: \(selectedValue)")
					.padding(.bottom, 30)
				
				HStack {
					CustomSlider()
						.padding(.trailing, 80)
						.padding(.leading, 100)
					VStack {
						Button(action: {
							
						}, label: {
							Circle()
								.frame(width: 35, height: 35, alignment: .center)
								.foregroundColor(Color("circleButtonColor"))
								.overlay(Text(Image(systemName: "chevron.up"))
									.bold()
									.foregroundColor(.yellow))
								
						})
						.padding(.bottom, 35)
						
						Button(action: {
							
						}, label: {
							Circle()
								.frame(width: 35, height: 35, alignment: .center)
								.foregroundColor(Color("circleButtonColor"))
								.overlay(Text(Image(systemName: "chevron.down"))
									.bold()
									.foregroundColor(.yellow))
						})
					}
				}
				.padding(.bottom, 20)
				
				Button(action: {
					
				}, label: {
					Text("Next")
						.bold()
						
				})
				.frame(width: 300, height: 15, alignment: .center)
				.padding()
				.background(Color("activeButtonColor"))
				.foregroundColor(Color.black)
				.cornerRadius(30)
			}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
		MainView()
			.previewDevice("iPhone 11 Pro")
    }
}
