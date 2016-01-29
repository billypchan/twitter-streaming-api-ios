//
//  TSTwitterParser.m
//  TwitterStreamingiOS
//
//  Created by Rubén Expósito Marín on 11/03/14.
//  Copyright (c) 2014 Ruben Exposito Marin. All rights reserved.
//

#import "TSTwitterParser.h"

@implementation TSTwitterParser
//The NSData returned from this function could be partial data. You need to appendData to an instance variable with type: NSMutableData. Then you process your JSON in another function as follows:
- (NSDictionary *)getTweetsFromData:(NSData *)data {
    
    // It uses the NSJSONSerialization class introduced in iOS5
    // This simplifies tremendously the parsing task
    NSError *error = nil;
    NSDictionary *tweetsArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    
    // If something goes wrong, tell the delegate
    if (error) {
        [self.delegate parsingTweetsFailedWithError:error];
        
            NSString *serverResponse = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            NSLog(@"\n\nError:\n%@\n\nServer Response:\n%@\n\nCrash:", error.description, serverResponse);
//            [NSException raise:@"Invalid Data" format:@"Unable to process web server response."];
        return nil;
    }
    
    return tweetsArray;
}

@end
