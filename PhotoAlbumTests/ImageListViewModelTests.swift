//
//  ImageListViewModelTests.swift
//  PhotoAlbumTests
//
//  Created by Biswajyoti Sahu on 13/06/21.
//

import XCTest
@testable import PhotoAlbum

class ImageListViewModelTests: XCTestCase {

    private var viewModel: ImageListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
    }

    private class ImageServiceSuccessSpy: ImageService {
        
        func getImageListForSpecificAlbum(_ albumId: Int, completionHandler: @escaping (Result<[Photo], Error>) -> ()) {
            
            let photo = Photo()
            completionHandler(.success([photo]))
        }
    }
    
    private class ImageServiceFailureSpy: ImageService {
        
        func getImageListForSpecificAlbum(_ albumId: Int, completionHandler: @escaping (Result<[Photo], Error>) -> ()) {
            
            let error = NSError(domain: "domain", code: 400, userInfo: nil)
            completionHandler(.failure(error))
        }
    }
    
    private class ViewControllerSpy: ImageListDisplayLogic {
        
        var displayImageListCalled = false
        var displayServerErrorCalled = false
        
        func displayImageList(forTitle titleText: String, viewData: [ImageListCellViewData]) {
            
            displayImageListCalled = true
        }
        
        func displayServerError() {
            
            displayServerErrorCalled = true
        }
    }
    
    func testFetchImageListSuccess() {
        
        // Given
        let service = ImageServiceSuccessSpy()
        viewModel = ImageListViewModel(imageService: service, albumContext: AlbumContext(albumId: 1))
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // When
        viewModel.fetchImageList()
        
        // Then
        XCTAssertTrue(viewController.displayImageListCalled, "displayImageListCalled should be called")
    }
    
    func testFetchImageListFailure() {
        
        // Given
        let service = ImageServiceFailureSpy()
        viewModel = ImageListViewModel(imageService: service, albumContext: AlbumContext(albumId: 1))
        let viewController = ViewControllerSpy()
        viewModel.viewController = viewController
        
        // When
        viewModel.fetchImageList()
        
        // Then
        XCTAssertTrue(viewController.displayServerErrorCalled, "displayServerErrorCalled should be called")
    }

}
