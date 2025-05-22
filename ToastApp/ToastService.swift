//
//  ToastService.swift
//  ToastApp
//
//  Created by Anton Marchanka on 5/22/25.
//


import SwiftUI

final class ToastService {
    static let shared = ToastService()
    private var window: UIWindow?

    func show(title: String, duration: TimeInterval = 2.0) {
        DispatchQueue.main.async {
            let toastView = UIHostingController(rootView: ToastView(title: title))
            toastView.view.backgroundColor = .clear

            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
            let window = UIWindow(windowScene: scene)
            window.frame = UIScreen.main.bounds
            window.windowLevel = .alert + 1
            window.rootViewController = toastView
            window.makeKeyAndVisible()

            self.window = window

            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                window.isHidden = true
                self.window = nil
            }
        }
    }
}
