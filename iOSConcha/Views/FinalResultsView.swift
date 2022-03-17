//
//  FinalResultsView.swift
//  iOSConcha
//
//  Created by Carlos Morales III on 3/15/22.
//

import SwiftUI

struct FinalResultsView: View {
	let entries: [UserEntry]
	
    var body: some View {
		NavigationView {
			VStack {
				Text("Slider Results")
					.font(.custom("Georgia", size: 24, relativeTo: .headline))
					.padding(.bottom, 15)
				
				List(entries) { entry in
					EntryRow(entry: entry)
						.listRowSeparator(.hidden)
						.frame(height: 8)
				}
				.listStyle(.inset)
				.frame(width: 300, height: 90, alignment: .center)
				.environment(\.defaultMinListRowHeight, 5)
				
				NavigationLink(destination: MainView(viewModel: MainViewModel()).navigationBarHidden(true),
							   label: { Text("START OVER")
										.font(.caption)
										.bold()
										.frame(width: 300, height: 15, alignment: .center)
										.padding()
										.background(Color("activeButtonColor"))
										.foregroundColor(Color.black)
										.cornerRadius(30)
				})
			}
			.padding(.bottom, 50)
		}
    }
}

struct FinalResultsView_Previews: PreviewProvider {
    static var previews: some View {
		let entries = [UserEntry(sliderNumber: 1, tickIndex: 0, tickValue: -78), UserEntry(sliderNumber: 2, tickIndex: 2, tickValue: -68), UserEntry(sliderNumber: 3, tickIndex: 5, tickValue: -50)]
		FinalResultsView(entries: entries)
			.previewDevice("iPhone 11 Pro")
    }
}
