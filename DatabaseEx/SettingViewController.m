//
//  SettingViewController.m
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import "SettingViewController.h"
#import "iToast.h"
#import "PersonData.h"
#import "AppDelegate.h"
#import "ContentViewController.h"


@implementation SettingViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;

// data setting function
- (void)setName:(NSString*)n phoneNumber:(NSString*)t mailAddress:(NSString*)m
{
    name = n;
    telno = t;
    email = m;
}
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    
    UILabel *label1 = [[UILabel alloc]
                   initWithFrame:CGRectMake(50, 100, 200, 50)];
    [label1 setText:@"SQLite"];
    label1.font=[UIFont systemFontOfSize:50];
    [self.view addSubview:label1];
    //------------------------------------------------------------
    
    UIButton *ques = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *quesImg = [UIImage imageNamed:@"question.png"];
    ques.frame = CGRectMake(230, 80, 80, 80);
    [ques setImage:quesImg forState:UIControlStateNormal];
    [self.view addSubview:ques];
    
    [ques addTarget:self
                action:@selector(QuesAction)
      forControlEvents:UIControlEventTouchUpInside];
    
    //------------------------------------------------------------

    UIButton *Mode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Mode.frame = CGRectMake(50, 150, 200, 100);
    [Mode setTitle:@"Journal Mode" forState:UIControlStateNormal];
    Mode.titleLabel.font = [UIFont systemFontOfSize:25];
    Mode.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [Mode setSelected:YES];
    [Mode setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Mode setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [Mode setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [Mode setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.view addSubview:Mode];
    [Mode addTarget:self
                   action:@selector(ModeAction)
         forControlEvents:UIControlEventTouchUpInside];
    //------------------------------------------------------------
    UIButton *DBsize = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    DBsize.frame = CGRectMake(50, 200, 200, 100);
    [DBsize setTitle:@"Transaction" forState:UIControlStateNormal];
    DBsize.titleLabel.font = [UIFont systemFontOfSize:25];
    DBsize.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [DBsize setSelected:YES];
    [DBsize setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [DBsize setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [DBsize setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [DBsize setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
     [self.view addSubview:DBsize];
    [DBsize addTarget:self
             action:@selector(Dbsizeset)
   forControlEvents:UIControlEventTouchUpInside];
    //------------------------------------------------------------
    UILabel *label2 = [[UILabel alloc]
                   initWithFrame:CGRectMake(50, 450, 200, 40)];
    label2.font=[UIFont systemFontOfSize:50];
    [label2 setText:@"File I/O"];
    [self.view addSubview:label2];
    //------------------------------------------------------------
       UIButton *Filesize = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Filesize.frame = CGRectMake(350, 450, 200, 40);
    [Filesize setTitle:@"File Size" forState:UIControlStateNormal];
    Filesize.titleLabel.font = [UIFont systemFontOfSize:25];
    Filesize.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [Filesize setSelected:YES];
    [Filesize setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Filesize setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [Filesize setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [Filesize setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
     [self.view addSubview:Filesize];
    
    [Filesize addTarget:self
                 action:@selector(FileAction)
       forControlEvents:UIControlEventTouchUpInside];
    
    //------------------------------------------------------------
    UILabel *label3 = [[UILabel alloc]
                   initWithFrame:CGRectMake(50, 500, 300, 40)];
    label3.font=[UIFont systemFontOfSize:30];
    [label3 setText:@"Sequential Write"];
    [self.view addSubview:label3];
    //------------------------------------------------------------
    UIButton *Seq_IO = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Seq_IO.frame = CGRectMake(350, 500, 300, 40);
    [Seq_IO setTitle:@"Seq I/O Size" forState:UIControlStateNormal];
    Seq_IO.titleLabel.font = [UIFont systemFontOfSize:25];
    Seq_IO.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [Seq_IO setSelected:YES];    [Seq_IO setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Seq_IO setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [Seq_IO setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [Seq_IO setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.view addSubview:Seq_IO];
    [Seq_IO addTarget:self
                 action:@selector(IOAction)
       forControlEvents:UIControlEventTouchUpInside];
    //------------------------------------------------------------
    UILabel *label4 = [[UILabel alloc]
                       initWithFrame:CGRectMake(50, 550, 300, 40)];
    label4.font=[UIFont systemFontOfSize:30];
    [label4 setText:@"Random Write"];
    [self.view addSubview:label4];
    //------------------------------------------------------------
    UIButton *Ran_IO = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    Ran_IO.frame = CGRectMake(350, 550, 300, 40);
    [Ran_IO setTitle:@"Random Data Size" forState:UIControlStateNormal];
    Ran_IO.titleLabel.font = [UIFont systemFontOfSize:25];
    Ran_IO.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [Ran_IO setSelected:YES];
    [Ran_IO setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Ran_IO setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [Ran_IO setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [Ran_IO setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.view addSubview:Ran_IO];
    [Ran_IO addTarget:self
               action:@selector(R_IOAction)
     forControlEvents:UIControlEventTouchUpInside];
    //------------------------------------------------------------

    UIButton *fMode = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    fMode.frame = CGRectMake(350, 600, 300, 40);
    [fMode setTitle:@"Mode" forState:UIControlStateNormal];
    fMode.titleLabel.font = [UIFont systemFontOfSize:25];
    fMode.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [fMode setSelected:YES];
    [fMode setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [fMode setTitleColor:[UIColor purpleColor] forState:UIControlStateHighlighted];
    [fMode setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [fMode setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.view addSubview:fMode];
    [fMode addTarget:self
                   action:@selector(Mode)
         forControlEvents:UIControlEventTouchUpInside];
    //------------------------------------------------------------
   
    
    
   
   
   
}

- (void)QuesAction
{
    ContentViewController *adddata = [[ContentViewController alloc]init];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Current System Status"
                                                   message:[NSString stringWithFormat:@"Journal mode : %s \n Transaction : %d \n   File Size : %d MB \n Sequential I/O size : %d KB \n Random Data Size : %d Byte \n Mode : %s",[delegate journalGet], [adddata getdbsize], [adddata getfilesize]/(1024*1024), [adddata getiosize_seq]/1024,[adddata getdatasize], [adddata getmode]]
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:nil];
    [alert show];
    
}

- (void)ModeAction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Journal Mode Select"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"WAL",@"DEL",nil];
    alert.tag=1;
       [alert show];

}

- (void)IOAction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Sequential IO Size Select"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"256KB",@"512KB",@"768KB",nil];
    alert.tag=2;

    [alert show];
    
}



- (void)FileAction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"File size Select"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"32MB",@"64MB",@"128MB",nil];
    alert.tag=3;

    [alert show];
    
}
- (void)Mode
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Mode"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"Buffered I/O",@"fsync",@"F_NOCACHE",nil];
    alert.tag=4;
    
    [alert show];
    
}

- (void)Dbsizeset
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Transaction"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"100",@"500",@"1000",nil];
    alert.tag=5;
    [alert show];
    
}

- (void)R_IOAction
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Random Data Size Select"
                                                   message: nil
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"64Byte",@"4KB",nil];
    alert.tag=6;
    
    [alert show];
    
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (alertView.tag == 1){
        AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    if(buttonIndex==1){
       [iToast showToastInParentView:self.view withText:@"Journal Mode : WAL" withDuaration:2.0];
               [delegate journalChange:@"WAL"];
        
        }
    if (buttonIndex==2) {
        [iToast showToastInParentView:self.view withText:@"Journal Mode : OFF" withDuaration:2.0];
        [delegate journalChange:@"OFF"];
        
        }
    if (buttonIndex==3) {
        
        [iToast showToastInParentView:self.view withText:@"Journal Mode : PER" withDuaration:2.0];
         [delegate journalChange:@"PERSIST"];
        }
    if (buttonIndex==4) {
        
        [iToast showToastInParentView:self.view withText:@"Journal Mode : TRU" withDuaration:2.0];
         [delegate journalChange:@"TRUNCATE"];
        }
    if (buttonIndex==5) {
        
        [iToast showToastInParentView:self.view withText:@"Journal Mode : DEL" withDuaration:2.0];
         [delegate journalChange:@"DELETE"];
        }
    if (buttonIndex==6) {
        
        [iToast showToastInParentView:self.view withText:@"Journal Mode : MEM" withDuaration:2.0];
        [delegate journalChange:@"MEMORY"];
        }
    }
    if (alertView.tag == 2){
        ContentViewController *adddata = [[ContentViewController alloc]init];
        
        if(buttonIndex==1){
            [adddata setiosize_seq:1024*256];
        }
        if(buttonIndex==2){
            [adddata setiosize_seq:1024*512];
        }
        if(buttonIndex==3){
            [adddata setiosize_seq:1024*768];
        }
     }
    
    if (alertView.tag == 3){
        ContentViewController *adddata = [[ContentViewController alloc]init];
        
        if(buttonIndex==1){
            [adddata setfilesize:1024*1024*32];
        }
        if(buttonIndex==2){
            [adddata setfilesize:1024*1024*64];
        }
        if(buttonIndex==3){
            [adddata setfilesize:1024*1024*128];
        }
    }
    if (alertView.tag == 4){
        ContentViewController *adddata = [[ContentViewController alloc]init];
        
        if(buttonIndex==1){
            [adddata setmode:0];
        }
        if(buttonIndex==2){
            [adddata setmode:1];
        }
        if(buttonIndex==3){
            [adddata setmode:2];
        }
        
    }
    if (alertView.tag == 5){
        ContentViewController *adddata = [[ContentViewController alloc]init];
        
        if(buttonIndex==1){
            [adddata setdbsize:100];
        }
        if(buttonIndex==2){
            [adddata setdbsize:500];
        }
        if(buttonIndex==3){
            [adddata setdbsize:1000];
        }
        
    }
    if (alertView.tag == 6){
        ContentViewController *adddata = [[ContentViewController alloc]init];
        
        if(buttonIndex==1){
            [adddata setdatasize:64];
        }
        if(buttonIndex==2){
            [adddata setdatasize:4096];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background1.png"]];
    [self.view addSubview:backgroundImage];
    [self configureView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
@end
