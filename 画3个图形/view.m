//
//  view.m
//  画3个图形
//
//  Created by mac book on 13-6-25.
//  Copyright (c) 2013年 mac book. All rights reserved.
//

#import "view.h"
@implementation view


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)clear:(int)a{
    b=a;
    //arr=[[NSMutableArray alloc]init];
    [self setNeedsDisplay];
    
}

-(void)drawincontext:(CGContextRef)context{
    
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 10.0);

//画当前图形
    if(b==3){
        if([arr count]>0){
        CGPoint p3=CGPointFromString([arr objectAtIndex:0]);
        CGPoint e3=CGPointFromString([arr objectAtIndex:[arr count]-1]);
       float f3= sqrtf((p3.x-e3.x)*(p3.x-e3.x)+(p3.y-e3.y)*(p3.y-e3.y));
    CGRect re=CGRectMake(e3.x, e3.y, f3, f3);
    CGContextAddEllipseInRect(context, re);
       // b=0;
        }
    }
    if(b==1){
        if([arr count]>0){
            
        CGPoint p=CGPointFromString([arr objectAtIndex:0]);
        CGPoint e=CGPointFromString([arr objectAtIndex:[arr count]-1]);
        float f1= sqrtf((p.x-e.x)*(p.x-e.x)+(p.y-e.y)*(p.y-e.y));
    CGContextMoveToPoint(context, p.x, p.y);
        
       
     CGContextAddLineToPoint(context, e.x, e.y);
        
    CGContextAddLineToPoint(context, f1, f1);
    CGContextAddLineToPoint(context, p.x, p.y);
    CGContextAddLineToPoint(context, e.x, e.y);

       // b=0;
            
        }

    }
    if (b==2) {
        if([arr count]>0){
        CGPoint p2=CGPointFromString([arr objectAtIndex:0]);
        CGPoint e2=CGPointFromString([arr objectAtIndex:[arr count]-1]);
        float f2= sqrtf((p2.x-e2.x)*(p2.x-e2.x)+(p2.y-e2.y)*(p2.y-e2.y));
        CGRect re1=CGRectMake(e2.x, e2.y, f2, f2);
        CGContextAddRect(context, re1);
        }
    }
    
    //重画前面的图形
    
    if ([arr1 count]>0)
    {
        for (int i=0; i<[arr1 count]; i++) {
            NSArray *a11=[NSArray arrayWithArray:[arr1 objectAtIndex:i]];
            if ([a11 count]>0) {
                
                
                CGPoint p=CGPointFromString([a11 objectAtIndex:0]);
                CGPoint e=CGPointFromString([a11 objectAtIndex:[a11 count]-1]);
                float f1= sqrtf((p.x-e.x)*(p.x-e.x)+(p.y-e.y)*(p.y-e.y));
                CGContextMoveToPoint(context, p.x, p.y);
                CGContextAddLineToPoint(context, e.x, e.y);
                
                CGContextAddLineToPoint(context, f1, f1);
                CGContextAddLineToPoint(context, p.x, p.y);
                CGContextAddLineToPoint(context, e.x, e.y);
            }
        }
    }
    if ([arr2 count]>0) {
        for (int i=0; i<[arr2 count]; i++) {
            NSArray *a22=[NSArray arrayWithArray:[arr2 objectAtIndex:i]];
            if ([a22 count]>0) {
                CGPoint p2=CGPointFromString([a22 objectAtIndex:0]);
                CGPoint e2=CGPointFromString([a22 objectAtIndex:[a22 count]-1]);
                float f2= sqrtf((p2.x-e2.x)*(p2.x-e2.x)+(p2.y-e2.y)*(p2.y-e2.y));
                CGRect re1=CGRectMake(e2.x, e2.y, f2, f2);
                CGContextAddRect(context, re1);
            }
        }
    }
    if ([arr3 count]>0) {
        for (int i=0; i<[arr3 count]; i++) {
            NSArray *a33=[NSArray arrayWithArray:[arr3 objectAtIndex:i]];
            if ([a33 count]>0) {
                CGPoint p3=CGPointFromString([a33 objectAtIndex:0]);
                CGPoint e3=CGPointFromString([a33 objectAtIndex:[a33 count]-1]);
                float f3= sqrtf((p3.x-e3.x)*(p3.x-e3.x)+(p3.y-e3.y)*(p3.y-e3.y));
                CGRect re=CGRectMake(e3.x, e3.y, f3, f3);
                CGContextAddEllipseInRect(context, re);
            }
        }
    }
    
    CGContextStrokePath(context);
}



-(void)drawRect:(CGRect)rect{
    CGContextRef context=UIGraphicsGetCurrentContext();
    [self drawincontext:context];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (arr==nil) {
        arr=[[NSMutableArray alloc]init ];
        arr1=[[NSMutableArray alloc] init];
        arr2=[[NSMutableArray alloc]init];
        arr3=[[NSMutableArray alloc]init];
    }
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[touches anyObject];
    loc=[touch locationInView:self];
    NSString *str=NSStringFromCGPoint(loc);
    [arr addObject:str];
    [self setNeedsDisplay];
    
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSArray *a1=[NSArray arrayWithArray:arr];
    if (b==1) {
        [arr1 addObject:a1];
    }
    if (b==2) {
        [arr2 addObject:a1];
    }
    if (b==3) {
        [arr3 addObject:a1];
    }
    arr=[[NSMutableArray alloc] init];
    
}

@end
