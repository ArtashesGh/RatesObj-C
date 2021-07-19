//
//  JSON.m
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import "JSON.h"

#pragma mark Deserializing methods

@implementation NSString (JSONKitDeserializing)

- (id)objectFromJSONString
{
    NSData *jsonData = [self JSONData];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
}

@end


@implementation NSData (JSONDeserializing)

- (id)objectFromJSONData
{
    return [NSJSONSerialization JSONObjectWithData:self options:NSJSONReadingMutableContainers error:nil];
}

@end


#pragma mark Serializing methods

@implementation NSString (JSONSerializing)

- (NSData *)JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSString *)JSONString
{
    
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

@implementation NSArray (JSONSerializing)

- (NSData *)JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options: NSJSONWritingPrettyPrinted error:nil];
}

- (NSString *)JSONString
{
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end

@implementation NSDictionary (JSONKitSerializing)

- (NSData *)JSONData
{
    return [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
}

- (NSString *)JSONString
{
    NSString* jsonString = [[NSString alloc] initWithData:[self JSONData] encoding:NSUTF8StringEncoding];
    return jsonString;
}

@end
