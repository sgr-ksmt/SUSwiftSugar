//
//  NSFileManagerExtensions.swift

import Foundation


private func getNSDirectory(searchPath: NSSearchPathDirectory) -> String {
    return NSSearchPathForDirectoriesInDomains(searchPath, .UserDomainMask, true).first!
}

public func NSDocumentDirectory() -> String {
    return getNSDirectory(.DocumentDirectory)
}

public func NSCacheDirectory() -> String {
    return getNSDirectory(.CachesDirectory)
}

public extension NSFileManager {
    public func fileExists(at path: FilePathConvertible) -> Bool {
        return fileExistsAtPath(path.filePath)
    }
    
    public func fileExists(at path: FilePathConvertible, isDirectory: UnsafeMutablePointer<ObjCBool>) -> Bool {
        return fileExistsAtPath(path.filePath, isDirectory: isDirectory)
    }

    
    public func safeRemove(path: FilePathConvertible) {
        _ = try? removeItemAtPath(path.filePath)
    }
    
    public func forceMove(from: FilePathConvertible, to: FilePathConvertible) {
        safeRemove(to)
        _ = try? moveItemAtPath(from.filePath, toPath: to.filePath)
    }
    
    public func forceCopy(from: FilePathConvertible, to: FilePathConvertible) {
        safeRemove(to)
        _ = try? copyItemAtPath(from.filePath, toPath: to.filePath)
    }
    
    public func swap(path1: FilePathConvertible, and path2: FilePathConvertible) throws {
        let tempPath: FilePathConvertible = NSTemporaryDirectory().stringByAppendingPathComponent(".temp")
        
        safeRemove(tempPath)
        try [(path1, tempPath), (path2, path1), (tempPath, path2)].forEach {
            try moveItemAtPath($0.0.filePath, toPath: $0.1.filePath)
        }
    }

    public func addExcludedFromBackupToItemAtURL(path: FilePathConvertible) throws {
        try path.fileURL.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
    }
}