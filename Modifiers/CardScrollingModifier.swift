//
//  CardScrollingModifier.swift
//  EnvironmentalJusticeReadOnly
//
//  Created by Sasha on 7/9/24.
//

import SwiftUI

struct ScrollingStackModifier: ViewModifier {
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat

    var items: [Card]
    var itemWidth: CGFloat
    var itemSpacing: CGFloat

    init(items: [Card], itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing

        let contentWidth: CGFloat = CGFloat(items.count) * itemWidth + CGFloat(items.count - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width

        let initialOffset = (contentWidth / 2.0) - (screenWidth / 2.0) + ((screenWidth - itemWidth) / 2.0)

        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }

    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                .onChanged { event in dragOffset = event.translation.width }
                .onEnded { event in
                    scrollOffset += event.translation.width
                    dragOffset = 0

                    let contentWidth: CGFloat = CGFloat(items.count) * itemWidth + CGFloat(items.count - 1) * itemSpacing
                    let screenWidth = UIScreen.main.bounds.width

                    let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)

                    var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)

                    if index.remainder(dividingBy: 1) > 0.5 {
                        index += 1
                    } else {
                        index = CGFloat(Int(index))
                    }

                    index = min(index, CGFloat(items.count) - 1)
                    index = max(index, 0)

                    let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing

                    withAnimation {
                        scrollOffset = newOffset
                    }
                }
            )
    }
}

