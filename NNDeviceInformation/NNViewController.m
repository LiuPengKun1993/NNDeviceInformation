//
//  ViewController.m
//  NNDeviceInformation
//
//  Created by 刘朋坤 on 17/4/7.
//  Copyright © 2017年 刘朋坤. All rights reserved.
//

#import "NNViewController.h"
#import "NNTableViewCell.h"
#import "NNDeviceInformation.h"

static NSString *tableViewCellID = @"NNTableViewCellID";

@interface NNViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *infoArray;
@property (nonatomic, strong) NSArray *nameArray;
@end

@implementation NNViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设备信息";
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.infoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NNTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewCellID forIndexPath:indexPath];
    cell.nameString = self.nameArray[indexPath.row];
    cell.infoString = self.infoArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - LazyLoading
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.rowHeight = 60;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        [_tableView registerNib:[UINib nibWithNibName:@"NNTableViewCell" bundle:nil] forCellReuseIdentifier:tableViewCellID];
    }
    return _tableView;
}

- (NSArray *)infoArray {
    if (!_infoArray) {
        _infoArray = [NSArray arrayWithObjects:
                      @([NNDeviceInformation getDeviceScreenWidth]),
                      @([NNDeviceInformation getDeviceScreenHeight]),
                      [NNDeviceInformation getDeviceName],
                      [NNDeviceInformation getiPhoneName],
                      [NNDeviceInformation getAPPVerion],
                      @([NNDeviceInformation getBatteryLevel]),
                      [NNDeviceInformation getSystemName],
                      [NNDeviceInformation getSystemVersion],
                      [NNDeviceInformation getUUID],
                      [NNDeviceInformation getDeviceIPAdress],
                      @([NNDeviceInformation getTotalMemorySize]),
                      @([NNDeviceInformation getAvailableMemorySize]),
                      @([NNDeviceInformation getCurrentBatteryLevel]),
                      [NNDeviceInformation getBatteryState],
                      [NNDeviceInformation getDeviceLanguage], nil];
    }
    return _infoArray;
}

- (NSArray *)nameArray {
    if (!_nameArray) {
        _nameArray = [NSArray arrayWithObjects:
                      @"屏幕宽度",
                      @"屏幕高度",
                      @"设备版本号",
                      @"iPhone名称",
                      @"app版本号",
                      @"电池电量",
                      @"当前系统名称",
                      @"当前系统版本号",
                      @"识别码UUID",
                      @"当前设备IP",
                      @"总内存大小",
                      @"当前可用内存",
                      @"精准电池电量",
                      @"电池当前的状态",
                      @"当前语言", nil];
    }
    return _nameArray;
}
@end
