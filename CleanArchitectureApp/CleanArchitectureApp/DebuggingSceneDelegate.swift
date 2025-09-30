//
//  DebuggingSceneDelegate.swift
//  CleanArchitectureApp
//
//  Created by Faiyaz Ahmed on 30/09/2025.
//

#if DEBUG
import UIKit
import CleanArchitecture

class DebuggingSceneDelegate: SceneDelegate {
    override func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if CommandLine.arguments.contains("-reset") {
            try? FileManager.default.removeItem(at: localStoreURL)
        }
        
        super.scene(scene, willConnectTo: session, options: connectionOptions)
    }
    
    override func makeRemoteClient() -> any HTTPClient {
        if UserDefaults.standard.string(forKey: "connectivity") == "offline" {
            return AlwaysFailingHTTPClient()
        }
        return super.makeRemoteClient()
    }
    
    private class AlwaysFailingHTTPClient: HTTPClient {
        func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) -> HTTPClientTask {
            completion(.failure(NSError(domain: "offline", code: 0)))
            return Task()
        }
        private class Task: HTTPClientTask {
            func cancel() { }

        }
    }
}
#endif
