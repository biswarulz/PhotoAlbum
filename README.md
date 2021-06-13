# PhotoAlbum
I have named this application as PhotoAlbum. As per the requirement it retrieves all album list and shows images corresponding to the selected Album. Implemented in MVVM with coordinator pattern architecture. Added main app coordinator with child coordinators for managing app flows and navigation with using dependency injection.

This has two screens basically. Album List and Image List

# Album List

- This screen is the landing page after launching the app. Once loaded it will fetch all album list by calling the API service.
- Added search bar to search the albums based on text

https://jsonplaceholder.typicode.com/albums

# Image List

On click of any album based on the album ID it will fetch all images associated with it by calling API service.

https://jsonplaceholder.typicode.com/photos?albumId=<albumId>

# Third Party Framework

For third party framework I have used Cocoapod dependency manager.
For this project I have used AlamofireImage pod to show images asynchrounously using memory cache and also for network services.
