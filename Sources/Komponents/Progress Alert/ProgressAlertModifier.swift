//
//  ProgressAlertModifier.swift
//  Komponents
//
//  Created by シン・ジャスティン on 2024/11/24.
//

import SwiftUI

struct ProgressAlertModifier: ViewModifier {
    
    @Binding var isModal: Bool
    @Binding var isShowing: Bool

    @Binding var headerText: String?
    @Binding var bodyText: String?
    @Binding var progress: Double?

    @Namespace var progressAlertNamespace

    func body(content: Content) -> some View {
        content
            .overlay {
                if isShowing {
                    if isModal {
                        LoadingOverlay(
                            namespace: progressAlertNamespace,
                            headerText: $headerText,
                            bodyText: $bodyText,
                            progress: $progress
                        )
                    } else {
                        LoadingPill(
                            namespace: progressAlertNamespace,
                            headerText: $headerText,
                            bodyText: $bodyText
                        )
                    }
                }
            }
    }
}

public extension View {
    func progressAlert(
        isModal: Binding<Bool>,
        isShowing: Binding<Bool>,
        headerText: Binding<String?> = .constant(""),
        bodyText: Binding<String?> = .constant(""),
        progress: Binding<Double?> = .constant(.zero)
    ) -> some View {
        self.modifier(
            ProgressAlertModifier(
                isModal: isModal,
                isShowing: isShowing,
                headerText: headerText,
                bodyText: bodyText,
                progress: progress
            )
        )
    }
}
