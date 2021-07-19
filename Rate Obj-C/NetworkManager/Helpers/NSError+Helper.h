//
//  NSError+Helper.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <Foundation/Foundation.h>

@interface NSError (Helper)

+ (NSError *)errorWithResponseParams:(NSDictionary *)responseParams;
+ (NSError *)unknownResponseError;
+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message;
@end
