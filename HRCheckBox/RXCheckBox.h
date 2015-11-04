//
//  RXCheckBox.h
//  Car
//
//  Created by hongrisong on 14-9-2.
//  Copyright (c) 2014年  All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, RXCheckBoxStyle){
    RXCheckBoxStyle_left,//文字在左边
    RXCheckBoxStyle_right
};


@protocol RXCheckBoxDelegate <NSObject>

- (void)RXCheckBox:(UIView *)view checkStatus:(BOOL)agree;

@end

@interface RXCheckBox : UIView
{
    UIImage *checkOnImg;//当前同意显示的
    UIImage *checkOffImg;//
    UIButton *checkBtn;
    RXCheckBoxStyle checkStyle;
    NSString *checkTitle;
    UILabel *lbTitle;//现实的文字
}

@property (nonatomic,readonly) BOOL on;//外部获取状态
@property (nonatomic,assign) id<RXCheckBoxDelegate> delegate;


/**
 *  默认使用RXCheckBoxStyle_left 的样式，即文字在左边
 *
 *  @param frame
 *  @param title 如果没有title 传nil 或 空都行，如果中间的距离可以通过空格来调整
 *
 *  @return
 */
- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title style:(RXCheckBoxStyle)checkStyle;

- (id)initWithFrame:(CGRect)frame withOnImg:(UIImage *)onImg andOffImg:(UIImage *)offImg andTitle:(NSString *)title style:(RXCheckBoxStyle)checkStyle;

/**
 *  可以设置默认是选中还是不选中
 *
 *  @param check yes 选中 no
 */
- (void)setCheckOn:(BOOL)check;

@end
