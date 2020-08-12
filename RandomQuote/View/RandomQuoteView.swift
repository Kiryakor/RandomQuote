//
//  RandomQuoteView.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import SwiftUI

struct RandomQuoteView: View {
    
    @State var quote:String = ""
    @State var author:String = ""
    @ObservedObject var data:QuoteViewModel = QuoteViewModel.share
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                ContentBlockView(quote: quote, author: author)
                Spacer()
                HStack(spacing: 70){
                    Button(action: {
                        self.saveData()
                    }, label: {
                        Text("Save")
                    })
                    
                    Button(action: {
                        (self.quote,self.author) = self.data.updateText()
                    }, label: {
                        Text("Next")
                    })
                }.padding(.bottom,50)
            }
            .padding(.horizontal,35)
            .onAppear{
                self.data.readData()
                (self.quote,self.author) = self.data.updateText()
            }
            .navigationBarTitle("Random Quote")
        }
    }
    
    func saveData(){
        var check = true
        for i in self.data.save{
            if i.quote == self.quote{
                check = false
                break
            }
        }
        if check{
            self.data.save.insert(quoteModel(author: self.author, quote: self.quote), at: 0)
        }
    }
}

struct RandomQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            RandomQuoteView()
        }
    }
}
