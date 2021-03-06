//
//  JSON.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <Foundation/Foundation.h>

#pragma mark Deserializing methods

@interface NSString (JSONDeserializing)

- (id)objectFromJSONString;

@end

@interface NSData (JSONDeserializing)

- (id)objectFromJSONData;

@end


#pragma mark Serializing methods

@interface NSString (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSArray (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

@interface NSDictionary (JSONSerializing)
- (NSData *)JSONData;
- (NSString *)JSONString;
@end

