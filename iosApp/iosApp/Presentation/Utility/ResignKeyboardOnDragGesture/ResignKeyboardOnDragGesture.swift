//
//  ResignKeyboardOnDragGesture.swift
//  iosApp
//
//  Created by okudera on 2021/01/24.
//  Copyright © 2021 orgName. All rights reserved.
//

import SwiftUI

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}
