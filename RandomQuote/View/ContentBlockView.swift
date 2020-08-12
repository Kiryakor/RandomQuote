//
//  ContentBlockView.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import SwiftUI

struct ContentBlockView: View {
    
    var quote:String
    var author:String
    
    var body: some View {
        VStack(spacing: 10) {
            Text(quote)
                .multilineTextAlignment(.leading)
            HStack{
                Spacer(minLength: 0)
                Text(author)
                    .fontWeight(.thin)
                    .font(.system(size: 15))
            }
        }
    }
}

struct ContentBlockView_Previews: PreviewProvider {
    static var previews: some View {
        ContentBlockView(quote: "За свою карьеру я пропустил более 9000 бросков, проиграл почти 300 игр. 26 раз мне доверяли сделать финальный победный бросок, и я промахивался. Я терпел поражения снова, и снова, и снова. И именно поэтому я добился успеха", author: "Майкл Джордан").previewLayout(.fixed(width: 400, height: 200))
    }
}
