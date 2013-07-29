//
//  EEViewController.m
//  Nutrindo
//
//  Created by Fabio Marinho on 17/07/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EEMainView.h"
#import "EEViewRecomendacoes.h"
#import "EEViewPerfil.h"
#import "EEViewRegistro.h"

@interface EEMainView ()

@end

@implementation EEMainView

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //Definição da cor para barra de navegação
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0.0 green:0.6745 blue:0.4196 alpha:1.0];
    self.title = @"Principal";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)abrirRecomendacoes:(id)sender {
    EEViewRecomendacoes *rec = [[EEViewRecomendacoes alloc] init];
    [self.navigationController pushViewController:rec animated:YES];
    [rec release];
}


- (IBAction)abrirPerfil:(id)sender {
    EEViewPerfil *rec = [[EEViewPerfil alloc] init];
    [self.navigationController pushViewController:rec animated:YES];
    [rec release];
}

- (IBAction)abrirRegistro:(id)sender {
    EEViewRegistro *rec = [[EEViewRegistro alloc] init];
    [self.navigationController pushViewController:rec animated:YES];
    [rec release];
}

- (IBAction)abrirPrincipal:(id)sender {
    EEMainView *rec = [[EEMainView alloc] init];
    [self.navigationController pushViewController:rec animated:YES];
    [rec release];
}

@end
