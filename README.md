# HRCheckBox
类似 WEB 的 checkBox，带左边或者右边的文案提示

1. 支持两种样式
typedef NS_ENUM(NSUInteger, RXCheckBoxStyle){
    RXCheckBoxStyle_left,//文字在左边
    RXCheckBoxStyle_right//文字在右边
};

2. 支持自定义图片和内置图片
- (id)initWithFrame:(CGRect)frame withOnImg:(UIImage *)onImg andOffImg:(UIImage *)offImg andTitle:(NSString *)title style:(RXCheckBoxStyle)checkStyle;
