//
//  EEViewRegistro.m
//  Nutrindo
//
//  Created by Rogério Andrade da Costa on 28/07/13.
//  Copyright (c) 2013 ios. All rights reserved.
//

#import "EEViewRegistro.h"
#import "EEMainView.h"
#import "EEViewRecomendacoes.h"
#import "EEViewPerfil.h"

@interface EEViewRegistro ()

@end

@implementation EEViewRegistro

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Registro Diário";
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

- (IBAction)abirPerfil:(id)sender {
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
