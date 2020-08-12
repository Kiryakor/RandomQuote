//
//  DataClass.swift
//  RandomQuote
//
//  Created by Кирилл on 12.08.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import Foundation

final class DataClass:ObservableObject{
    @Published var data:[dataQuote] = []
    @Published var save:[dataQuote] = []
    
    func readData(){
        if let fileURL = Bundle.main.url(forResource: "Data", withExtension: "json"), let fileContents = try? Data(contentsOf: fileURL) {
            self.data = try! JSONDecoder().decode([dataQuote].self, from: fileContents)
        }
    }
    
    func updateText() -> (String,String){
        let randomIndex:Int = Int.random(in: 0..<data.count)
        let quote = data[randomIndex].quote
        let author = data[randomIndex].author
        return (quote,author)
    }
    
    private init (){}
    
    static let share = DataClass()
}
