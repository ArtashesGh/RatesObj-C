//
//  LoadingView.m
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/19/21.
//

#import "LoadingView.h"

@interface LoadingView () {
    UIActivityIndicatorView *spinner;
}

@end

@implementation LoadingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)init {
    self = [super init];

    self.frame = [UIScreen mainScreen].bounds;
    self.dialogView =[[UIView alloc] initWithFrame:self.frame/*CGRectMake(0, 0, 120.0, 120.0)*/];
    
    self.dialogView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.9];//txtColor;
    self.dialogView.alpha = 0.7;

    
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
    spinner.hidden = YES;
    spinner.hidesWhenStopped = YES;
    [spinner startAnimating];
    spinner.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    [self.dialogView addSubview:spinner];
    return self;
    
}

+ (BOOL)isLandscape
{
        UIWindow *firstWindow = [[[UIApplication sharedApplication] windows] firstObject];
        if (firstWindow == nil) { return NO; }

        UIWindowScene *windowScene = firstWindow.windowScene;
        if (windowScene == nil){ return NO; }

        return UIInterfaceOrientationIsLandscape(windowScene.interfaceOrientation);
}

-(void)show {
    
    self.dialogView.layer.shouldRasterize = YES;
    self.dialogView.layer.rasterizationScale = [[UIScreen mainScreen] scale];
    
    self.dialogView.layer.opacity = 0.7f;
    self.dialogView.layer.transform = CATransform3DMakeScale(1.3f, 1.3f, 1.0);
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    
    [self addSubview:self.dialogView];
    
    //[self setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [[[[UIApplication sharedApplication] windows] lastObject] addSubview:self];
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.f];
                         self.dialogView.layer.opacity = 0.7f;
                         self.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     }
                     completion:^(BOOL finished) {
                         
                         
                     }
     ];
}


-(void)hide {
    
    [self close];
}

- (void)close
{
    self.dialogView.layer.transform = CATransform3DMakeScale(1, 1, 1);
    self.dialogView.layer.opacity = 0.7f;
    
    [UIView animateWithDuration:0.2f delay:0.0 options:UIViewAnimationOptionTransitionNone
                     animations:^{
                         self.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f];
                         self.dialogView.layer.transform = CATransform3DMakeScale(0.6f, 0.6f, 1.0);
                         self.dialogView.layer.opacity = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         for (UIView *v in [self subviews]) {
                             [v removeFromSuperview];
                         }
                         [self removeFromSuperview];
                     }
     ];
}

@end
