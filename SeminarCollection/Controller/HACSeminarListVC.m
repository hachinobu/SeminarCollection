//
//  HACSeminarListVC.m
//  SeminarCollection
//
//  Created by Nishinobu.Takahiro on 2014/12/13.
//  Copyright (c) 2014年 Takahiro Nishinobu. All rights reserved.
//

#import "HACSeminarListVC.h"
#import "SeminarAPIManager.h"
#import "HACSeminarCell.h"
#import "Seminar.h"
#import "HACSeminarDetailVC.h"
#import "HACUpDownTransition.h"

static NSString * const kCellIdentifier = @"SeminarCell";

@interface HACSeminarListVC () <UINavigationControllerDelegate>

@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) NSMutableArray *seminars;
@property (strong, nonatomic, readwrite) NSIndexPath *selectedIndexPath;

@end

@implementation HACSeminarListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.delegate = self;
    [[SeminarAPIManager sharedManager] addObserver:self
                                        forKeyPath:@"seminars"
                                           options:NSKeyValueObservingOptionNew
                                           context:nil];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(refreshSeminarInfo:)
                  forControlEvents:UIControlEventValueChanged];
    
    [self refreshSeminarInfo:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == [SeminarAPIManager sharedManager] && [keyPath isEqualToString:@"seminars"]) {
        NSIndexSet *indexSet = change[NSKeyValueChangeIndexesKey];
        NSKeyValueChange changeKind = (NSKeyValueChange)[change[NSKeyValueChangeKindKey] integerValue];
        
        NSMutableArray *indexPaths = [NSMutableArray array];
        [indexSet enumerateIndexesUsingBlock:^(NSUInteger index, BOOL *stop) {
            [indexPaths addObject:[NSIndexPath indexPathForRow:index inSection:0]];
        }];
        
        [self.tableView beginUpdates];
        if (changeKind == NSKeyValueChangeInsertion) {
            // 新規追加
            [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
        } else if (changeKind == NSKeyValueChangeRemoval) {
            // 削除
            [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
        } else if (changeKind == NSKeyValueChangeReplacement) {
            // 更新
            [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        [self.tableView endUpdates];
    }
}

#pragma mark - Action
- (void)refreshSeminarInfo:(id)sender {
    [self.refreshControl beginRefreshing];
    
    if ([[SeminarAPIManager sharedManager].seminars count] == 0) {
        [[SeminarAPIManager sharedManager] loadAllSeminars];
    }
    
    __weak typeof(self) weakSelf = self;
    [[SeminarAPIManager sharedManager] reloadSeminarsWithType:SeminarTypeAll withBlock:^(NSError *error) {
        
        if (error) {
            NSLog(@"error:%@", error.localizedDescription);
        }
        
        [weakSelf.refreshControl endRefreshing];
    }];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[SeminarAPIManager sharedManager].seminars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Configure the cell...
    HACSeminarCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    Seminar *seminar = [SeminarAPIManager sharedManager].seminars[indexPath.row];
    [cell setupCellWithModel:seminar];
    
    return cell;
}

#pragma mark - segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    HACSeminarDetailVC *vc = (HACSeminarDetailVC *)segue.destinationViewController;
    NSIndexPath *selectedIdx = [self.tableView indexPathForSelectedRow];
    vc.seminarInfo = [SeminarAPIManager sharedManager].seminars[selectedIdx.row];
    vc.navigationController.delegate = self;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    
    HACUpDownTransition *transition = [HACUpDownTransition new];
    transition.pushing = (operation == UINavigationControllerOperationPush);
    return transition;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
