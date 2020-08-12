//
//  Save.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import SwiftUI

struct SaveView: View {
    
    @ObservedObject var data:QuoteViewModel = QuoteViewModel.share
    
    var body: some View {
        NavigationView{
            List{
                ForEach(data.save, id: \.self) { (element) in
                    ContentBlockView(quote: element.quote, author: element.author)
                        .padding(.vertical,20)
                }
                .onDelete(perform: onDelete)
            }
            .padding(.trailing,20)
            .padding(.horizontal)
            .navigationBarTitle("Random Quote")
        }.onAppear{
            self.data.readData()
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        self.data.save.remove(atOffsets: offsets)
    }
}


struct Save_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            SaveView()
        }
    }
}
