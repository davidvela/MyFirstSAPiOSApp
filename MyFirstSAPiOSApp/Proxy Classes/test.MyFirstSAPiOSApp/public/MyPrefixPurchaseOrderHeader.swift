// # Proxy Compiler 17.3.2-33b2f6-20170509

import Foundation
import SAPOData

open class MyPrefixPurchaseOrderHeader: EntityValue {
    public static let currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")

    public static let grossAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")

    public static let netAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")

    public static let purchaseOrderID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderId")

    public static let supplierID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierId")

    public static let taxAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")

    public static let items: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader)
    }

    open class func array(from: EntityValueList) -> Array<MyPrefixPurchaseOrderHeader> {
        return ArrayConverter.convert(from.toArray(), Array<MyPrefixPurchaseOrderHeader>())
    }

    open func copy() -> MyPrefixPurchaseOrderHeader {
        return CastRequired<MyPrefixPurchaseOrderHeader>.from(self.copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixPurchaseOrderHeader.currencyCode))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixPurchaseOrderHeader.grossAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var items: Array<MyPrefixPurchaseOrderItem> {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.dataValue(for: MyPrefixPurchaseOrderHeader.items)).toArray(), Array<MyPrefixPurchaseOrderItem>())
        }
        set(value) {
            MyPrefixPurchaseOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(purchaseOrderID: String) -> EntityKey {
        return EntityKey().with(name: "PurchaseOrderId", value: StringValue.of(purchaseOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixPurchaseOrderHeader.netAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixPurchaseOrderHeader {
        get {
            return CastRequired<MyPrefixPurchaseOrderHeader>.from(self.oldEntity)
        }
    }

    open var purchaseOrderID: String {
        get {
            return StringValue.unwrap(self.dataValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID, to: StringValue.of(value))
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.dataValue(for: MyPrefixPurchaseOrderHeader.supplierID))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.dataValue(for: MyPrefixPurchaseOrderHeader.taxAmount))
        }
        set(value) {
            self.setDataValue(for: MyPrefixPurchaseOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
