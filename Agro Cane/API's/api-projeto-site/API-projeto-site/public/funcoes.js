let id_Cliente;
let login_cliente;
let nome_usuario;

function redirecionar_login() {
    window.location.href = 'login.html';
}

function verificar_autenticacao() {

    id_Cliente = sessionStorage.idCliente_cliente_meuapp;
    login_cliente = sessionStorage.login_cliente_meuapp;
    nome_usuario = sessionStorage.nomeEmpresa_cliente_meuapp;
    
    if (login_cliente == undefined)  {
        redirecionar_login();
    } else {
        nomeResp.innerHTML = nome_usuario;
        imagemCliente.innerHTML = `<img src="${nome_usuario}.png">`;
        validar_sessao();
    }
    
}

function logoff() {
    finalizar_sessao();
    sessionStorage.clear();
    redirecionar_login();
}

function validar_sessao() {
    fetch(`/usuarios/sessao/${login_cliente}`, {cache:'no-store'})
    .then(resposta => {
        if (resposta.ok) {
            resposta.text().then(texto => {
                console.log('Sessão :) ', texto);
                console.log(resposta)  
            });
        } else {
            console.error('Sessão :.( ');
            logoff();
        } 
    });    
}

function finalizar_sessao() {
    fetch(`/usuarios/sair/${login_cliente}`, {cache:'no-store'}); 
}