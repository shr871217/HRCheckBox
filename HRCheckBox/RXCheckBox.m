//
//  RXCheckBox.m
//  Car
//
//  Created by hongrisong on 14-9-2.
//  Copyright (c) 2014年  All rights reserved.
//

#define kcheckBoxSize      22

#import "RXCheckBox.h"

@implementation RXCheckBox

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        checkOnImg = [UIImage imageNamed:@"r_checkon"];
        checkOffImg = [UIImage imageNamed:@"r_checkoff"];
        checkStyle = RXCheckBoxStyle_left;
        checkTitle = title;
        
        [self initView];
        
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title style:(RXCheckBoxStyle)rcheckStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        checkOnImg = [UIImage imageNamed:@"r_checkon"];
        checkOffImg = [UIImage imageNamed:@"r_checkoff"];
        checkStyle = rcheckStyle;
        checkTitle = title;
        
        [self initView];
        
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame withOnImg:(UIImage *)onImg andOffImg:(UIImage *)offImg andTitle:(NSString *)title style:(RXCheckBoxStyle)RcheckStyle
{
    self = [super initWithFrame:frame];
    if (self) {
        checkOnImg = onImg;
        checkOffImg = offImg;
        checkTitle = title;
        checkStyle = RcheckStyle;
        
        [self initView];
    }
    return self;
}

- (void)initView
{
    self.backgroundColor = [UIColor clearColor];

    NSInteger leftGap = 0;
    if(checkTitle !=nil && checkTitle.length > 0){
        lbTitle = [[UILabel alloc] initWithFont:[UIFont systemFontOfSize:14.0f] andText:checkTitle];
        lbTitle.backgroundColor = [UIColor clearColor];
        CGSize fontSize = [checkTitle sizeWithFontCompatible:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(self.frame.size.width - kcheckBoxSize, self.frame.size.height) lineBreakMode:NSLineBreakByTruncatingTail];
        lbTitle.frame = CGRectMake(0, 0, fontSize.width, self.frame.size.height);
        lbTitle.lineBreakMode = NSLineBreakByTruncatingTail;
        lbTitle.textAlignment = NSTextAlignmentLeft;
        leftGap = fontSize.width + 3;
        [self addSubview:lbTitle];
    }
    
    checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    checkBtn.backgroundColor = [UIColor clearColor];
    checkBtn.frame = CGRectMake(leftGap, (self.frame.size.height - kcheckBoxSize)/2, kcheckBoxSize, kcheckBoxSize);
    [checkBtn addTarget:self action:@selector(checkBoxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self setViewImg];
    [self addSubview:checkBtn];
    
    if(checkStyle == RXCheckBoxStyle_left){//文字在左边
        CGSize fontSize = [checkTitle sizeWithFontCompatible:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(self.frame.size.width - kcheckBoxSize, self.frame.size.height) lineBreakMode:NSLineBreakByTruncatingTail];
        leftGap = fontSize.width + 3;
        lbTitle.frame = CGRectMake(0, 0, fontSize.width, self.frame.size.height);
        checkBtn.frame = CGRectMake(leftGap, (self.frame.size.height - kcheckBoxSize)/2, kcheckBoxSize, kcheckBoxSize);
        [self setViewWidth:checkBtn.frame.origin.x + kcheckBoxSize + 3];
    }else{
        checkBtn.frame = CGRectMake(0, (self.frame.size.height - kcheckBoxSize)/2, kcheckBoxSize, kcheckBoxSize);
        CGSize fontSize = [checkTitle sizeWithFontCompatible:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(self.frame.size.width - kcheckBoxSize, self.frame.size.height) lineBreakMode:NSLineBreakByTruncatingTail];
        lbTitle.frame = CGRectMake(kcheckBoxSize + 3, 0, fontSize.width, self.frame.size.height);
        [self setViewWidth:lbTitle.frame.origin.x + fontSize.width + 3 ];
    }
    
}

//点击事件
- (void)checkBoxClick:(id)sender
{
    _on = !_on;
    [self setViewImg];
    if(_delegate && [_delegate respondsToSelector:@selector(RXCheckBox:checkStatus:)]){
        [_delegate RXCheckBox:self checkStatus:_on];
    }
}

- (void)setViewImg
{
    if(_on){//如果默认让选中的话
        [checkBtn setImage:checkOnImg forState:UIControlStateNormal];
    }else{
        [checkBtn setImage:checkOffImg forState:UIControlStateNormal];
    }
}

/**
 *  可以设置默认是选中还是不选中
 *
 *  @param check yes 选中 no
 */
- (void)setCheckOn:(BOOL)check
{
    _on = check;
    [self setViewImg];
    if(_delegate && [_delegate respondsToSelector:@selector(RXCheckBox:checkStatus:)]){
        [_delegate RXCheckBox:self checkStatus:_on];
    }
}

@end
