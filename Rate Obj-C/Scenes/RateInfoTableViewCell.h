//
//  RateInfoTableViewCell.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RateInfoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *toValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *currMnemFromLabel;
@property (weak, nonatomic) IBOutlet UILabel *currMnemToLabel;
@property (weak, nonatomic) IBOutlet UILabel *basicLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyValeuLabel;
@property (weak, nonatomic) IBOutlet UILabel *saleValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *deltaBuyLabel;
@property (weak, nonatomic) IBOutlet UILabel *deltaSaleLabel;

@end

NS_ASSUME_NONNULL_END
