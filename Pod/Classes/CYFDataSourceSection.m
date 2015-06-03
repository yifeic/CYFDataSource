//
//  CYFDataSourceSection.m
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

#import "CYFDataSourceSection.h"

@interface CYFDataSourceSection ()

@property (nonatomic, strong) NSMutableArray *cells;

@end

@implementation CYFDataSourceSection

- (instancetype)init
{
    self = [super init];
    if (self) {
        _cells = [NSMutableArray array];
        _headerHeight = 10;
    }
    return self;
}

- (void)addCell:(CYFDataSourceAddCellBlock)block {
    CYFDataSourceCell *cell = [[CYFDataSourceCell alloc] init];
    block(cell, self.cells.count);
    [self.cells addObject:cell];
}

- (CYFDataSourceCell *)cellAtIndex:(NSInteger)index {
    return self.cells[index];
}

@end
