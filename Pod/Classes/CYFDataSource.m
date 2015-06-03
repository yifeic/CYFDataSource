//
//  CYFDataSource.m
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

#import "CYFDataSource.h"
#import "CYFDataSourceSection.h"

@interface CYFDataSource ()
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *sections;
@end

@implementation CYFDataSource

- (instancetype)initWithTableView:(UITableView *)tableView
{
    self = [super init];
    if (self) {
        _tableView = tableView;
        _sections = [NSMutableArray array];
        
        
    }
    return self;
}

- (void)addSection:(CYFDataSourceAddSectionBlock)block {
    CYFDataSourceSection *section = [[CYFDataSourceSection alloc] init];
    block(section, self.sections.count);
    [self.sections addObject:section];
}

@end
