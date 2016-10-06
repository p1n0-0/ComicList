//
//  SearchSuggestionsViewModel.swift
//  ComicList
//
//  Created by Guillermo Gonzalez on 29/09/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import RxSwift

/// Fetches suggestions for a given search query
protocol SearchSuggestionsViewModelType: class {

    /// The search query
    var query: Variable<String> { get }

    /// The search suggestions
    var suggestions: Observable<[String]> { get }
}

// FIXME: This is a mock implementation
final class SearchSuggestionsViewModel: SearchSuggestionsViewModelType {

    let query = Variable("")

    private(set) lazy var suggestions: Observable<[String]> = self.query.asObservable()
        .throttle(0.3, scheduler: MainScheduler.instance)
        .map {
            $0.characters.split(separator: " ").map { String($0) }
        }
}
