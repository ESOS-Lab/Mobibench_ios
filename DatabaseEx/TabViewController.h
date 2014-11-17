//
//  TabViewController.h
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import <UIKit/UIKit.h>

@class SettingViewController;

@interface TabViewController : UITableViewController{
    UIButton *Btn;
    UILabel *textLabel;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SettingViewController *SettingViewController;
@property(nonatomic, retain) UIViewController *rootViiewController;
@property (strong, nonatomic) UITabBarController *tabBarController;

@property (strong, nonatomic) UINavigationController *navigationController;
@end
