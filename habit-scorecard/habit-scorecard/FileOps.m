//
//  FileOps.m
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import "FileOps.h"

@implementation FileOps
@synthesize filename;
@synthesize fileManager;
@synthesize homeDir;
@synthesize filepath;


- (NSString *) GetDocumentDirectory {
    fileManager = [NSFileManager defaultManager];
    homeDir =  [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    return homeDir;
}

-(void)WriteToStringFile:(NSMutableString *)textToWrite{
    filepath = [[NSString alloc] init];
    NSError *err;
    
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    
    BOOL ok = [textToWrite writeToFile:filepath atomically:YES encoding:NSUnicodeStringEncoding error:&err];
    
    if (!ok) {
        NSLog(@"Error writing file at %@\n%@",filepath, [err localizedFailureReason]);
    }
}
-(NSString *) readFromFile{
    filepath = [[NSString alloc] init];
    NSError *error;
//    NSString *title;
    filepath = [self.GetDocumentDirectory stringByAppendingPathComponent:self.setFilename];
    NSString *txtInFile = [[NSString alloc] initWithContentsOfFile:filepath encoding:NSUnicodeStringEncoding error:&error];
    
//    if(!txtInFile)
//    {
//
//        UIAlertView *tellErr = [[UIAlertView alloc] initWithTitle:title message:@"Unable to get text from file." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//        [tellErr show];
//    }
    return txtInFile;
}
-(NSString *) setFilename{
    filename = @"mytextfile.txt";
    
    return filename;
}
@end
