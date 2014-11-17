//
//  PersonData.h
//  DatabaseEx
//
//  Created by  on 12. 4. 17..
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonData : NSObject
{
    NSString *name;     // 이름
    NSString *telno;    // 전화번호
    NSString *email;    // 이메일 주소
}
    
// 속성 추가
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSString *telno;
@property (nonatomic, retain) NSString *email;

// 초기화 함수
-(id)initWithName:(NSString*)n 
      phoneNumber:(NSString*)t 
         mailAddr:(NSString*)m;

@end
