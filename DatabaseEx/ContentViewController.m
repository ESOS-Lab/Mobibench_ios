//
//  ContentViewController.m
//  Hybench
//
//  Created by  on 14. 11. 10..
//  __Kim namwoo, Lee jongwon__
//

#import "ContentViewController.h"

#import "AppDelegate.h"
#import "ContentViewController.h"
#import "TabViewController.h"
#include <stdlib.h>
#import "SettingViewController.h"
#import <UIKit/UIKit.h>
#include "fcntl.h"
#include "unistd.h"

#import "AppDelegate.h"
#import "PersonData.h"
#import "UIDevice-Hardware.h"

@implementation ContentViewController
- (void) setiosize_seq:(int)value { iosize_seq = value; }
- (int) getiosize_seq{return iosize_seq;}
- (void) setfilesize:(int)value2{ filesize = value2; }
- (int) getfilesize{return filesize;}
- (void) setmode:(int)value3{ mode= value3; }
- (char *) getmode{
    char* temp =NULL;
    if(mode==0)
        temp = "Normal";
    else if(mode==1)
        temp = "fsync";
    else
        temp = "F_NOCACHE";
        return temp;}
- (void) setdbsize:(int)value4{ dbsize= value4; }
- (int) getdbsize{return dbsize;}
- (void) setdatasize:(int)value5{ datasize= value5; }
- (int) getdatasize{return datasize;}

int iosize_seq=1024*256;
int filesize = 1024*1024*128;
int mode=0;
int dbsize=100;
int datasize=4096;

- (void)showAddView
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss:SSS"];
    
    
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSString *phoneModel = [[UIDevice currentDevice] platformString];
    NSString *current_iOS = [[UIDevice currentDevice] systemVersion];
    
    NSString *currentTime = [dateFormatter stringFromDate:today];
    
    NSLog(@"%@",currentTime);
    for(int i=0 ; i<dbsize;i++){
        [delegate insertDataWithName:@"AAAAAAAAAABBBBBBBBBBCCCCCCCCCCDDDDDDDDDDEEEEEEEEEEFFFFFFFFFFGGGGGGGGGGHHHHHHHHHHIIIIIIIIIIJJJJJJJJJJ"
                         phoneNumber:NULL
                        emailAddress:NULL];
        
    }
    NSDate *today2 = [NSDate date];
    NSString *currentTime2 = [dateFormatter stringFromDate:today2];
    NSLog(@"%@",currentTime2);
    
    NSTimeInterval diff = [today2 timeIntervalSinceDate:today];
    NSLog(@"%lf",diff);
    
    NSString * strRR = [NSString stringWithFormat:@"Device Model : %@ \nOS version : %@\n Journal mode : %s \nExcution per sec : %@ \nPage size of this device : %ldKB", phoneModel, current_iOS, [delegate journalGet] ,[NSString stringWithFormat:@"%.01lf", dbsize/diff], sysconf(_SC_PAGESIZE)];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Insert 검사 결과"
                                                   message: strRR
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"UpdatedDatabase" object:nil userInfo:nil];
    
}

- (void)showUpdateView
{
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss:SSS"];
    
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSString *phoneModel = [[UIDevice currentDevice] platformString];
    NSString *current_iOS = [[UIDevice currentDevice] systemVersion];
    
    NSString *currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"%@",currentTime);
    
    for(int i=0 ; i<dbsize;i++){
        
        [delegate updateWithName:@"KKKKKKKKKKLLLLLLLLLLMMMMMMMMMMNNNNNNNNNOOOOOOOOOOPPPPPPPPPPQQQQQQQQQQRRRRRRRRRSSSSSSSSSTTTTTTTTTT"
                     phoneNumber:NULL
                    emailAddress:NULL
                         oldName:@"AAAAAAAAAABBBBBBBBBBCCCCCCCCCCDDDDDDDDDDEEEEEEEEEEFFFFFFFFFFGGGGGGGGGGHHHHHHHHHHIIIIIIIIIIJJJJJJJJJJ"
         ];
        
    }
    NSDate *today2 = [NSDate date];
    NSString *currentTime2 = [dateFormatter stringFromDate:today2];
    NSLog(@"%@",currentTime2);
    
    NSTimeInterval diff = [today2 timeIntervalSinceDate:today];
    NSLog(@"%lf",diff);
    
    NSString * strRR = [NSString stringWithFormat:@"Device Model : %@ \nOS version : %@\n Journal mode : %s \nExcution per sec : %@ \nPage size of this device : %ldKB", phoneModel, current_iOS, [delegate journalGet] ,[NSString stringWithFormat:@"%.01lf", dbsize/diff], sysconf(_SC_PAGESIZE)];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Update 검사 결과"
                                                   message: strRR
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"UpdatedDatabase" object:nil userInfo:nil];
    
}


- (void)showDeleteView
{
    
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss:SSS"];
    
    
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    NSString *phoneModel = [[UIDevice currentDevice] platformString];
    NSString *current_iOS = [[UIDevice currentDevice] systemVersion];
    NSString *currentTime = [dateFormatter stringFromDate:today];
    NSLog(@"%@",currentTime);
    
    for(int i=0 ; i<dbsize;i++){
        [delegate
         deleteDataWithName:NULL
         phoneNumber:NULL
         emailAddress:NULL
         oldName:NULL
         ];
    }
    NSDate *today2 = [NSDate date];
    NSString *currentTime2 = [dateFormatter stringFromDate:today2];
    NSLog(@"%@",currentTime2);
    
    NSTimeInterval diff = [today2 timeIntervalSinceDate:today];
    NSLog(@"%lf",diff);
    
     NSString * strRR = [NSString stringWithFormat:@"Device Model : %@ \nOS version : %@\n Journal mode : %s \nExcution per sec : %@ \nPage size of this device : %ldKB", phoneModel, current_iOS, [delegate journalGet] ,[NSString stringWithFormat:@"%.01lf", dbsize/diff], sysconf(_SC_PAGESIZE)];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"Delete 검사 결과"
                                                   message: strRR
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    
    
    
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"UpdatedDatabase" object:nil userInfo:nil];
}

// fwrite
- (void)showfWriteView
{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss:SSS"];
    
    char arr1[iosize_seq];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex: 0];
    NSString *docFile = [docDir stringByAppendingPathComponent: @"deck.txt"];
    [[NSFileManager defaultManager] createFileAtPath:docFile contents:nil attributes:nil];
    const char *doc = [docFile cStringUsingEncoding:[NSString defaultCStringEncoding]];

    int fd= open(doc, O_RDWR);
    for(int i=0;i<iosize_seq;i++) //fill 'a' as IO size
        arr1[i]='a';
    
    
    NSString* str1 = [NSString stringWithCString:arr1 encoding:NSASCIIStringEncoding];
    
    NSFileHandle *myHandle = [[NSFileHandle alloc] initWithFileDescriptor:fd];
    
    //sequential write...
    // Create handle for file to update content
    myHandle = [NSFileHandle fileHandleForUpdatingAtPath:docFile];
    //[myHandle seekToEndOfFile];
    NSDate *t2 = [NSDate date];             //timestamp 1
 
    for(int i=0;i<filesize/iosize_seq;i++)
       [myHandle writeData: [str1 dataUsingEncoding:NSUTF8StringEncoding]];
    NSDate *t3 = [NSDate date];             //timestamp 2
    NSTimeInterval diff = [t3 timeIntervalSinceDate:t2];
    NSLog(@"sequential write time : %lf",diff);
    
    //random write...
    //create random numbers
    
    //shuffle algorith
    int offnum = filesize/4096;
    int arr2[offnum];
   // int* arr2=(int *)malloc(sizeof(int) * offnum);
    int temp;
    NSInteger n,m;
    for (int i=0; i<offnum; i++)
     arr2[i]=i;  //initiate offset numbers
    for (int i=0; i<offnum/1024; i++)
    {
        n = arc4random()%offnum;
        m = arc4random()%offnum;
        temp=arr2[n];
        arr2[n]=arr2[m];
        arr2[m]=temp;
    }
   
    char arr3[datasize];
   // char *arr3=(char*)malloc(sizeof(char)*datasize);
    for(int i=0;i<datasize;i++) //fill 'b' as IO size
     arr3[i]='b';
    
    NSString* str2 = [NSString stringWithCString:arr3 encoding:NSASCIIStringEncoding];
     NSDate *t4 = [NSDate date];             //timestamp 1
    if(mode==0) //without fsync mode
{
       // Write data to file
    for(int i=0;i<(filesize/4096);i++)
    {
     // [myHandle seekToEndOfFile];
      [myHandle seekToFileOffset:arr2[i]*4096];
      [myHandle writeData:  [str2 dataUsingEncoding:NSUTF8StringEncoding]];
    
    }
    
}
    else if(mode ==1)       //fsync mode
{
    // Write data to file
    for(int i=0;i<(filesize/4096);i++)
    {
      //  [myHandle seekToEndOfFile];
        [myHandle seekToFileOffset:arr2[i]*4096];
        [myHandle writeData:  [str2 dataUsingEncoding:NSUTF8StringEncoding]];
        fsync([myHandle fileDescriptor]);
        
        //fcntl([myHandle fileDescriptor],O_FSYNC);
    }
    
}
    
    else
    {
        fcntl([myHandle fileDescriptor],F_NOCACHE);
        for(int i=0;i<(filesize/4096);i++)
        {
            
            
           // [myHandle seekToEndOfFile];
            [myHandle seekToFileOffset:arr2[i]*4096];
            [myHandle writeData:  [str2 dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
    }
    NSDate *t5 = [NSDate date];             //timestamp 2

    // NSString *c5 = [dateFormatter stringFromDate:t5];
    // NSLog(@"%@",c5);
    
    NSTimeInterval diff2 = [t5 timeIntervalSinceDate:t4];
    NSLog(@"random write time : %lf\n file size = %d\n iosize = %d",diff2,filesize/1048576,iosize_seq);
    
    ContentViewController *adddata = [[ContentViewController alloc]init];
    NSString * strRR = [NSString stringWithFormat:@"sequential write (MB/sec) : %.0lf\n random write (IOPS): %.0lf\n file size = %dMB\n sequential iosize = %dKB \nrandom data size = %dByte\nMode: %s ", filesize/diff/1048576,(filesize/diff2)/4096,filesize/1048576,iosize_seq/1024,datasize,[adddata getmode]];
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle: @"File I/O 검사 결과"
                                                   message: strRR
                                                  delegate: self
                                         cancelButtonTitle:@"Cancel"
                                         otherButtonTitles:@"OK",nil];
    [alert show];
    
    [myHandle closeFile];
    [[NSFileManager defaultManager] removeItemAtPath:docFile error:nil];
    
    
}


- (void)showdeleteView
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex: 0];
    NSString *docFile = [docDir stringByAppendingPathComponent: @"deck.txt"];
    
    // NSString *str = [NSString stringWithContentsOfFile:docFile encoding:NSUTF8StringEncoding error:NULL];
    
    NSError *error = nil;
    
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:docFile error:&error];
    
    NSNumber *fileSizeNumber = [fileAttributes objectForKey:NSFileSize];
    long long fileSize2 = [fileSizeNumber longLongValue];
    
    NSLog(@"%lli",fileSize2);
    [[NSFileManager defaultManager] removeItemAtPath:docFile error:&error];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.title = NSLocalizedString(@"Master", @"Master");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background1.png"]];
    [self.view addSubview:backgroundImage];
    
    UIButton *INSERT = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *INSERTImg = [UIImage imageNamed:@"insert.png"];
    INSERT.frame = CGRectMake(120, 250, 150, 150);
    [INSERT setImage:INSERTImg forState:UIControlStateNormal];
    [self.view addSubview:INSERT];

    UIButton *DELETE = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *DELETEImg = [UIImage imageNamed:@"delete.png"];
    DELETE.frame = CGRectMake(320, 250, 150, 150);
    [DELETE setImage:DELETEImg forState:UIControlStateNormal];
    [self.view addSubview:DELETE];
    
    UIButton *UPDATE = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *UPDATEImg = [UIImage imageNamed:@"update.png"];
    UPDATE.frame = CGRectMake(520, 250, 150, 150);
    [UPDATE setImage:UPDATEImg forState:UIControlStateNormal];
    [self.view addSubview:UPDATE];
    
    UIButton *fWRITE = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *fWRITEImg = [UIImage imageNamed:@"fwrite.png"];
    fWRITE.frame = CGRectMake(220, 550, 150, 150);
    [fWRITE setImage:fWRITEImg forState:UIControlStateNormal];
    [self.view addSubview:fWRITE];
    
    UIButton *fDELETE = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *fDELETEImg = [UIImage imageNamed:@"fdelete.png"];
    fDELETE.frame = CGRectMake(420, 550, 150, 150);
    [fDELETE setImage:fDELETEImg forState:UIControlStateNormal];
    [self.view addSubview:fDELETE];
    
    [INSERT addTarget:self
                   action:@selector(showAddView)
         forControlEvents:UIControlEventTouchUpInside];
    
    [DELETE addTarget:self
               action:@selector(showDeleteView)
     forControlEvents:UIControlEventTouchUpInside];
    
    [UPDATE addTarget:self
               action:@selector(showUpdateView)
     forControlEvents:UIControlEventTouchUpInside];
    
    [fWRITE addTarget:self
               action:@selector(showfWriteView)
     forControlEvents:UIControlEventTouchUpInside];
    
    [fDELETE addTarget:self
               action:@selector(showdeleteView)
     forControlEvents:UIControlEventTouchUpInside];
    

}


- (void)viewDidUnload
{
    [super viewDidUnload];
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

@end
