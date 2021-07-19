//
//  ViewController.m
//  Rate Obj-C
//
//  Created by Artashes Noknok on 7/16/21.
//

#import "ViewController.h"
#import "RateInfoTableViewCell.h"
#import "RequestManager.h"
#import "Rate.h"
#import "RatesListResponse.h"
#import <JSONModel/JSONModel.h>
#import "LoadingView.h"

#define TEXT_UID        @"563B4852-6D4B-49D6-A86E-B273DD520FD2"
#define TEXT_TYPE       @"ExchangeRates"
#define TEXT_RID        @"BEYkZbmV"
#define TEXT_VERSION    @"44"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) NSArray<Rate> *dipleyedList;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataWIthNEtwork];
    // Do any additional setup after loading the view.
}

- (void)loadDataWIthNEtwork {
    NSDictionary *bodyParams = @{ @"uid" : TEXT_UID,
                                  @"type" : TEXT_TYPE,
                                  @"rid": TEXT_RID,
                                  @"version" : TEXT_VERSION};
    NSDictionary *params = @{ @"d" : TEXT_UID,
                              @"t" : TEXT_TYPE,
                              @"r": TEXT_RID,
                              @"v" : TEXT_VERSION};
    LoadingView *loader = [[LoadingView alloc] init];
    [loader show];
    [RequestManager getRateWith:params withBodyParams:bodyParams withCompletion:^(id response, NSError *error) {
        [loader hide];
        if (!error){
            RatesListResponse *resp = [[RatesListResponse alloc] initWithDictionary:response error:nil] ;
            self.dipleyedList = resp.rates;
            [self.tableView reloadData];
        }else {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle :@"Error"
                                                                            message : @""
                                                                     preferredStyle : UIAlertControllerStyleAlert];
            
            UIAlertAction * ok = [UIAlertAction
                                  actionWithTitle:@"OK"
                                  style:UIAlertActionStyleDefault
                                  handler:^(UIAlertAction * action)
                                  { }];
            
            [alert addAction:ok];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentViewController:alert animated:YES completion:nil];
            });
        }
    }];
    
    
}

#pragma mark - UITableViewDataSource

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.dipleyedList.count;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"RateInfoTableViewCell";
    
    RateInfoTableViewCell *cell = (RateInfoTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[RateInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Rate *dispElement = self.dipleyedList[indexPath.row];
    cell.nameLabel.text = dispElement.name;
    cell.basicLabel.text = dispElement.basic;
    cell.fromValueLabel.text = dispElement.from;
    cell.toValueLabel.text = dispElement.to;
    cell.currMnemFromLabel.text = dispElement.currMnemFrom;
    cell.currMnemToLabel.text = dispElement.currMnemTo;
    cell.saleValueLabel.text = dispElement.sale;
    cell.deltaSaleLabel.text = dispElement.deltaSale;
    cell.buyValeuLabel.text = dispElement.buy;
    cell.deltaBuyLabel.text = dispElement.deltaBuy;
    
    return cell;
}


@end
