//
//  TGStringExtesion.swift
//  TJSwift
//
//  Created by 蔡国龙 on 2017/5/9.
//  Copyright © 2017年 TG. All rights reserved.
//

import Foundation

extension String
{
    func md5String() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt.init(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int.init(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity:digestLen)
        CC_MD5(str!,strLen,result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", (result[i]))
        }
        result.deinitialize()
        return String.init(format: hash as String)
        
    }
}
