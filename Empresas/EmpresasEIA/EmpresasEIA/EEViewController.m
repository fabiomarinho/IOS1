//
//  EEViewController.m
//  EmpresasEIA
//
//  Created by Fabio Marinho on 06/07/13.
//  Copyright (c) 2013 eia. All rights reserved.
//

#import "EEViewController.h"
#import "EEEmpresa.h"
@interface EEViewController ()

@end

@implementation EEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadEmpresas];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)dealloc {
    [_tabelaEmpresas release];
    [_btnEditar release];
    [super dealloc];
}


- (IBAction)btnEditar:(id)sender {
    
    if ([self.btnEditar.title isEqualToString:@"Editar"]){
        
        [self.tabelaEmpresas setEditing:YES animated:YES];
        self.btnEditar.title = @"Pronto";
    }else{
        [self.tabelaEmpresas setEditing:NO animated:YES];
        self.btnEditar.title = @"Editar";
    }
    
}

-(void ) loadEmpresas{
    NSString *pListCaminho = [[NSBundle mainBundle] pathForResource:@"empresas" ofType:@"plist"];
    NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:pListCaminho];
    NSArray *dados = [pl objectForKey:@"empresas"];
    
    empresas = [[NSMutableArray alloc] init];
    for (NSDictionary *item in dados){
        NSString *nome = [item objectForKey:@"nome"];
        NSNumber *funcionarios = [item objectForKey:@"funcionarios"];
        EEEmpresa *e = [[EEEmpresa alloc] initWithNome:nome andFuncionarios: funcionarios];
        [empresas addObject:e];
        [e release];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return empresas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CelulaEmpresaCacheID = @"CelulaEmpresaCacheID";
    UITableViewCell *cell = [self.tabelaEmpresas dequeueReusableCellWithIdentifier:CelulaEmpresaCacheID];
    if (!cell){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CelulaEmpresaCacheID] autorelease];
    }
    EEEmpresa *empresa = [empresas objectAtIndex:indexPath.row];
    cell.textLabel.text = empresa._nome;
    return cell;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    EEEmpresa *empresa = [empresas objectAtIndex:indexPath.row];
    NSString *msg = [NSString stringWithFormat:@"Nome: %@\nFuncionarios: %@",empresa._nome,empresa._qtdeFuncionarios];
    UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"empresa" message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
    [alert show];
    [self.tabelaEmpresas deselectRowAtIndexPath:indexPath animated:YES];
    
}

-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [empresas removeObjectAtIndex:indexPath.row];
    [self.tabelaEmpresas reloadData];
}

-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Remover";
}


@end
