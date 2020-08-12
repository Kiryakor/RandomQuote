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
    }
    
    func randomIndex(){
        self.index = Int.random(in: 0..<data.count)
    }
    
    private init (){}
    
    static let share = QuoteViewModel()
}
