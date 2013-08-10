//
//  EEViewController.h
//  EmpresasEIA
//
//  Created by Fabio Marinho on 06/07/13.
//  Copyright (c) 2013 eia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EEViewController : UIViewController{
    NSMutableArray *empresas;
}
- (IBAction)btnEditar:(id)sender;

-(void) loadEmpresas;


@property (retain, nonatomic) IBOutlet UIBarButtonItem *btnEditar;

@property (retain, nonatomic) IBOutlet UITableView *tabelaEmpresas;


@end
