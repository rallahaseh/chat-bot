//
//  DataFetcher.swift
//  ChatBot
//
//  Created by Rashed Al-Lahaseh on 03/11/2023.
//

import Foundation
import Combine

class DataFetcher: ObservableObject {
    // A subject to signal changes in the fetched data.
    var didChange = PassthroughSubject<Data, Never>()
    
    // A cancellable object to manage the data task publisher.
    private var cancellable: AnyCancellable?
    
    // The fetched data.
    private var data: Data = Data() {
        didSet {
            didChange.send(data)
        }
    }
    
    // Initialize the data fetcher with a URL to fetch data from.
    init(from url: URL?) {
        // Check if the URL is valid.
        guard let dataURL = url else { return }
        
        // Set up a data task publisher and assign it to the cancellable.
        cancellable = URLSession.shared.dataTaskPublisher(for: dataURL)
            .map(\.data)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in },
                  receiveValue: { [weak self] data in
                // Update the data and notify subscribers.
                self?.data = data
            })
    }
}
