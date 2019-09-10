//
//  FileOps.h
//  habit-scorecard
//
//  Created by itsector on 05/09/2019.
//  Copyright © 2019 itsector. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FileOps : NSObject {
    NSFileManager *fileManager;
    NSString *homeDir;
    NSString *filename;
    NSString *filepath;
}

@property(nonatomic,retain) NSFileManager *fileManager;
@property(nonatomic,retain) NSString *homeDir;
@property(nonatomic,retain) NSString *filename;
@property(nonatomic,retain) NSString *filepath;

-(NSString *) GetDocumentDirectory;
-(void)WriteToStringFile:(NSMutableString *)textToWrite;
-(NSString *) readFromFile;
-(NSString *) setFilename;
@end

NS_ASSUME_NONNULL_END
