//
// MyPrefixCustomersMasterTableDelegate.swift
// MyFirstSAPiOSApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 13/08/17
//
import Foundation
import SAPFoundation
import SAPOData
import SAPCommon

class MyPrefixCustomersMasterTableDelegate: NSObject, MasterTableDelegate {
    private let dataAccess: MyPrefixMyServiceClassDataAccess!
    weak var notifier: Notifier?
    private let logger: Logger = Logger.shared(named: "MasterTableDelegateLogger")
    private var _entities: [MyPrefixCustomer] = [MyPrefixCustomer]()
    var entities: [EntityValue] {
        get { return _entities }
        set { self._entities = newValue as! [MyPrefixCustomer]
        }
    }

    init(dataAccess: MyPrefixMyServiceClassDataAccess) {
        self.dataAccess = dataAccess
    }

    func requestEntities(completionHandler: @escaping(Error?) -> Void) {
        self.dataAccess.loadMyPrefixCustomers { (myprefixcustomers, error) in
            guard let myprefixcustomers = myprefixcustomers else {
                completionHandler(error!)
                return
            }
            self.entities = myprefixcustomers
            completionHandler(nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self._entities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myprefixcustomer = self.entities[indexPath.row] as! MyPrefixCustomer
        let cell = cellWithNonEditableContent(tableView: tableView, indexPath: indexPath, key: "CustomerId", value: "\(myprefixcustomer.customerID)")
        return cell
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle != .delete {
            return
        }
        let currentEntity = self._entities[indexPath.row]
        self.dataAccess.service.deleteEntity(currentEntity) { error in
            if let error = error {

                self.logger.error("Delete entry failed.", error: error)
                self.notifier?.displayAlert(title: NSLocalizedString("keyErrorDeletingEntryTitle", value: "Delete entry failed", comment: "XTIT: Title of deleting entry error pop up."), message: NSLocalizedString("keyErrorDeletingEntryBody", value: error.localizedDescription, comment: "XMSG: Body of deleting entry error pop up."))
                return
            }
            self._entities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
