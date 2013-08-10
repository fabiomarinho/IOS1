//
//  EEViewController.h
//  ExemploDownload
//
//  Created by Fabio Marinho on 10/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EEViewController : UIViewController{
    IBOutlet UITextField *downloadField;
    IBOutlet UIProgressView *progressBar;
    IBOutlet UIActivityIndicatorView *atividade;
}

- (IBAction)startDownload:(id)sender;


@end
