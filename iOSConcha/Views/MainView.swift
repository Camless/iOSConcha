//
//  ContentView.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/14/22.
//

import SwiftUI

struct MainView: View {
	@StateObject var viewModel: MainViewModel
	@StateObject var slideViewModel = CustomSliderViewModel()
	@State var presentingResults = false
	
    var body: some View {
		ZStack {
			Color("backgroundColor")
				.edgesIgnoringSafeArea(.all)
			
			VStack {
				Text("Please take this test")
					.font(.custom("Georgia", size: 24, relativeTo: .headline))
					.padding(.bottom, 25)
					.padding(.top, 80)
				
				Text("Current value: \(String(format: "%.2f", viewModel.fetchCurrentTickValue()))")
					.padding(.bottom, 30)
				
				HStack {
					CustomSlider(viewModel: slideViewModel)
						.padding(.trailing, 60)
					VStack {
						Button(action: {
							viewModel.incrementTick()
							slideViewModel.increaseKnobPosition()
						}, label: {
							ValueOperatorButton(direction: .up, size: 40)
						})
						.padding(.bottom, 35)
						
						Button(action: {
							viewModel.decrementTick()
							slideViewModel.decreaseKnobPosition()
						}, label: {
							ValueOperatorButton(direction: .down, size: 40)
						})
					}
				}
				.padding(.bottom, 20)
				.padding(.leading, 100)
				
				Button(action: {
					Task {
						if await viewModel.submitNextButton() {
							presentingResults.toggle()
						}
					}
				}, label: {
					if viewModel.currentTick >= 0 {
						NextButton(active: true)
					} else {
						NextButton(active: false)
					}
				}).fullScreenCover(isPresented: $presentingResults) {
					FinalResultsView.init(entries: viewModel.userEntries)
				}
			}
		}
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
		let viewModel = MainViewModel()
		MainView(viewModel: viewModel)
			.previewDevice("iPhone 11 Pro")
			.environment(\.dynamicTypeSize, .xSmall)
		
		MainView(viewModel: viewModel)
			.previewDevice("iPhone 11 Pro")
		
		MainView(viewModel: viewModel)
			.previewDevice("iPhone 11 Pro")
			.environment(\.dynamicTypeSize, .xxxLarge)
	}
}
