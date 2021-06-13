//
//  PhotoAlbumTests.swift
//  PhotoAlbumTests
//
//  Created by Biswajyoti Sahu on 11/06/21.
//

import XCTest
@testable import PhotoAlbum

class AlbumListViewModelTests: XCTestCase {

    private var viewModel: AlbumListViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }
    
    private class AlbumServiceSuccessSpy: AlbumService {
        
        func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ()) {
            
            let album = Album(title: "test")
            completionHandler(.success([album]))
        }
    }
    
    private class AlbumServiceFailureSpy: AlbumService {
        
        func getAlbumList(_ completionHandler: @escaping (Result<[Album], Error>) -> ()) {
            
            let error = NSError(domain: "domain", code: 400, userInfo: nil)
            completionHandler(.failure(error))
        }
    }

    private class ViewControllerSpy: AlbumListDisplayLogic {
        
        var displayAlbumListCalled = false
        var displayServerErrorCalled = false
        
        func displayAlbumList(withTitle titleText: String, data: [AlbumListCellViewData]) {
            
            displayAlbumListCalled = true
        }
        
        func displayServerError() {
            
            displayServerErrorCalled = true
        }
    }
    
    func testFetchAlbumListSuccess() {
        
        // Given
        let service = AlbumServiceSuccessSpy()
        viewModel = AlbumListViewModel(albumService: service)
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // WHen
        viewModel.fetchAlbumList()
        
        // Then
        XCTAssertTrue(viewController.displayAlbumListCalled, "displayAlbumListCalled should be called")
    }
    
    func testFetchAlbumListFailure() {
        
        // Given
        let service = AlbumServiceFailureSpy()
        viewModel = AlbumListViewModel(albumService: service)
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // WHen
        viewModel.fetchAlbumList()
        
        // Then
        XCTAssertTrue(viewController.displayServerErrorCalled, "displayServerErrorCalled should be called")
    }
    
    func testFetchSearchedAlbumListWithText() {
        
        // Given
        let service = AlbumServiceSuccessSpy()
        viewModel = AlbumListViewModel(albumService: service)
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // When
        viewModel.fetchAlbumList()
        viewModel.fetchSearchedAlbumList(forText: "test")
        
        // Then
        XCTAssertTrue(viewController.displayAlbumListCalled, "displayAlbumListCalled should be called")
    }
    
    func testFetchSearchedAlbumListWithEmptyText() {
        
        // Given
        let service = AlbumServiceSuccessSpy()
        viewModel = AlbumListViewModel(albumService: service)
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // When
        viewModel.fetchSearchedAlbumList(forText: "")
        
        // Then
        XCTAssertTrue(viewController.displayAlbumListCalled, "displayAlbumListCalled should be called")
    }
}
