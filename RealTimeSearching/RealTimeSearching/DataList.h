//
//  DataList.h
//
//  Created by   on 2017. 2. 28.
//  Copyright (c) 2017 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface DataList : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double displayOrder;
@property (nonatomic, assign) double orderIdx;
@property (nonatomic, assign) BOOL deleteFlag;
@property (nonatomic, strong) NSString *descKR;
@property (nonatomic, strong) NSString *titleKR;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
