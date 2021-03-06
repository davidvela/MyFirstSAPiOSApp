//
// Notifier.swift
// MyFirstSAPiOSApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 13/08/17
//

import UIKit

protocol Notifier: class {
    func displayAlert(title: String, message: String)
    func displayAlert(title: String, message: String, completionHandler: (() -> ())?)
}

extension Notifier where Self: UIViewController {

    private var okTitle: String {
        return NSLocalizedString("keyOkButtonTitle",
            value: "OK",
            comment: "XBUT: Title of OK button.")
    }

    func displayAlert(title: String, message: String) {
        self.displayAlert(title: title, message: message, completionHandler: nil)
    }

    func displayAlert(title: String, message: String, completionHandler: (() -> ())?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // Create the actions
        let buttonAction = UIAlertAction(title: okTitle, style: .default) { action in
            alertController.dismiss(animated: true)
            if let completionHandler = completionHandler {
                completionHandler()
            }
        }

        // Add the actions
        alertController.addAction(buttonAction)
        DispatchQueue.main.async {
            // Present the controller
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
