//
//  Rate.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

@protocol Rate
@end
@interface Rate : JSONModel
@property (nonatomic) NSInteger tp;
@property (nonatomic) NSString<Optional> *name;
@property (nonatomic) NSString<Optional> *from;
@property (nonatomic) NSString<Optional> *currMnemFrom;
@property (nonatomic) NSString<Optional> *to;
@property (nonatomic) NSString<Optional> *currMnemTo;
@property (nonatomic) NSString<Optional> *basic;
@property (nonatomic) NSString<Optional> *buy;
@property (nonatomic) NSString<Optional> *sale;
@property (nonatomic) NSString<Optional> *deltaBuy;
@property (nonatomic) NSString<Optional> *deltaSale;

@end
