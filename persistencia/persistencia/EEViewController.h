//
//  EEViewController.h
//  persistencia
//
//  Created by Fabio Marinho on 31/08/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EEViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *lbl;
@property (retain, nonatomic) IBOutlet UITextField *txt;
- (IBAction)botao:(id)sender;

@end
