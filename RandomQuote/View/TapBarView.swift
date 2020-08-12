//
//  ContentView.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import SwiftUI

struct TapBarView: View {
    
    @State var presentRandomQuote:Bool = false
    
    var body: some View {
        TabView{
            RandomQuoteView().tabItem {
                Image(systemName: "list.dash")
                Text("Цитаты")
            }
            SaveView().tabItem {
                Image(systemName: "list.dash")
                Text("Избранное")
            }.onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("not active")
            }
        }
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        TapBarView()
    }
}
