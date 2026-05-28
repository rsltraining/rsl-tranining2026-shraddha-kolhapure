//
//  ViewController.m
//  ContactListApplication
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import "ViewController.h"
#import "ContactModelProvider.h"
#import "ContactDataSource.h"
#import "ContactDelegate.h"
#import "ContactCell.h"
#import "ContactDetailsViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) ContactModelProvider *modelProvider;
@property (nonatomic, strong) ContactDataSource *contactDataSource;
@property (nonatomic, strong) ContactDelegate *contactDelegate;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.title = @"Contacts";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    self.modelProvider = [[ContactModelProvider alloc] init];
    
   
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
   
    [self.tableView registerClass:[ContactCell class] forCellReuseIdentifier:@"ContactCell"];
    [self.view addSubview:self.tableView];
    

    self.contactDataSource = [[ContactDataSource alloc] initWithModelProvider:self.modelProvider];
    

    __weak typeof(self) weakSelf = self;
    self.contactDelegate = [[ContactDelegate alloc] initWithModelProvider:self.modelProvider
                                                        selectionCallback:^(NSIndexPath *indexPath) {
        [weakSelf navigateToDetailsForIndexPath:indexPath];
    }];
    
   
    self.tableView.dataSource = self.contactDataSource;
    self.tableView.delegate = self.contactDelegate;
}

#pragma mark - Navigation Routing

- (void)navigateToDetailsForIndexPath:(NSIndexPath *)indexPath {
   
    Contact *selectedContact = [self.modelProvider contactAtIndex:indexPath.row];
    
    ContactDetailsViewController *detailsVC = [[ContactDetailsViewController alloc] initWithContact:selectedContact];
    
    
    [self.navigationController pushViewController:detailsVC animated:YES];
}

@end
