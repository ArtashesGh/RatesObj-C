//
//  LoadingView.h
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import <UIKit/UIKit.h>

@interface LoadingView : UIView

@property (nonatomic, retain) UIView *dialogView;    // Dialog's container view


-(void)show;
-(void)hide;

@end
