//
//  FeedUIIntegrationTests+FeedImageDataLoaderSpy.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 13/09/2025.
//

import UIKit
import CleanArchitecture
import CleanArchitectureiOS
import Combine

extension FeedUIIntegrationTests {
    class LoaderSpy: FeedImageDataLoader {
        
        //MARK: Feed Loader
        
        private var feedRequests = [PassthroughSubject<[FeedImage], Error>]()
        
        var loadFeedCallCount: Int {
            feedRequests.count
        }
        
        func loadPublisher() -> AnyPublisher<[FeedImage], Error> {
            let publisher = PassthroughSubject<[FeedImage], Error>()
            feedRequests.append(publisher)
            return publisher.eraseToAnyPublisher()
        }
        
        func completeFeedLoading(with feed: [FeedImage] = [],  at index: Int = 0) {
            feedRequests[index].send(feed)
        }
        
        func completeFeedLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "any error", code: 0)
            feedRequests[index].send(completion: .failure(error))
        }
        
        //MARK: Feed Image Data Loader
        
        private struct Task: FeedImageDataLoaderTask {
            let callback: () -> Void
            
            func cancel() {
                callback()
            }
        }
        private var imageRequests = [(url: URL, completion: (FeedImageDataLoader.Result) -> Void)]()
        
        var loadedImageURLs: [URL] {
            imageRequests.map { $0.url }
        }
        private(set) var cancelledImageURLs = [URL]()
        
        func loadImageData(from url: URL, completion: @escaping (FeedImageDataLoader.Result) -> Void) -> FeedImageDataLoaderTask {
            imageRequests.append((url, completion))
            return Task { [weak self] in
                self?.cancelledImageURLs.append(url)}
        }
        
        func completeImageLoading(with imageData: Data = Data(), at index: Int = 0) {
            imageRequests[index].completion(.success(imageData))
        }
        
        func completeImageLoadingWithError(at index: Int = 0) {
            let error = NSError(domain: "any error", code: 0)
            imageRequests[index].completion(.failure(error))
        }
    }
}
