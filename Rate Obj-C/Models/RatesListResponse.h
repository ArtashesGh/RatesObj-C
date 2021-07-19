//
//  RatesListResponse.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <JSONModel/JSONModel.h>
#import <Foundation/Foundation.h>
#import "Rate.h"

@protocol RatesListResponse
@end

@interface RatesListResponse : JSONModel

@property (nonatomic) NSInteger code;
@property (nonatomic) NSString<Optional> *messageTitle;
@property (nonatomic) NSString<Optional> *message;
@property (nonatomic) NSString<Optional> *rid;
@property (nonatomic) NSString<Optional> *productState;
@property (nonatomic) NSString<Optional> *ratesDate;
@property (nonatomic) NSArray<Rate, Optional> *rates;


//let code: Int
//let messageTitle, message, rid: String
//let downloadDate: String?
//let rates: [Rate]?
//let productState: Int?
//let ratesDate: String?
@end

