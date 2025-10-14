//
//  UIViewController+Snapshot.swift
//  CleanArchitecture
//
//  Created by Faiyaz Ahmed on 01/10/2025.
//

import UIKit

extension UIViewController {
    func snapshot(for configuration: SnapshotConfiguration) -> UIImage {
        return SnapshotWindow(configuration: configuration, root: self).snapshot()
    }
}

struct SnapshotConfiguration {
    let size: CGSize
    let safeAreaInsets: UIEdgeInsets
    let layoutMargins: UIEdgeInsets
    let traitCollection: UITraitCollection

    static func iPhone16Pro(style: UIUserInterfaceStyle, contentSize: UIContentSizeCategory = .medium) -> SnapshotConfiguration {
        let traits = UITraitCollection(mutations: {
            $0.forceTouchCapability = .unavailable
            $0.layoutDirection = .leftToRight
            $0.preferredContentSizeCategory = contentSize
            $0.userInterfaceIdiom = .phone
            $0.horizontalSizeClass = .compact
            $0.verticalSizeClass = .regular
            $0.displayScale = 3
            $0.displayGamut = .P3
            $0.userInterfaceStyle = style
        })
        
        return SnapshotConfiguration(
            size: CGSize(width: 393, height: 852),
            safeAreaInsets: UIEdgeInsets(top: 59, left: 0, bottom: 34, right: 0),
            layoutMargins: UIEdgeInsets(top: 20, left: 16, bottom: 0, right: 16),
            traitCollection: traits
        )
    }
}

private final class SnapshotWindow: UIWindow {
    private var configuration: SnapshotConfiguration = .iPhone16Pro(style: .light)

    convenience init(configuration: SnapshotConfiguration, root: UIViewController) {
        self.init(frame: CGRect(origin: .zero, size: configuration.size))
        self.configuration = configuration
        self.layoutMargins = configuration.layoutMargins
        self.rootViewController = root
        self.isHidden = false
        root.view.layoutMargins = configuration.layoutMargins
    }

    override var safeAreaInsets: UIEdgeInsets {
        return configuration.safeAreaInsets
    }

    override var traitCollection: UITraitCollection {
        return super.traitCollection.modifyingTraits { traits in
            let configTraits = configuration.traitCollection
            traits.userInterfaceStyle = configTraits.userInterfaceStyle
            traits.displayScale = configTraits.displayScale
            traits.displayGamut = configTraits.displayGamut
            traits.userInterfaceIdiom = configTraits.userInterfaceIdiom
            traits.layoutDirection = configTraits.layoutDirection
            traits.horizontalSizeClass = configTraits.horizontalSizeClass
            traits.verticalSizeClass = configTraits.verticalSizeClass
            traits.preferredContentSizeCategory = configTraits.preferredContentSizeCategory
            traits.forceTouchCapability = configTraits.forceTouchCapability
        }
    }

    func snapshot() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds, format: .init(for: traitCollection))
        return renderer.image { action in
            layer.render(in: action.cgContext)
        }
    }
 }
