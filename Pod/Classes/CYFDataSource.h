//
//  CYFDataSource.h
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

@import UIKit;
@class CYFDataSourceSection;

typedef void(^CYFDataSourceAddSectionBlock)(CYFDataSourceSection *section, NSInteger sectionIndex);

@interface CYFDataSource : NSObject

- (instancetype)initWithTableView:(UITableView *)tableView;

- (void)addSection:(CYFDataSourceAddSectionBlock)block;

@end
