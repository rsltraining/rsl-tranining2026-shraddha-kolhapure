#import "SceneDelegate.h"
#import "ContainerViewController.h"

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

    self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];

    ContainerViewController *vc = [[ContainerViewController alloc] init];
    self.window.rootViewController = vc;

    [self.window makeKeyAndVisible];
}

@end
