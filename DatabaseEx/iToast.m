#import "iToast.h"

@implementation iToast\

@synthesize textLabel;

float const ToastHeight = 50.0f;
float const ToastGap = 10.0f;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)setTextLabel:(UILabel *)theTextLabel
{
    textLabel = theTextLabel;
    [self addSubview:theTextLabel];
}

+ (void)showToastInParentView: (UIView *)parentView withText:(NSString *)text withDuaration:(float)duration;
{
    
    //Count toast views are already showing on parent. Made to show several toasts one above another
    int toastsAlreadyInParent = 0;
    for (UIView *subView in [parentView subviews]) {
        if ([subView isKindOfClass:[iToast class]])
        {
            toastsAlreadyInParent++;
        }
    }
    
    CGRect parentFrame = parentView.frame;
    
    float yOrigin = parentFrame.size.height - (100.0 + ToastHeight * toastsAlreadyInParent + ToastGap * toastsAlreadyInParent);
    
    CGRect selfFrame = CGRectMake(parentFrame.origin.x + 20.0, yOrigin, parentFrame.size.width - 40.0, ToastHeight);
    iToast *toast = [[iToast alloc] initWithFrame:selfFrame];
    
    toast.backgroundColor = [UIColor darkGrayColor];
    toast.alpha = 0.0f;
    toast.layer.cornerRadius = 4.0;
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5.0, 5.0, toast.frame.size.width - 10.0, toast.frame.size.height - 10.0)];
    
    
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.textColor = [UIColor whiteColor];
    textLabel.numberOfLines = 2;
    textLabel.font = [UIFont systemFontOfSize:13.0];
    
    textLabel.lineBreakMode = NSLineBreakByCharWrapping;
    
    textLabel.text = text;
    
    [toast setTextLabel:textLabel];
    
    [parentView addSubview:toast];
    
    [UIView animateWithDuration:0.4 animations:^{
        toast.alpha = 0.9f;
        toast.textLabel.alpha = 0.9f;
    }completion:^(BOOL finished) {
        if(finished){
            
        }
    }];
    
    [toast performSelector:@selector(hideSelf) withObject:nil afterDelay:duration];
    
}

- (void)hideSelf
{
    [UIView animateWithDuration:0.4 animations:^{
        self.alpha = 0.0;
        self.textLabel.alpha = 0.0;
    }completion:^(BOOL finished) {
        if(finished){
            [self removeFromSuperview];
        }
    }];
}

@end