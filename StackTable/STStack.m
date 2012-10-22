//
//  STStack.m
//  StackTable
//
//  Created by Omar Gudino on 10/21/12.
//  Copyright (c) 2012 Omar Gudino. All rights reserved.
//

#import "STStack.h"

@implementation STStack

- (id)init
{
    self = [super init];
    if (self) {
        self.stackArray = [NSMutableArray array];
        _reversedStackArray = [NSArray array];
    }
    return self;
}

#pragma mark - Public Methods
- (void)pushAnObject
{
    NSString *object;
    
    object = [[NSString alloc]initWithFormat:@"%i", self.stackArray.count]; //Inicializar String
    [self pushObject:object];
}

- (void)popAnObject
{
    [self.stackArray removeLastObject];
    _reversedStackArray = [[self.stackArray reverseObjectEnumerator] allObjects];
}

- (void)pushObject:(NSString *)object //poner
{
    [self.stackArray addObject:object];
    _reversedStackArray = [[self.stackArray reverseObjectEnumerator] allObjects];
}

@end
