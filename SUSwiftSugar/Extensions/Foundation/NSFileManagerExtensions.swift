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

extension NSFileManager {
    
    enum CustomError: ErrorType {
        case ConvertURLToPathError
    }
    
    func forceMove(path: String, toPath: String) throws {
        if fileExistsAtPath(toPath) {
            try removeItemAtPath(toPath)
        }
        try moveItemAtPath(path, toPath: toPath)
    }
    
    func forceCopy(path: String, toPath: String) throws {
        if fileExistsAtPath(toPath) {
            try removeItemAtPath(toPath)
        }
        try copyItemAtPath(path, toPath: toPath)
    }
    
    func swap(path1 path1: String, path2: String) throws {
        let tempPath = NSTemporaryDirectory().stringByAppendingPathComponent(".temp")
        
        if fileExistsAtPath(tempPath) {
            try removeItemAtPath(tempPath)
        }
        
        if fileExistsAtPath(path1) {
            try moveItemAtPath(path1, toPath: tempPath)
        }
        if fileExistsAtPath(path2) {
            try moveItemAtPath(path2, toPath: path1)
        }
        if fileExistsAtPath(tempPath) {
            try moveItemAtPath(tempPath, toPath: path2)
        }
    }
    
    func forceMove(srcURL: NSURL, toURL: NSURL) throws {
        guard let path = srcURL.path, toPath = toURL.path else {
            throw CustomError.ConvertURLToPathError
        }
        try forceMove(path, toPath: toPath)
    }
    
    func forceCopy(srcURL: NSURL, toURL: NSURL) throws {
        guard let path = srcURL.path, toPath = toURL.path else {
            throw CustomError.ConvertURLToPathError
        }
        try forceCopy(path, toPath: toPath)
    }
    
    func swap(url1 url1: NSURL, url2: NSURL) throws {
        guard let path1 = url1.path, path2 = url2.path else {
            throw CustomError.ConvertURLToPathError
        }
        try swap(path1: path1, path2: path2)
    }
    
    func addExcludedFromBackupToItemAtPath(path: String) throws {
        try addExcludedFromBackupToItemAtURL(NSURL(fileURLWithPath: path))
    }

    func addExcludedFromBackupToItemAtURL(fileURL: NSURL) throws {
        try fileURL.setResourceValue(true, forKey: NSURLIsExcludedFromBackupKey)
    }

}