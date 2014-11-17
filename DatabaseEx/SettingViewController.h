//
//  SettingViewController.h
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface SettingViewController : UIViewController
{
    // Data pointer
    NSString *name;
    NSString *telno;
    NSString *email;
    
    // Data control
    UILabel *labelName;
    UIButton *labelTelNo;
    UIButton *labelEmail;
    
   
    
}
@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (void)setName:(NSString*)n phoneNumber:(NSString*)t mailAddress:(NSString*)m;

@end
