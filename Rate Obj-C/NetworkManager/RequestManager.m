//
//  RequestManager.m
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import "RequestManager.h"
#import "NSDictionary+UrlEncoding.h"
#import "JSON.h"

static NSString *apiUrl = @"https://alpha.as50464.net:29870/";
@implementation RequestManager

+ (void)getRateWith:(NSDictionary *)params withBodyParams:(NSDictionary *)bodyParams  withCompletion:( void (^) (id response, NSError *error))handler {
    
    NSString *method = @"moby-pre-44/core";
    
    NSMutableURLRequest *request = [self requestForPostMethod:method
                                                   withParams:[params urlEncodedString]
                                                     withData:[bodyParams JSONData]];
    [self executeRequest:request withCompletion:handler];
    
}

#pragma mark - Request helpers

+ (void)executeRequest:(NSURLRequest*)request withCompletion:( void (^) (id response, NSError *error))handler  {
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSString *dataString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^(void){
            handler([data objectFromJSONData], error);
        });
    }] resume];
}

+ (NSMutableURLRequest *)requestForPostMethod:(NSString *)method withParams:(NSString *)params withData:(NSData *)postData {
    
    NSString* url = [NSString stringWithFormat:@"%@%@", apiUrl, method];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:60.0f];
    [request setHTTPMethod:@"POST"];
    
    [request addValue:[NSString stringWithFormat:@"application/x-www-form-urlencoded"] forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request addValue:@"Test GeekBrains iOS 3.0.0.182 (iPhone 11; iOS 14.4.1; Scale/2.00; Private)" forHTTPHeaderField:@"User-Agent"];
    [request setHTTPBody:postData];
    
    if (params) {
        NSData *postData = [params dataUsingEncoding:NSUTF8StringEncoding];
        [request setHTTPBody:postData];
        
    }
    
    return request;
}


@end
