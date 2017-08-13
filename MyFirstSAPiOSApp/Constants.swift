//
// Constants.swift
// MyFirstSAPiOSApp
//
// Created by SAP Cloud Platform SDK for iOS Assistant application on 13/08/17
//

import Foundation
import SAPFoundation

enum CollectionType: String {
    case myPrefixSalesOrderHeaders = "SalesOrderHeaders"
    case myPrefixProductTexts = "ProductTexts"
    case myPrefixSuppliers = "Suppliers"
    case myPrefixPurchaseOrderItems = "PurchaseOrderItems"
    case myPrefixStock = "Stock"
    case myPrefixCustomers = "Customers"
    case myPrefixProductCategories = "ProductCategories"
    case myPrefixSalesOrderItems = "SalesOrderItems"
    case myPrefixPurchaseOrderHeaders = "PurchaseOrderHeaders"
    case myPrefixProducts = "Products"
    case none = ""

    static let allValues: [CollectionType] = [
        myPrefixSalesOrderHeaders, myPrefixProductTexts, myPrefixSuppliers, myPrefixPurchaseOrderItems, myPrefixStock, myPrefixCustomers, myPrefixProductCategories, myPrefixSalesOrderItems, myPrefixPurchaseOrderHeaders, myPrefixProducts]
}

struct Constants {

    static let appId = "test.MyFirstSAPiOSApp"
    private static let sapcpmsUrlString = "https://hcpms-p1941269055trial.hanatrial.ondemand.com/"
    static let sapcpmsUrl = URL(string: sapcpmsUrlString)!
    static let appUrl = Constants.sapcpmsUrl.appendingPathComponent(appId)
    static let configurationParameters = SAPcpmsSettingsParameters(backendURL: Constants.sapcpmsUrl, applicationID: Constants.appId)
}
