//
//  NSError+Helper.m
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import "NSError+Helper.h"


#define kErrorDomain      @"com.Rate-Obj-C"
#define kUnknownErrorCode 10001


@implementation NSError (Helper)

+ (NSError *)errorWithResponseParams:(NSDictionary *)responseParams {
    
    NSInteger code = [responseParams[@"code"] integerValue];
    NSString* description = responseParams[@"message"] ? responseParams[@"message"] : @"";
    NSError* error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:code
                                            userInfo:@{ NSLocalizedDescriptionKey : description}];
    return error;
}

+ (NSError *)unknownResponseError {
    
    NSError *error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:kUnknownErrorCode
                                            userInfo:@{NSLocalizedDescriptionKey : @"unknown_response"}];
    return error;
}

+ (NSError *)errorWithCode:(NSUInteger)code message:(NSString *)message {
    
    NSError *error = [[NSError alloc] initWithDomain:kErrorDomain
                                                code:code
                                            userInfo:@{ NSLocalizedDescriptionKey : message } ];
    return error;
}

@end
