//
//  RequestManager.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject
+ (void)getRateWith:(NSDictionary *)params withBodyParams:(NSDictionary *)bodyParams  withCompletion:( void (^) (id response, NSError *error))handler;
@end

