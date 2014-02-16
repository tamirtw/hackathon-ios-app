//
//  FacedoorModel.m
//  Facedoor
//
//  Created by Twina, Tamir [ICG-IT] on 2/16/14.
//  Copyright (c) 2014 Twina, Tamir [ICG-IT]. All rights reserved.
//

#import "FacedoorModel.h"
#import "AFNetworking.h"

@implementation FacedoorModel


+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (NSString*)imageUrlForPerson
{
    return [self imageUrlForPersonWithEventId:self.eventId];
}

- (NSString*)imageUrlForPersonWithEventId:(NSString*)eventId
{
    return [NSString stringWithFormat:@"%@%@",[self baseUrl],eventId ? eventId : @""];
}


- (void)respondToDoorAccessRequestApproved:(BOOL)approved
                               compilition:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, id JSON))success
                                   failure:(void (^)(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON))failure
{
    NSString *perosnImgUrl = [self apiUrl];
    NSURL *url = [NSURL URLWithString:perosnImgUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation =
    [AFJSONRequestOperation JSONRequestOperationWithRequest:request
                                                    success:success
                                                    failure:failure];
    
    [operation start];
}

- (NSString*)baseUrl
{
    return @"http://www.quizz.biz/uploads/quizz/152064/3_8yQNI.jpg";
}

- (NSString*)apiUrl
{
    return @"http://facedoor.cloudapp.net/api/Status/1?eventId=1";
}

@end
