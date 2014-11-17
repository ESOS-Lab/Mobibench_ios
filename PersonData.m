//
//  PersonData.m
//  DatabaseEx
//
//  Created by  on 12. 4. 17..
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PersonData.h"

@implementation PersonData

// 외부 접근이 가능하도록 설정
@synthesize name, telno, email;

// 초기화 함수
-(id)initWithName:(NSString*)n 
      phoneNumber:(NSString*)t 
         mailAddr:(NSString*)m
{
    // 전달받은 값을 저장
    self.name   = n;
    self.telno  = t;
    self.email  = m;
    
    // 아이디 리턴
    return self;
}

@end
