//
//  DataClass.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import Foundation

final class QuoteViewModel:ObservableObject{
    
    @Published var data:[quoteModel] = []
    @Published var save:[quoteModel] = []
    @Published var index:Int = 0
    
    func readData(){
        if let fileURL = Bundle.main.url(forResource: "Data", withExtension: "json"), let fileContents = try? Data(contentsOf: fileURL) {
            self.data = try! JSONDecoder().decode([quoteModel].self, from: fileContents)
        }
        
        let quote = UserDefaults.standard.object(forKey: "quote") as? [String] ?? [String]()
        let author = UserDefaults.standard.object(forKey: "author") as? [String] ?? [String]()
        self.save = []
        if quote.count == author.count{
            for i in 0..<quote.count{
                save.append(quoteModel(author: author[i], quote: quote[i]))
            }
        }
    }
    
    func randomIndex(){
        self.index = Int.random(in: 0..<data.count)
    }
    
    private init (){}
    
    static let share = QuoteViewModel()
    
    func saveData(){
        var quote:[String] = []
        var author:[String] = []
        
        save.forEach { (data) in
            quote.append(data.quote)
            author.append(data.author)
        }
        
        UserDefaults.standard.set(quote, forKey: "quote")
        UserDefaults.standard.set(author, forKey: "author")
    }
}
