//
//  ViewController.m
//  AnimationTest
//
//  Created by DengHengYu on 2017/7/19.
//  Copyright © 2017年 YunJing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CAShapeLayer *startLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    _startLayer = [CAShapeLayer layer];
    _startLayer.frame = (CGRect){CGPointMake(0, 0),CGSizeMake(200, 200)};
    _startLayer.position = self.view.center;
    _startLayer.path = [self getStart1BezierPath].CGPath;
    _startLayer.fillColor = [UIColor clearColor].CGColor;
    _startLayer.strokeColor = [UIColor redColor].CGColor;
    _startLayer.lineWidth = 2.0f;
    [self.view.layer addSublayer:_startLayer];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pathAnimation) userInfo:nil repeats:YES];
   
}

- (void)pathAnimation {
    static int i = 0;
    if (i++ %2 == 0) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.fromValue = (__bridge id _Nullable)([self getStart1BezierPath].CGPath);
        animation.toValue = (__bridge id _Nullable)([self getStart2BezierPath].CGPath);
        animation.duration = 1;
        animation.removedOnCompletion = NO;
        _startLayer.path = [self getStart2BezierPath].CGPath;
        [_startLayer addAnimation:animation forKey:@"animationPath"];
    } else {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
        animation.fromValue = (__bridge id _Nullable)([self getStart2BezierPath].CGPath);
        animation.toValue = (__bridge id _Nullable)([self getStart1BezierPath].CGPath);
        animation.duration = 1;
        animation.removedOnCompletion = NO;

        _startLayer.path = [self getStart1BezierPath].CGPath;
        [_startLayer addAnimation:animation forKey:@"animationPath"];
    }
}

- (UIBezierPath *)getStart1BezierPath {
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint:CGPointMake(22.5, 2.5)];
    [starPath addLineToPoint:CGPointMake(28.32, 14.49)];
    [starPath addLineToPoint:CGPointMake(41.52, 16.32)];
    [starPath addLineToPoint:CGPointMake(31.92, 25.56)];
    [starPath addLineToPoint:CGPointMake(34.26, 38.68)];
    [starPath addLineToPoint:CGPointMake(22.5, 32.40)];
    [starPath addLineToPoint:CGPointMake(10.74, 38.68)];
    [starPath addLineToPoint:CGPointMake(13.08, 25.56)];
    [starPath addLineToPoint:CGPointMake(3.48, 16.32)];
    [starPath addLineToPoint:CGPointMake(16.68, 14.49)];
    [starPath closePath];
    return starPath;
}

- (UIBezierPath *)getStart2BezierPath {
    UIBezierPath *starPath = [UIBezierPath bezierPath];
    [starPath moveToPoint:CGPointMake(22.5, 2.5)];
    [starPath addLineToPoint:CGPointMake(32.15, 9.21)];
    [starPath addLineToPoint:CGPointMake(41.52, 16.32)];
    [starPath addLineToPoint:CGPointMake(38.12, 27.57)];
    [starPath addLineToPoint:CGPointMake(34.26, 38.68)];
    [starPath addLineToPoint:CGPointMake(22.5, 38.92)];
    [starPath addLineToPoint:CGPointMake(10.74, 38.68)];
    [starPath addLineToPoint:CGPointMake(6.88, 27.57)];
    [starPath addLineToPoint:CGPointMake(3.48, 16.32)];
    [starPath addLineToPoint:CGPointMake(12.85, 9.21)];
    [starPath closePath];
    return starPath;
}


- (void)bezier {
    CGPoint point1 = CGPointMake(10, 200);
    CGPoint point2 = CGPointMake(80, 100);
    CGPoint point3 = CGPointMake(150, 300);
    CGPoint point4 = CGPointMake(220, 200);
    CGPoint point5 = CGPointMake(90, 200);
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    
    [bezierPath moveToPoint:point1];
    [bezierPath addCurveToPoint:point4 controlPoint1:point2 controlPoint2:point3];
    //    [bezierPath addQuadCurveToPoint:point3 controlPoint:point2];
    //    [bezierPath addQuadCurveToPoint:point5 controlPoint:point4];
    
    
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.path = bezierPath.CGPath;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.fromValue = @(0.5);
    animation.toValue = @(0.0);
    animation.duration = 2.0;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation1.fromValue = @(0.5);
    animation1.toValue = @(1.0);
    animation1.duration = 2.0;
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"lineWidth"];
    animation2.fromValue = @(1.0);
    animation2.toValue = @(10.0);
    animation2.duration = 2.0;
    animation2.fillMode = kCAFillModeForwards;
    [animation2 setRemovedOnCompletion:NO];
    
    [shapeLayer addAnimation:animation forKey:nil];
    [shapeLayer addAnimation:animation1 forKey:nil];
    [shapeLayer addAnimation:animation2 forKey:nil];
    [self.view.layer addSublayer:shapeLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
