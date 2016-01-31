//
//  ArrayExtensions.swift

import Foundation

// MARK: - Push/Pop and Enqueue/Dequeue
extension Array {

    mutating func push(newElement: Element) {
        self.append(newElement)
    }
    
    /**
    - returns: return element or nil if self is empty.
    */
    mutating func pop() -> Element? {
        if self.count == 0 { return nil }
        return self.removeLast()
    }
    
    mutating func enqueue(newElement: Element) {
        self.append(newElement)
    }
    
    /**
    - returns: return element or nil if self is empty.
    */
    mutating func dequeue() -> Element? {
        if self.count == 0 { return nil }
        return self.removeFirst()
    }
    
}

// MARK: - each/any/none/all/one
extension Array {

    func each(@noescape block: Element -> Void) {
        for item in self { block(item) }
    }
    
    func eachWithIndex(@noescape block: (Element, Int) -> Void) {
        for (i, item) in self.enumerate() { block(item, i) }
    }
    
    func any(@noescape block: (Element -> Bool)) -> Bool {
        for item in self { if block(item) { return true }}
        return false
    }

    func none(@noescape block: (Element -> Bool)) -> Bool {
        return !any(block)
    }

    func all(@noescape block: (Element -> Bool)) -> Bool {
        for item in self { if !block(item) { return false }}
        return true
    }

    func one(@noescape block: (Element -> Bool)) -> Bool {
        return self.filter(block).count == 1
    }

}

// MARK: - Random/Shuffle
extension Array {
    
    @warn_unused_result
    func random() -> Element {
        return self[Int(arc4random_uniform(UInt32(self.count)))]
    }
    
    @warn_unused_result
    func shuffledArray() -> [Element] {
        var result = self
        for var j = result.count - 1; j > 0; j-- {
            let k = Int(arc4random_uniform(UInt32(j + 1)))
            if j == k { continue }
            swap(&result[k], &result[j])
        }
        return result
    }
    
    mutating func shuffle() {
        self = self.shuffledArray()
    }
    
}

// MARK: - Unique(remove duplicates)
extension Array where Element: Hashable {
    
    @warn_unused_result
    static func unique(source: [Element]) -> [Element] {
        return source.unique()
    }
    
    func unique() -> [Element] {
        var r = [Element]()
        for i in self { r += !r.contains(i) ? [i]:[] }
        return r
    }
    
    mutating func uniqueInPlace() {
        self = self.unique()
    }
    
    mutating func removeElement(element: Element) -> Element? {
        guard let index = indexOf(element) else { return nil }
        return removeAtIndex(index)
    }
    
}

extension SequenceType where Generator.Element: IntegerType {
    func sum() -> Generator.Element {
        return self.reduce(0, combine: +)
    }
}