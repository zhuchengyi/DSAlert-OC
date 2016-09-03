
/*!
 *  @brief      DSAlert-OC
 *
 *  @author     DS-Team
 *  @copyright  Copyright © 2016年 DS-Team. All rights reserved.
 *  @version    V1.0.0
 */

/*
 ***************************   DSAlert 项目简介：  **********************
 
 1、开发人员【DS-Team】：
 孙博岩：[『https://github.com/boai』](https://github.com/boai)<br>
 陆晓峰：[『https://github.com/zeR0Lu』](https://github.com/zeR0Lu)<br>
 陈集  ：[『https://github.com/chenjipdc』](https://github.com/chenjipdc)
 2、项目源码地址：
 OC版   ：https://github.com/DS-Team/DSAlert-OC
 swift版：https://github.com/DS-Team/DSAlert-swift
 3、安装及使用方式：
 * 3.1、pod 导入【当前最新版本：1.0.0】：
 pod 'DSAlert'
 导入头文件：#import <DSAlert.h>
 * 3.2、下载demo，把 DSAlert 文件夹拖入项目即可，
 导入头文件：#import "DSAlert.h"
 4、如果开发中遇到特殊情况或者bug，请及时反馈给我们，谢谢！
 5、也可以加入我们的大家庭：QQ群 【 479663605 】，希望广大小白和大神能够积极加入！
 
 */


#import "ViewController.h"

/*! 使用方法一：文件夹拖入 */
#import "DSAlert.h"
#import "ViewController2.h"
#import "DSActionSheet.h"

///*! 使用方法二：pod */
//#import <DSAlert.h>
//
///*! 使用方法三：frameWork */
//#import <DSAlert/DSAlert.h>


static NSString * const titleMsg1 = @"欢迎使用 iPhone SE，迄今最高性能的 4 英寸 iPhone。在打造这款手机时，我们在深得人心的 4 英寸设计基础上，从里到外重新构想。它所采用的 A9 芯片，正是在 iPhone 6s 上使用的先进芯片。1200 万像素的摄像头能拍出令人叹为观止的精彩照片和 4K 视频，而 Live Photos 则会让你的照片栩栩如生。这一切，成就了一款外形小巧却异常强大的 iPhone。";
static NSString * const titleMsg2 = @"对于 MacBook，我们给自己设定了一个几乎不可能实现的目标：在有史以来最为轻盈纤薄的 Mac 笔记本电脑上，打造全尺寸的使用体验。这就要求每个元素都必须重新构想，不仅令其更为纤薄轻巧，还要更加出色。最终我们带来的，不仅是一部新款的笔记本电脑，更是一种对笔记本电脑的前瞻性思考。现在，有了第六代 Intel 处理器、提升的图形处理性能、高速闪存和最长可达 10 小时的电池使用时间*，MacBook 的强大更进一步。";

@interface ViewController ()
@property (weak, nonatomic  ) IBOutlet UITableView  *tableView;

@property (nonatomic, strong) DSAlert               *alertView1;
@property (nonatomic, strong) DSAlert               *alertView2;
@property (nonatomic, strong) DSAlert               *alertView3;
@property (nonatomic, strong) DSAlert               *alertView4;
@property (nonatomic, strong) DSAlert               *alertView5;

@property (nonatomic,strong ) UIButton              *chooseBtn;
@property (nonatomic,strong ) UILabel               *titleLabel;

@property (strong, nonatomic) NSArray               *dataArray;

@end

@implementation ViewController

- (NSArray *)dataArray
{
    if ( !_dataArray )
    {
        _dataArray = [NSArray arrayWithObjects:@[@"1、类似系统alert【加边缘手势消失】",
                                                 @"2、自定义按钮颜色",
                                                 @"3、自定义背景图片",
                                                 @"4、内置图片和文字，可滑动查看",
                                                 @"5、完全自定义alert"
                                                 ],
                      @[@"6、actionsheet",
                        @"7、actionsheet带标题",
                        @"8、actionsheet带标题带图片"],
                      @[@"DSAlert特点：\n1、手势触摸隐藏开关，可随时开关\n2、可以自定义背景图片、背景颜色、按钮颜色\n3、可以添加文字和图片，且可以滑动查看！\n4、横竖屏适配完美\n5、有各种炫酷动画展示你的alert\n6、理论完全兼容现有所有 iOS 系统版本"
                        ], nil];
    }
    return _dataArray;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.estimatedRowHeight = 44.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.title = @"DSAlert-OC";
}

#pragma mark - UITableViewDataSource / UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if ( !cell )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.textLabel.numberOfLines = 0;
        
        cell.accessoryType = 0 == indexPath.section?UITableViewCellAccessoryDisclosureIndicator:UITableViewCellAccessoryNone;
        cell.selectionStyle = 0 == indexPath.section?UITableViewCellSelectionStyleDefault:UITableViewCellSelectionStyleNone;
    }
    NSArray *tempArray = self.dataArray[indexPath.section];
    cell.textLabel.text = tempArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ( 0 == indexPath.section )
    {
        [self showAlertAction:indexPath.row + 1];
    }else if ( 1 == indexPath.section )
    {
        switch ( indexPath.row ) {
            case 0:
            {
                [DSActionSheet ds_showActionSheetWithStyle:DSCustomActionSheetStyleNormal
                                              contentArray:@[@"测试1",@"测试2",@"测试3"]
                                                imageArray:nil
                                                  redIndex:1
                                                     title:nil
                                         ClikckButtonIndex:^(NSInteger index) {
                                             NSLog(@"你点击了第 %ld 行！",(long)index);
                                         }];
            }
                break;
            case 1:
            {
                [DSActionSheet ds_showActionSheetWithStyle:DSCustomActionSheetStyleTitle
                                              contentArray:@[@"测试1",@"测试2",@"测试3"]
                                                imageArray:nil
                                                  redIndex:1
                                                     title:@"测试带标题的ActionSheet"
                                         ClikckButtonIndex:^(NSInteger index) {
                                             NSLog(@"你点击了第 %ld 行！",(long)index);
                                         }];
            }
                break;
            case 2:
            {
                [DSActionSheet ds_showActionSheetWithStyle:DSCustomActionSheetStyleImageAndTitle
                                              contentArray:@[@"测试1",@"测试2",@"测试3"]
                                                imageArray:@[[UIImage imageNamed:@"123.png"],[UIImage imageNamed:@"背景.jpg"],[UIImage imageNamed:@"美女.jpg"]]
                                                  redIndex:1
                                                     title:@"测试带标题和图片的ActionSheet"
                                         ClikckButtonIndex:^(NSInteger index) {
                                             NSLog(@"你点击了第 %ld 行！",(long)index);
                                         }];
            }
                break;
            default:
                break;
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [UIView new];
    
    UILabel *headerTitle = [UILabel new];
    headerTitle.font = [UIFont systemFontOfSize:14];
    headerTitle.textColor = [UIColor redColor];
    headerTitle.numberOfLines = 0;
    [headerView addSubview:headerTitle];
    
    if (0 == section)
    {
        headerTitle.frame = CGRectMake(20, 0, SCREENWIDTH - 40, 40);
        headerTitle.text = @"DSAlert 的几种日常用法，高斯模糊、炫酷动画，应有尽有！";
    }
    else if (1 == section)
    {
        headerTitle.frame = CGRectMake(20, 0, SCREENWIDTH - 40, 20);
        headerTitle.text = @"DSActionSheet";
    }
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (0 == section) ? 40 : 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 点击事件
- (void)showAlertAction:(NSInteger)index
{
    switch (index) {
        case 1:
            [self performSelector:@selector(alert1)];
            break;
        case 2:
            [self performSelector:@selector(alert2)];
            break;
        case 3:
            [self performSelector:@selector(alert3)];
            break;
        case 4:
            [self performSelector:@selector(alert4)];
            break;
        case 5:
            [self performSelector:@selector(alert5)];
            break;
            
        default:
            break;
    }
}

- (void)alert1
{
    DSWeak;
    /*! 第一种封装使用示例 */
    [DSAlert ds_showAlertWithTitle:@"温馨提示：" message:titleMsg1 image:nil buttonTitles:@[@"取消",@"确定"] configuration:^(DSAlert *temp) {
        
        //        temp.bgColor       = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
        /*! 开启边缘触摸隐藏alertView */
        temp.isTouchEdgeHide = YES;
        /*! 添加高斯模糊的样式 */
        temp.blurEffectStyle = DSAlertBlurEffectStyleLight;
        /*! 开启动画 */
        //        temp.isShowAnimate   = YES;
        //        /*! 进出场动画样式 默认为：1 */
        //        temp.animatingStyle  = 1;
    }actionClick:^(NSInteger index) {
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
            //            [weakSelf.alertView1 ds_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert1";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
            //            [weakSelf.alertView1 ds_dismissAlertView];
        }
    }];
    
    /*! 第二种常用方法使用示例 */
    
    //    /*! 1、类似系统alert【加边缘手势消失】 */
    //    _alertView1 = [[DSAlert alloc] ds_showTitle:@"温馨提示："
    //
    //                                                    image:nil
    //                                             buttonTitles:@[@"取消", @"确定"]];
    //    _alertView1.bgColor = [UIColor colorWithRed:0 green:1.0 blue:0 alpha:0.3];
    //    /*! 是否开启边缘触摸隐藏 alert */
    //    _alertView1.isTouchEdgeHide = YES;
    //    /*! 显示alert */
    //    [_alertView1 ds_showAlertView];
    //
    //    DSWeak;
    //    _alertView1.buttonActionBlock = ^(NSInteger index){
    //        if (index == 0)
    //        {
    //            NSLog(@"点击了取消按钮！");
    //            /*! 隐藏alert */
    ////            [weakSelf.alertView1 ds_dismissAlertView];
    //        }
    //        else if (index == 1)
    //        {
    //            NSLog(@"点击了确定按钮！");
    //            ViewController2 *vc2 = [ViewController2 new];
    //            vc2.title = @"alert1";
    //            [weakSelf.navigationController pushViewController:vc2 animated:YES];
    //            /*! 隐藏alert */
    ////            [weakSelf.alertView1 ds_dismissAlertView];
    //        }
    //    };
}

- (void)alert2
{
    /*! 2、自定义按钮颜色 */
    _alertView2                  = [[DSAlert alloc] ds_showTitle:@"温馨提示："
                                                         message:titleMsg2
                                                           image:nil
                                                    buttonTitles:@[@"取消", @"跳转VC2"]];
    /*! 自定义按钮文字颜色 */
    _alertView2.buttonTitleColor = [UIColor orangeColor];
    _alertView2.bgColor = [UIColor colorWithRed:1.0 green:1.0 blue:0 alpha:0.3];
    
    /*! 是否开启进出场动画 默认：NO，如果 YES ，并且同步设置进出场动画枚举为默认值：1 */
    _alertView2.showAnimate = YES;
    
    /*! 显示alert */
    [_alertView2 ds_showAlertView];
    DSWeak;
    _alertView2.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
            [weakSelf.alertView2 ds_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert2";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
            //            [weakSelf.alertView2 ds_dismissAlertView];
        }
    };
}

- (void)alert3
{
    /*! 3、自定义背景图片 */
    _alertView3                  = [[DSAlert alloc] ds_showTitle:@"温馨提示："
                                                         message:titleMsg1
                                                           image:nil
                                                    buttonTitles:@[@"取消", @"确定"]];
    /*! 自定义按钮文字颜色 */
    _alertView3.buttonTitleColor = [UIColor orangeColor];
    /*! 自定义alert的背景图片 */
    _alertView3.bgImageName      = @"背景.jpg";
    /*! 开启动画，并且设置动画样式，默认：1 */
    //    _alertView3.isShowAnimate = YES;
    
    /*! 没有开启动画，直接进出场动画样式，默认开启动画 */
    _alertView3.animatingStyle  = DSAlertAnimatingStyleFall;
    
    /*! 显示alert */
    [_alertView3 ds_showAlertView];
    DSWeak;
    _alertView3.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
            //            [weakSelf.alertView3 ds_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert3";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
            //            [weakSelf.alertView3 ds_dismissAlertView];
        }
    };
}

- (void)alert4
{
    /*! 4、内置图片和文字，可滑动查看 */
    _alertView4                  = [[DSAlert alloc] ds_showTitle:@"温馨提示："
                                                         message:titleMsg1
                                                           image:[UIImage imageNamed:@"美女.jpg"]
                                                    buttonTitles:@[@"取消", @"跳转VC2"]];
    /*! 自定义按钮文字颜色 */
    _alertView4.buttonTitleColor = [UIColor orangeColor];
    /*! 自定义alert的背景图片 */
    _alertView4.bgImageName      = @"背景.jpg";
    /*! 是否显示动画效果 */
    _alertView4.showAnimate    = YES;
    /*! 显示alert */
    [_alertView4 ds_showAlertView];
    DSWeak;
    _alertView4.buttonActionBlock = ^(NSInteger index){
        if (index == 0)
        {
            NSLog(@"点击了取消按钮！");
            /*! 隐藏alert */
            //            [weakSelf.alertView4 ds_dismissAlertView];
        }
        else if (index == 1)
        {
            NSLog(@"点击了确定按钮！");
            ViewController2 *vc2 = [ViewController2 new];
            vc2.title = @"alert4";
            [weakSelf.navigationController pushViewController:vc2 animated:YES];
            /*! 隐藏alert */
            //            [weakSelf.alertView4 ds_dismissAlertView];
        }
    };
}

- (void)alert5
{
    /*! 5、完全自定义alert */
    UIView *view1                = [UIView new];
    view1.frame                  = CGRectMake(30, 100, SCREENWIDTH - 60, 200);
    view1.backgroundColor        = [UIColor yellowColor];
    view1.layer.masksToBounds    = YES;
    view1.layer.cornerRadius     = 10.0f;
    //    view1.clipsToBounds    = YES;
    
    _titleLabel                  = [UILabel new];
    _titleLabel.frame            = CGRectMake(0, 0, view1.frame.size.width, 40);
    _titleLabel.text             = @"测试title";
    _titleLabel.textAlignment    = NSTextAlignmentCenter;
    _titleLabel.font             = [UIFont systemFontOfSize:18];
    _titleLabel.backgroundColor  = [UIColor greenColor];
    [view1 addSubview:_titleLabel];
    _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    _chooseBtn                   = [[UIButton alloc]initWithFrame:CGRectMake(0, view1.frame.size.height - 40, view1.frame.size.width, 40)];
    //        _chooseBtn         = [UIButton buttonWithType:UIButtonTypeCustom];
    [_chooseBtn setTitle:@"取消" forState:UIControlStateNormal];
    [_chooseBtn setBackgroundColor:[UIColor redColor]];
    [_chooseBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_chooseBtn addTarget:self action:@selector(cancleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [view1 addSubview:_chooseBtn];
    _chooseBtn.autoresizingMask  = UIViewAutoresizingFlexibleWidth;
    
    _alertView5                  = [[DSAlert alloc] initWithCustomView:view1];
    _alertView5.showAnimate = YES;
    [_alertView5 ds_showAlertView];
}

- (void)cancleButtonAction:(UIButton *)sender
{
    NSLog(@"点击了取消按钮！");
    /*! 隐藏alert */
    [_alertView5 ds_dismissAlertView];
}

- (BOOL)prefersStatusBarHidden {
    return false;
}


@end
