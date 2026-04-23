import SwiftUI

struct GenreLayout: Layout {
    let spacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let maxWidth = proposal.width ?? .infinity
        var x: CGFloat = 0
        var y: CGFloat = 0
        var maxRowHeight: CGFloat = 0
        
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            if x + subviewSize.width > maxWidth && x > 0 {
                x = 0
                y += maxRowHeight + spacing
                maxRowHeight = 0
            }
            x += subviewSize.width + spacing
            maxRowHeight = max(subviewSize.height, maxRowHeight)
        }
        return CGSize(width: maxWidth, height: y + maxRowHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified)}
        var widthHeightElements: [(CGFloat, CGFloat, Int)] = .init()
        var x: CGFloat = 0
        var maxRowHeight: CGFloat = 0
        var counter: Int = 0
        
        for (index, size) in subviewSizes.enumerated() {
            if x + size.width > bounds.width && x > 0 {
                widthHeightElements.append((x - spacing, maxRowHeight, counter))
                x = 0
                counter = 0
                maxRowHeight = 0
            }
            x += size.width + spacing
            maxRowHeight = max(maxRowHeight, size.height)
            counter += 1
            if index == subviewSizes.count - 1 {
                widthHeightElements.append((x - spacing, maxRowHeight, counter))
            }
        }
        
        var rowIndex: Int = 0
        counter = 1
        x = bounds.minX + (bounds.width - widthHeightElements[rowIndex].0) / 2
        var y = bounds.minY
        for subview in subviews {
            let subviewSize = subview.sizeThatFits(.unspecified)
            if counter > widthHeightElements[rowIndex].2 {
                y += widthHeightElements[rowIndex].1 + spacing
                rowIndex += 1
                x = (bounds.width - widthHeightElements[rowIndex].0) / 2
                counter = 1
            }
            subview.place(at: CGPoint(x: x, y: y), proposal: ProposedViewSize(subviewSize))
            x += subviewSize.width + spacing
            counter += 1
        }
    }
}
