//
//  XCUIElement.swift
//  backgroundService
//
//  Created by admin on 8/18/21.
//

import XCTest
@testable import backgroundService

extension XCUIElement {
    func setText(text: String?, application: XCUIApplication) {
        tap()
        UIPasteboard.general.string = text
        doubleTap()
        application.menuItems.element(boundBy: 0).tap()
    }
}
