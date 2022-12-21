import Foundation


struct Stack<Element> {
    private var items: [Element]

    init(items: [Element] = []) {
        self.items = items
    }

    var top: Element? {
        self.items.last
    }

    mutating func push(_ element: Element) {
        self.items.append(element)
    }

    mutating func pop() -> Element {
        self.items.removeLast()
    }

    mutating func pop(count: Int) -> some Collection<Element> {
        let elements = self.items.suffix(count)
        self.items.removeLast(count)
        return elements
    }
}

