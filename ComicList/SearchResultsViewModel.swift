//
//  SearchResultsViewModel.swift
//  ComicList
//
//  Created by Guillermo Gonzalez on 03/10/2016.
//  Copyright © 2016 Guillermo Gonzalez. All rights reserved.
//

import Foundation
import RxSwift

protocol SearchResultsViewModelType: class {

    /// The search query
    var query: String { get }

    /// Called after a new page of results has been loaded
    var didLoadPage: () -> Void { get set }

    /// The current number of search results
    var numberOfItems: Int { get }

    /// Returns the volume at a given position
    func item(at position: Int) -> Volume

    /// Loads the first page of results
    ///
    /// - parameter trigger: An observable that will trigger loading the next page
    ///
    /// - returns: An observable that will send the number of pages loaded
    func load(nextPage trigger: Observable<Void>) -> Observable<Int>
}

// FIXME: This is a mock implementation
final class SearchResultsViewModel: SearchResultsViewModelType {

    let query: String
    var didLoadPage: () -> Void = {}

    public var numberOfItems: Int {
        return items.count
    }

    public func item(at position: Int) -> Volume {
        precondition(position < numberOfItems)
        return items[position]
    }

    public func load(nextPage trigger: Observable<Void>) -> Observable<Int> {
        return doLoad(page: 1, nextPage: trigger)
    }

    private var items: [Volume] = []

    init(query: String) {
        self.query = query
    }

    private func doLoad(page current: Int, nextPage trigger: Observable<Void>) -> Observable<Int> {
        items.append(contentsOf: [
            Volume(identifier: 38656,
                   title: "Doctor Strange: The Oath",
                   coverURL: URL(string: "http://comicvine.gamespot.com/api/image/scale_small/1641291-ds__to.jpg"),
                   publisherName: "Marvel"),
            Volume(identifier: 67079,
                   title: "Age Of Ultron",
                   coverURL: URL(string: "http://comicvine.gamespot.com/api/image/scale_small/3816330-01.jpg"),
                   publisherName: "Marvel"),
            Volume(identifier: 39255,
                   title: "Thanos Imperative",
                   coverURL: URL(string: "http://comicvine.gamespot.com/api/image/scale_small/1704425-the_thanos_imperative_hc.jpg"),
                   publisherName: "Marvel")
        ])
        didLoadPage()

        return Observable.just(1)
    }
}
