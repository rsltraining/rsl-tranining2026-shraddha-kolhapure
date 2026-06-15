// ContactDelegate.m
#import "ContactDelegate.h"

@interface ContactDelegate ()
@property (nonatomic, strong) ContactModelProvider *modelProvider;
@property (nonatomic, copy) void (^selectionCallback)(NSIndexPath *indexPath);
@end

@implementation ContactDelegate

- (instancetype)initWithModelProvider:(ContactModelProvider *)modelProvider
                    selectionCallback:(void (^)(NSIndexPath *indexPath))selectionCallback {
    self = [super init];
    if (self) {
        _modelProvider = modelProvider;
        _selectionCallback = selectionCallback;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.row % 2 == 0) ? 60.0f : 90.0f;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor systemGroupedBackgroundColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 8, tableView.bounds.size.width - 32, 24)];
    label.text = @"MY CONTACTS";
    label.font = [UIFont boldSystemFontOfSize:14];
    label.textColor = [UIColor secondaryLabelColor];
    
    [header addSubview:label];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footer = [[UIView alloc] init];
    footer.backgroundColor = [UIColor clearColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(16, 8, tableView.bounds.size.width - 32, 20)];
    label.text = [NSString stringWithFormat:@"Total Contacts: %ld", (long)[self.modelProvider numberOfContacts]];
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor tertiaryLabelColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    [footer addSubview:label];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 36.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.selectionCallback) {
        self.selectionCallback(indexPath);
    }
}

@end
