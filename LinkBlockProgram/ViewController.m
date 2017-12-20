//
//  ViewController.m
//
//  Created by NOVO on 15/8/18.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "ViewController.h"
#import "LinkBlock.h"
#import "Person.h"
#import "Man.h"


#import "LinkHelper.h"
#import "DynamicLinkBlock.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "LinkBlockInvocation.h"

#define macroScreenWidth ([UIScreen mainScreen].bounds.size.width)
#define macroScreenHeight ([UIScreen mainScreen].bounds.size.height)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelOfABC;
@property (nonatomic,strong) dispatch_source_t timer;

@property (weak, nonatomic) IBOutlet UIButton *btnTest;

@property (nonatomic,strong) NSValue* value;
@end

@implementation ViewController

- (NSValue*)getXX
{
//     void* man = (__bridge_retained void*)[Man new];
    NSNumber* man = [NSNumber numberWithDouble:123.456];
    
//    NSString* man = [@"123456ABCDEFG" substringWithRange:NSMakeRange(0, 3)];
//    man = reallocf(man, sizeof(man));
    CFBridgingRetain(man);
    @"call getXX:".nslog();
    
    NSValue* re = [NSValue valueWithBytes:&man objCType:@encode(NSNumber*)];
//    free(man);
    return re;
}

//    NSValue* v = [self getXX];
//
//    NSNumber* rect;
//    [v getValue:&rect];
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSValue* v = [[LinkHelper help:@" @\"我 的 你 的 妈 的\" "] valueFromValueCodeOfNSString];
//    const char* ocTyp = v.objCType;
//    NSString* rect;
//    [v getValue:&rect];
    
    //[a-zA-Z_]+\\d*\\s*\(
    
    id block = [NSObject valueForKey:@"strSubFromTo"];
    BOOL contain = [NSObject classContainProperty:@"strSubFromTo"];
    LinkBlockInvocation* inoke =[LinkBlockInvocation invocationWithBlock:block];
    NSMethodSignature* sig = inoke.methodSignature;
    NSMutableArray* objcTypesArr = [NSMutableArray new];
    for (NSUInteger i=1; i<sig.numberOfArguments; i++) {
        
        const char* objcType = [sig getArgumentTypeAtIndex:i];
        [objcTypesArr addObject:[NSString stringWithUTF8String:objcType]];
    }
    
    @"End of test".nslog();
    return;
    //////////////////////////////////////////////////////////////////////
    //【一】基础语法
    //////////////////////////////////////////////////////////////////////
    //不需要取值的情况如：
    //添加一个标签到视图上
    [UILabelNew
     .labText(@"LinkBlock").labAlignment(NSTextAlignmentCenter).labFont([UIFont systemFontOfSize:25])
     .viewSetFrame(0,64+20,macroScreenWidth,150)
     .viewBGColor(@"#42a7f4".strToUIColorFromHex()).labTextColor([UIColor whiteColor])
     .viewAddToView(self.view)
     
     linkAfterIn:0 block:^(NSObject *link) {
         link.viewAnimateFlipFromLeft(5,NSNotFound,NO);
     }];
    
    
    //需要取值的情况：
    //链首对象可能为nil需要使用linkObj包裹，报错则需要使用linkEnd获取真实的值
    NSString* priceFromNet = nil;//如果网络获取的对象为空
    NSString* priceStr = linkObj(priceFromNet).strAppend(@"￥").linkEnd;//这里控制台会打印异常信息
    
    //////////////////////////////////////////////////////////////////////
    //【二】条件语法
    //////////////////////////////////////////////////////////////////////
    //...linkIf(...)...linkIf(...)...linkElse...
    NSNumber* aNumber = @(arc4random_uniform(100));//设置随机数
    //判断并打印随机数的奇偶性
    //if(aNumber.integerValue%2 == 0){
    //    NSLog(@"%@是奇数",aNumber);
    //}else{
    //    NSLog(@"%@是偶数",aNumber);
    //}
    //上方代码可写成如下形式
    
    aNumber.description
    .linkIf(aNumber.numIsOdd()).strAppend(@"是奇数").nslog()
    .linkElse.strAppend(@"是偶数").nslog();

    //////////////////////////////////////////////////////////////////////
    //【三】多链条语法
    //////////////////////////////////////////////////////////////////////
    //1.如果使用多个对象的链式编程，需要取值的时候请调用ends()获取多个结果
    //2.如果调用end只会取得第一个对象的链条返回值
    //3.使用endsAt()可以获取指定index对象的链条返回值
    //4.如果链条结尾返回的是“值类型”，那么该值是第一个对象的链条返回值
    //5.使用项目中的“方法”对多对象的链式编程不起作用
    //写法一
    UIView* viewA = UIViewNew.viewSetFrame(0,64+20+150,macroScreenWidth,20);
    UIView* viewB = UIViewNew.viewSetFrame(0,64,macroScreenWidth,20);
    [linkObjs(viewA, viewB).viewAddToView(self.view).viewBGColor(@(0xcccccc).numToUIColorFromHex())
     
     linkAfterIn:2.5 block:^(NSObject *link) {
         
         link.viewAnimateFlipFromLeft(5,NSNotFound,NO);
     }];
    //写法二
    NSMutableArray* arrA = [NSMutableArray arrayWithObjects:@"A", nil];
    NSMutableArray* arrB = [NSMutableArray arrayWithObjects:@"B", nil];
    NSMutableArray* arrC = [NSMutableArray arrayWithObjects:@"C", nil];
    NSArray* linkResults = @[arrA,arrB,arrC].makeLinkObjs.m_arrAddObj(@"E").linkEnds;
    //写法三
    linkResults = arrA.linkAnd(arrB).linkAnd(arrC).m_arrAddObj(@"D").linkEnds;
    //写法四，简单粗暴的重复执行之后链条100次，这种情况不需要for循环了
    linkResults = arrA.linkLoop(100).m_arrAddObj(@"F").linkEnds;
    
    //多个控件一个显示其他隐藏
    //linkObjs(viewA,viewB,...).viewHiddeYES().linkAt(selectedIndex).viewHiddenNO();
    
    //////////////////////////////////////////////////////////////////////
    //【四】快捷语法
    //////////////////////////////////////////////////////////////////////
    //对象随机赋值，并将对象作为字典打印
    [Person new].objValuesClean().objValuesRandom().po();

    //创建属性字典
    AttrDictNew.makeAttrDictFont([UIFont systemFontOfSize:15])
    .makeAttrDictTextColor([UIColor blackColor]);
    
    @"1990.10.25".strToNSDateWithFormat(@"yyyy.MM.dd").dateAstrology().nslogTitle(@"星座是:");
    
    //扩展点击范围
    self.btnTest.btnExtensionOfTouchSide(UIEdgeInsetsMake(20, 20, 20, 20)).btnTitleUIControlStateNormal(@"扩展可触摸区域");
    
    //////////////////////////////////////////////////////////////////////
    //【五】与项目外交互
    //////////////////////////////////////////////////////////////////////
    Person* per2 = [Person new];
    //设置代理 使用 KVC
    per2.objSetValueForKey_delegate(self).objSetValueForKey(@"Jack",@"name");
    //调用方法组
    per2.objPerformSelectorsWithArgs(
                                     @selector(answerQuestion:),@[@"how big"],
                                     @selector(answerQuestion:question2:),@[@"how long",[NSNull null],@"what color"],
                                     @selector(answerQuestion:question2:question3:),@[],
                                     @selector(viewDidLoad),@[]//此处会在控制台打印未能找到方法的错误
                                     );
    
    //连续比较
    //objIsEqualToEach和objIsEqualToSomeone
    //if( [name isEqual:@"Jack"] || [name isEqual:@"Tom"] || ... )
    //=>
    //if( name.objIsEqualToEach(@"Jack" , @"Tom" , ...) )
    
    //... ...
    
    
    
    // MARK:-复杂示例1
    NSString* contentTextABC = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    __block BOOL isFullOfLines;
    __block NSUInteger maxLine = 4;
    NSMutableDictionary* attrDict = AttrDictNew.makeAttrDictFontSizeAndTextColor(20,[UIColor blackColor]);
    CGFloat maxWidth = 103;
    
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(self.timer, dispatch_walltime(NULL, 0), 1.2 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        
        maxLine += 1;
        maxLine = maxLine>4 ? 1 : maxLine;//从1行截取到4行
        //关键
        NSRange rangeOfText = contentTextABC.strSubRangeToMaxLineIfAppendStrAboutView(maxLine , maxWidth, @"全文", attrDict, &isFullOfLines);
        NSString* text = [contentTextABC substringWithRange:rangeOfText].strAppend(isFullOfLines?@"...全文":@"全文");
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.labelOfABC.attributedText = [[NSAttributedString alloc] initWithString:text attributes:attrDict];
        });
    });
    dispatch_resume(self.timer);

}
@end
