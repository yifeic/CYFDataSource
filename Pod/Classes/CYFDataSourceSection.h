//
//  CYFDataSourceSection.h
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

@import UIKit;
@class CYFDataSourceCell;
#import "CYFDataSourceBlocks.h"

typedef void(^CYFDataSourceAddCellBlock)(CYFDataSourceCell *dataSourceCell, NSInteger rowIndex);

@interface CYFDataSourceSection : NSObject

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic) CGFloat headerHeight;
@property (nonatomic, readonly) NSInteger sectionIndex;
@property (nonatomic, strong) CYFDataSourceCellForRowBlock cellForRowBlock;
@property (nonatomic, strong) CYFDataSourceSelectRowBlock selectRowBlock;
@property (nonatomic, strong) CYFDataSourceHeightForRowBlock heightForRowBlock;

- (void)addCell:(CYFDataSourceAddCellBlock)block;
- (CYFDataSourceCell *)cellAtIndex:(NSInteger)index;

@end
