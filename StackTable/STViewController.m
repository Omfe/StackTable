//
//  STViewController.m
//  StackTable
//
//  Created by Omar Gudino on 10/20/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "STViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "STStack.h"

@interface STViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *stackTableView;

@property (strong, nonatomic) STStack *stack;

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.stack = [[STStack alloc] init];
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stack.stackArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *identifier = @"InformationTableViewCellIdentifier";
    
    cell = [self.stackTableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate Methods

#pragma mark - Action Methods
- (IBAction)pushWasPressed:(id)sender
{
    
}

- (IBAction)popWasPressed:(id)sender
{
    
}

- (IBAction)topWasPressed:(id)sender
{
    
}

@end
