//
//  CYFDataSource.m
//  CYFDataSource
//
//  Created by yifeic on 06/02/2015.
//  Copyright (c) 2014 yifeic. All rights reserved.
//

#import "CYFDataSource.h"

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex {
    CYFDataSourceSection *section = self.sections[sectionIndex];
    return MAX(section.cells.count, section.numberOfRows);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CYFDataSourceSection *section = self.sections[indexPath.section];
    if (section.heightForRowBlock) {
        return section.heightForRowBlock(tableView, indexPath);
    }
    return section.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CYFDataSourceSection *section = self.sections[indexPath.section];
    
    if (indexPath.row < section.cells.count) {
        CYFDataSourceCell *cell = section.cells[indexPath.row];
        return cell.cellForRowBlock(tableView, indexPath);
    }
    else {
        NSAssert(indexPath.row < section.numberOfRows, @"section:%ld, row:%ld, out of range", (long)indexPath.section, (long)indexPath.row);
        return section.cellForRowBlock(tableView, indexPath);
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CYFDataSourceSection *section = self.sections[indexPath.section];
    if (!section.selectRowBlock) {
        return;
    }
    section.selectRowBlock(tableView, indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)sectionIndex {
    CYFDataSourceSection *section = self.sections[sectionIndex];
    return section.headerHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectionIndex {
    CYFDataSourceSection *section = self.sections[sectionIndex];
    return section.headerView;
}

@end
