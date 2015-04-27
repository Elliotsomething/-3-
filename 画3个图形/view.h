//
//  view.h
//  画3个图形
//
//  Created by mac book on 13-6-25.
//  Copyright (c) 2013年 mac book. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface view : UIView{
    int b;
    CGPoint loc;
    NSMutableArray *arr;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
}
//不要开辟内存的就用assign或者weak，要开内存的就要用retain或strong。。。数字类型的都不要开内存
//@property(assign)NSInteger b;
-(void)drawincontext:(CGContextRef)context;
-(void)clear:(int )a;
@end
