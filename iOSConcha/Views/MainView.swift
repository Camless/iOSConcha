//
//  ContentView.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/14/22.
//

import SwiftUI

struct MainView: View {
	@State private var selectedValue: Double = 50.0
	@State private var activeStatus: Bool = false
	
    var body: some View {
		ZStack {
			Color("backgroundColor")
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				Text("Please take this test")
					.font(.custom("Georgia", size: 24, relativeTo: .headline))
					.padding(.bottom, 25)
					.padding(.top, 80)
				
				Text("Current value: \(selectedValue)")
					.padding(.bottom, 30)
				
				HStack {
					CustomSlider()
						.padding(.trailing, 60)
					VStack {
						Button(action: {
							
						}, label: {
							ValueOperatorButton(direction: .up, size: 40)
						})
						.padding(.bottom, 35)
						
						Button(action: {
							
						}, label: {
							ValueOperatorButton(direction: .down, size: 40)
						})
					}
				}
				.padding(.bottom, 20)
				.padding(.leading, 100)
				
				Button(action: {
					
				}, label: {
					NextButton(active: activeStatus)
				})
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
