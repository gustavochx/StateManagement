//
//  LoadingButton.swift
//  StateManagement
//
//  Created by Gustavo Soares on 07/04/22.
//

import SwiftUI

struct LoadingButton<Content: View>: View {

    @Binding var isLoading: Bool

    private var action: () -> Void
    private let content: Content

    public init(isLoading: Binding<Bool>,
                action: @escaping (()->Void),
                @ViewBuilder content: () -> Content) {
        self._isLoading = isLoading
        self.action = action
        self.content = content()
    }

    public var body: some View {
        Button {
            if !isLoading {
                action()
            }
            isLoading = true
        } label: {
            ZStack {
                Rectangle()
                    .fill(isLoading ? Color.blue : Color.clear)
                    .frame(width: isLoading ? 50 : 100 , height: 50)
                    .cornerRadius(isLoading ? 50/2 : 15)

                if isLoading {
                    CircleLoadingBar()
                } else {
                    content
                }
            }
        }
        .frame(width: 100, height: 50)
        .disabled(isLoading)
        .animation(.easeInOut, value: isLoading)
    }
}

struct CircleLoadingBar: View {
    @State private var isLoading = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(Color.white, style: StrokeStyle(lineWidth: 1.0, lineCap: .round, lineJoin: .round))
            .frame(width: 80, height: 30)
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(Animation.default.repeatForever(autoreverses: false), value: isLoading)
            .onAppear {
                self.isLoading = true
            }
    }
}
