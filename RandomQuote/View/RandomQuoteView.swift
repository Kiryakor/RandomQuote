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
                        if self.data.index > 0{
                            self.data.index -= 1
                            self.updateData()
                        }
                    }, label: {
                        Image("next")
                            .foregroundColor(Color.black)
                            .rotationEffect(Angle(degrees: 180))
                    })
                    Button(action: {
                        self.saveData()
                    }, label: {
                        Image("save")
                        .foregroundColor(Color.black)
                    })
                    Button(action: {
                        if self.data.index < self.data.data.count - 1{
                            self.data.index += 1
                            self.updateData()
                        }
                    }, label: {
                        Image("next")
                            .foregroundColor(Color.black)
                    })
                }.padding(.bottom,50)
            }
            .padding(.horizontal,35)
            .onAppear{
                self.updateData()
            }
            .navigationBarTitle("Великие цитаты")
        }
    }
    
    private func saveData(){
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
    
    private func updateData(){
        self.quote = self.data.data[self.data.index].quote
        self.author = self.data.data[self.data.index].author
    }
}

struct RandomQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        TabView{
            RandomQuoteView()
        }
    }
}
