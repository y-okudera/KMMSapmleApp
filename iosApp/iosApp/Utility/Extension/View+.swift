//
//  View+.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}
