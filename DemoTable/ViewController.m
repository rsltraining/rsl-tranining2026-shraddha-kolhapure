//
//  ViewController.m
//  DemoTable
//
//  Created by Shraddha Kolhapure on 28/05/26.
//

#import "ViewController.h"
#import "ShoppingModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ShoppingModel *shoppingModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shoppingModel = [[ShoppingModel alloc] init];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shoppingModel numberOfItems];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"Shopping List";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *itemName = [self.shoppingModel itemAtIndex:indexPath.row];
    
    UIListContentConfiguration *content = [cell defaultContentConfiguration];
    content.text = itemName;
    cell.contentConfiguration = content;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *selectedItem = [self.shoppingModel itemAtIndex:indexPath.row];
    NSLog(@"You tapped on: %@", selectedItem);
}

@end
