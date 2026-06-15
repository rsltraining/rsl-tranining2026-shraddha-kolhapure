// ContactDataSource.m
#import "ContactDataSource.h"
#import "ContactCell.h"

@interface ContactDataSource ()
@property (nonatomic, strong) ContactModelProvider *modelProvider;
@end

@implementation ContactDataSource

- (instancetype)initWithModelProvider:(ContactModelProvider *)modelProvider {
    self = [super init];
    if (self) {
        _modelProvider = modelProvider;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelProvider numberOfContacts];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactCell" forIndexPath:indexPath];
    Contact *contact = [self.modelProvider contactAtIndex:indexPath.row];
    [cell configureWithContact:contact];
    return cell;
}

@end
