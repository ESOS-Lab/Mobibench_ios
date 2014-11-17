//
//  ContentViewController.h
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import <UIKit/UIKit.h>
#include "fcntl.h"
#include "unistd.h"

int iosize_seq;
int filesize;
int mode;
int dbsize;
int datasize;

@interface ContentViewController : UIViewController
{
    UIButton *Btn;
    UILabel *textLabel;
    
}
@property (strong, nonatomic) UIWindow *window;
@property(nonatomic, retain) UIViewController *rootViiewController;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;
- (int) getiosize_seq;
- (void) setiosize_seq:(int)value;
- (int) getfilesize;
- (void) setfilesize:(int)value2;
- (char *) getmode;
- (void) setmode:(int)value3;
- (int) getdbsize;
- (void) setdbsize:(int)value4;
- (int) getdatasize;
- (void) setdatasize:(int)value5;
@end
