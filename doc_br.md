
*está e uma documentação de como criar um script para a plataforma use F3 para procurar a função ou sessão que deseja Draw \ Plataform \ UI ou função específica*

# Classes GERAIS

As estruturas Vec2, Vec3 e Vec4 são usadas na plataforma para representar vetores de 2, 3 e 4 componentes, respectivamente.
## Vec2
A estrutura Vec2 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor

### Construtores

-   `Vec2()`: cria um vetor com valores (0, 0)
-   `Vec2(x, y)`: cria um vetor com os valores informados para as componentes X e Y

## Vec3

A estrutura Vec3 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor
-   `z`: componente Z do vetor

### Construtores

-   `Vec3()`: cria um vetor com valores (0, 0, 0)
-   `Vec3(x, y, z)`: cria um vetor com os valores informados para as componentes X, Y e Z

## Vec4

A estrutura Vec4 possui as seguintes propriedades:

-   `x`: componente X do vetor
-   `y`: componente Y do vetor
-   `z`: componente Z do vetor
-   `w`: componente W do vetor

### Construtores

-   `Vec4()`: cria um vetor com valores (0, 0, 0, 0)
-   `Vec4(x, y, z, w)`: cria um vetor com os valores informados para as componentes X, Y, Z e W

É possível fazer operações matemáticas com as estruturas Vec2, Vec3 e Vec4, como soma, subtração, multiplicação e divisão. Além disso, essas estruturas podem ser usadas como argumentos em diversas funções da plataforma.




*inicialmente iremos começar pelos parametrons iniciais da função de update*

# Funções ``UI``

## Função: ``Begin()``

Descrição: A função Begin() é utilizada para iniciar uma janela com um título especificado pelo parâmetro 'title'. Além disso, é possível definir se a janela inicialmente deve estar aberta ou fechada através do parâmetro 'open', sendo 'true' para aberta e 'false' para fechada. É importante lembrar que, ao finalizar a janela, deve-se chamar a função End() para finalizar a janela corretamente.

### Parâmetros:

Descrição: A função Begin() é utilizada para iniciar uma janela com um título especificado pelo parâmetro 'title'. Além disso, é possível definir se a janela inicialmente deve estar aberta ou fechada através do parâmetro 'open', sendo 'true' para aberta e 'false' para fechada. É importante lembrar que, ao finalizar a janela, deve-se chamar a função End() para finalizar a janela corretamente.

-   title: um ponteiro para uma string que representa o título da janela.
-   open: um valor booleano que indica se a janela deve ser aberta ou fechada.

### Retorno:

-   Um valor booleano que indica se a janela foi iniciada com sucesso.

Exemplo de uso:

```lua
 if(menu) then
	menu = ui:Begin("Minha janela", menu);
	 
	ui:end()
 end
```
Nesse exemplo, uma janela com o título "Minha Janela" será criada e inicialmente aberta. O código para desenhar a janela deve ser escrito dentro do bloco condicional, e a função End() deve ser chamada ao final para finalizar a janela.

## Função: `BeginChild()`

Descrição: A função `BeginChild()` inicia um novo espaço de desenho em uma janela ou dentro de outro espaço de desenho. Esse espaço é delimitado por uma borda opcional e possui um tamanho especificado por um vetor de duas dimensões.

### Argumentos:

-   `name`: um ponteiro para um caractere que representa o nome do espaço de desenho. Deve ser único dentro do pai imediato.
-   `size`: um vetor de duas dimensões que define a largura e a altura do espaço de desenho.
-   `border`: um valor booleano que define se o espaço de desenho terá uma borda ou não.

### Retorno: A função retorna um valor booleano indicando se o espaço de desenho foi criado com sucesso.

Observações: A função `BeginChild()` deve ser seguida pela função `EndChild()` para finalizar o espaço de desenho. Qualquer conteúdo desenhado após `BeginChild()` e antes de `EndChild()` será limitado ao espaço de desenho criado.

Exemplo de uso:
```lua
 if(menu) then
	menu = ui:Begin("Minha janela", menu);
		if (ui:BeginChild("My Child", Vec2(15, 100), true)) then
			ui:Text("This is my child window"); 
			ui::EndChild();
		end
	ui:end()
 end
```
## Função: `Button()`

A função `Button` é responsável por renderizar um botão interativo dentro de uma janela ou de um elemento de interface.

### Argumentos:
-   `name`: É uma string que representa o texto que será exibido dentro do botão.

### Retorno:

-   Retorna `true` se o botão foi pressionado, caso contrário, retorna `false`

```lua
 if(menu) then
	menu = ui:Begin("Minha janela", menu);
		if (ui:BeginChild("My Child", Vec2(15, 100), true)) then
			ui:Text("This is my child window"); 
			ui::EndChild();
		end
		if(ui:Button("Click"))then
	     		ui:Text("Good work!");
     		end
	ui:end()
 end
```

## Função ``CheckBox()``

A função `CheckBox` é usada para criar um componente de caixa de seleção com um rótulo (título) e um estado booleano. O estado é representado por uma caixa de seleção que pode ser marcada ou desmarcada pelo usuário.

### Parâmetros

-   `title`: uma string constante representando o rótulo (título) que aparece ao lado da caixa de seleção.
-   `enable`: um valor booleano que representa o estado atual da caixa de seleção. Se for `true`, a caixa de seleção estará marcada. Se for `false`, a caixa de seleção estará desmarcada.

### Retorno

-   `true`: se a caixa de seleção estiver marcada.
-   `false`: se a caixa de seleção estiver desmarcada.

```lua
	enable = ui:CheckBox("Habilitar", enable);
	if(enable)then
		-- algo que você precise por aqui caso esteja habilitado
	end;
```

## função ``Text( )``

A função ``Text`` mostra um texto na tela dentro da janela.

### Argumentos:
-   text: um ponteiro para uma cadeia de caracteres contendo o texto a ser mostrado.

### Retorno: A função não retorna nenhum valor.

Exemplo:
```lua
  ui:Text("Olá mundo");
```

## Função ``SliderInt()``

A função SliderInt cria uma barra arrastável com um número inteiro.

### Argumentos:

-   ``label:`` um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   ``val:`` um inteiro contendo o valor atual do controle. Este valor será modificado pelo usuário.
-   ``min:`` um inteiro contendo o valor mínimo permitido para o controle.
-   ``max:`` um inteiro contendo o valor máximo permitido para o controle.

### Retorno: 
A função retorna o valor selecionado pelo usuário.

Exemplo
```lua
 valor = ui::SliderInt("Valor:", valor, 0, 100);
```

## Função ``Separator( )``

A função Separator desenha uma linha horizontal para separar os elementos.

### Argumentos: 
A função não recebe nenhum argumento.

### Retorno: 
A função não retorna nenhum valor.

Exemplo:
```lua
ui:Text("Elemento 1");
ui:Separator();
ui:Text("Elemento 2");
```

## Função ``NewLine( )``

A função NewLine cria um espaço vertical entre os elementos.

### Argumentos: 
A função não recebe nenhum argumento.

### Retorno: 
A função não retorna nenhum valor.

Exemplo:
```lua
ui:Text("Elemento 1");
ui:NewLine();
ui:Text("Elemento 2");
```

## Função ``ListBox()``

A função ListBox cria uma lista de itens selecionáveis.

### Argumentos:

-   `label`: um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   `list`: uma referência ao objeto de lista que contém os itens a serem exibidos na lista.
-   `index`: um índice inteiro contendo o índice do item selecionado na lista.

### Retorno: 
A função retorna o índice do item selecionado pelo usuário.

Exemplo:
```lua
	local lista = {};
	table.insert(lista,"Obj1");
	table.insert(lista,"Obj2");
	table.insert(lista,"Obj3");
	table.insert(lista,"Obj4");
	index = ui:ListBox("Lista de itens", lista, index);
```

## Função ``ComboBox()`` 

A função ComboBox cria um menu suspenso com itens selecionáveis.

### Argumentos:

-   `label`: um ponteiro para uma cadeia de caracteres contendo o rótulo do controle.
-   `list`: uma referência ao objeto de lista que contém os itens a serem exibidos no menu.
-   `index`: um índice inteiro contendo o índice do item selecionado no menu.

### Retorno: 
A função retorna o índice do item selecionado pelo usuário.

Exemplo:
```lua
	local lista = {};
	table.insert(lista,"Obj1");
	table.insert(lista,"Obj2");
	table.insert(lista,"Obj3");
	table.insert(lista,"Obj4");
	index = ui:ComboBox("Lista de itens", lista, index);
```



# Funções ``Draw``



## Função ``DrawCicle``

A função ``DrawCircle`` é responsável por desenhar um círculo na interface gráfica da plataforma. 
Ela recebe cinco parâmetros:

## Parâmetros:
-   `center`: um objeto da classe "Vec2" que representa o centro do círculo a ser desenhado.
-   `radius`: um valor float que representa o raio do círculo a ser desenhado.
-   `numPoints`: um valor inteiro que representa o número de pontos a serem utilizados para desenhar o círculo. Quanto maior o valor, mais suave será a curvatura do círculo.
-   `thickness`: um valor float que representa a espessura da linha utilizada para desenhar o círculo.
-   `color`: um objeto da classe "Vec4" que representa a cor utilizada para desenhar o círculo. A cor é definida pelos valores RGBA (red, green, blue, alpha).

Essa função é útil para desenhar objetos circulares.
Exemplo:

```lua
-- Cria um vetor 2D com a posição do centro do círculo
local center = Vec2(100, 100)

-- Define o raio do círculo
local radius = 50

-- Define a quantidade de pontos do círculo
local numPoints = 30

-- Define a espessura da linha do círculo
local thickness = 2.0

-- Cria um vetor RGBA com a cor do círculo (vermelho)
local color = Vec4(1, 0, 0, 1)

-- Chama a função DrawCircle para desenhar o círculo
draw:DrawCircle(center, radius, numPoints, thickness, color)
```

## Função ``DrawCircleFilled``

A função `DrawCircleFilled` é bastante semelhante à `DrawCircle`, com a diferença de que o círculo é preenchido em vez de ser desenhado apenas com uma linha. Ela recebe os mesmos parâmetros que a função `DrawCircle`, com exceção do parâmetro `thickness`.

## Parâmetros:
-   `center`: um objeto da classe "Vec2" que representa o centro do círculo a ser desenhado.
-   `radius`: um valor float que representa o raio do círculo a ser desenhado.
-   `numPoints`: um valor inteiro que representa o número de pontos a serem utilizados para desenhar o círculo. Quanto maior o valor, mais suave será a curvatura do círculo.
-   `color`: um objeto da classe "Vec4" que representa a cor utilizada para preencher o círculo. A cor é definida pelos valores RGBA (red, green, blue, alpha).

Essa função é útil para desenhar objetos circulares preenchidos.
Exemplo:

```lua
-- Cria um vetor 2D com a posição do centro do círculo
local center = Vec2(100, 100)

-- Define o raio do círculo
local radius = 50

-- Define a quantidade de pontos do círculo
local numPoints = 30

-- Cria um vetor RGBA com a cor de preenchimento do círculo (azul)
local fillColor = Vec4(0, 0, 1, 1)

-- Chama a função DrawCircleFilled para desenhar o círculo preenchido
draw:DrawCircleFilled(center, radius, numPoints, fillColor)
```

## Função `DrawCircle3D()`

Desenha um círculo no plano na posição do objeto especificado. A cor do círculo pode ser definida por meio de um vetor RGBA. O texto pode ser adicionado como um parâmetro opcional.

## Parâmetros:
- `Obj`: O objeto que define a posição do círculo no plano.
- `color`: Um vetor RGBA que define a cor do círculo.
- `txt`: Um texto que pode ser adicionado ao círculo.

Exemplo de uso:
```lua
local GameOBJ = plataform:GetPlayer();
local color = Vec4(0.5, 0.5, 0.5, 1); -- cinza 
local txt = "Exemplo de texto" 

draw:DrawCircle3D(GameOBJ, color, txt);
```

## Função `DrawText`:

Desenha um texto na posição especificada `pos`, usando a cor especificada `color` e o texto a ser exibido `text`.

Parâmetros:

-   `pos` (Vec2): posição em que o texto será desenhado.
-   `text` (const char*): texto a ser exibido.
-   `color` (Vec4): cor do texto.

Exemplo de uso:
```lua
local text = "Olá, mundo!"  
local color = Vec4(1, 1, 1, 1);
draw:DrawTextA(Vec2(100,100), text, color);
```


## Função ``DrawButton``
 A função ``DrawButton`` desenha um botão na tela, na posição especificada por `p`, com o texto `text`, a cor de fundo `colorButton`, a cor do texto `colorText` e o arredondamento dos cantos do botão definido por `rounding`.

- `p`: um vetor de 2 dimensões (x, y) que representa a posição do botão na tela.
- `text`: uma string que representa o texto exibido dentro do botão.
- `colorButton`: um vetor de 4 dimensões (r, g, b, a) que representa a cor de fundo do botão. Os valores de `r`, `g`, `b` e `a` variam de 0 a 1, onde 0 significa que a cor está totalmente ausente e 1 significa que a cor está completamente presente.
- `colorText`: um vetor de 4 dimensões (r, g, b, a) que representa a cor do texto dentro do botão. Os valores de `r`, `g`, `b` e `a` variam de 0 a 1, onde 0 significa que a cor está totalmente ausente e 1 significa que a cor está completamente presente.
- `rounding`: um valor que representa o arredondamento dos cantos do botão. Quanto maior o valor, mais arredondados serão os cantos. Se o valor for 0, o botão terá cantos retos.

Exemplo de uso:
````lua
local pos = Vec2(100.0, 100.0);
local text = "Eu pareço um botão!";
local colorButton = Vec4(0.2, 0.4, 0.6, 1.0);
local colorText = Vec4(1.0, 1.0, 1.0, 1.0);
local rounding = 5;
draw:DrawButton(pos, text, colorButton, colorText, rounding)
````

A função ``DrawRect`` é responsável por desenhar um retângulo na interface gráfica da plataforma. 
Ela recebe quatro parâmetros:

## Parâmetros:
-   `box`: um objeto da classe "Vec4" que representa as coordenadas do retângulo a ser desenhado. O objeto possui as seguintes informações: (x, y, largura, altura), onde (x, y) é a posição inicial do retângulo, e (largura, altura) são suas dimensões.
-   `color`: um objeto da classe "Vec4" que representa a cor utilizada para preencher o retângulo. A cor é definida pelos valores RGBA (red, green, blue, alpha).
-   `rounding`: um valor float que representa a quantidade de arredondamento das bordas do retângulo. Quanto maior o valor, mais arredondado será o retângulo.
-   `thickness`: um valor float que representa a espessura da linha utilizada para desenhar as bordas do retângulo.

Essa função é útil para desenhar objetos retangulares.
Exemplo:
```lua
-- Cria um vetor 4D com as coordenadas do retângulo
local box = Vec4(100, 100, 200, 150)

-- Cria um vetor RGBA com a cor do retângulo (verde)
local color = Vec4(0, 1, 0, 1)

-- Define a quantidade de arredondamento das bordas do retângulo
local rounding = 10.0

-- Define a espessura da linha do retângulo
local thickness = 2.0

-- Chama a função DrawRect para desenhar o retângulo
draw:DrawRect(box, color, rounding, thickness)
```

## Função `DrawRectFilled()`
A função `DrawRectFilled` é responsável por desenhar um retângulo preenchido na interface gráfica da plataforma. Ela recebe três parâmetros:

## Parâmetros:
-   `box`: um objeto da classe "Vec4" que representa o retângulo a ser desenhado. Os quatro valores do vetor representam respectivamente as coordenadas x e y do canto superior esquerdo do retângulo, seguidas das coordenadas x e y do canto inferior direito do retângulo.
-   `color`: um objeto da classe "Vec4" que representa a cor utilizada para preencher o retângulo. A cor é definida pelos valores RGBA (red, green, blue, alpha).
-   `rounding`: um valor float que representa o arredondamento dos cantos do retângulo.

Essa função é útil para desenhar objetos retangulares preenchidos.
Exemplo:
```lua
-- Cria um vetor 4D com as coordenadas do retângulo (canto superior esquerdo, canto inferior direito)
local box = Vec4(100, 100, 200, 200)

-- Cria um vetor RGBA com a cor do retângulo (vermelho)
local color = Vec4(1, 0, 0, 1)

-- Define o arredondamento dos cantos do retângulo
local rounding = 10

-- Chama a função DrawRectFilled para desenhar o retângulo preenchido
draw:DrawRectFilled(box, color, rounding)
```

# Funções ``plataform``

O parâmetro "plataform" da função "update" é um argumento que serve para chamar uma série de funções exportáveis ​​de um módulo Lua. Essas funções podem ser usadas para acessar informações sobre o jogo e controlar o comportamento do script em execução.

As funções incluídas no módulo "plataform" são:

- "GetHeroList": retorna uma lista dos heróis presentes na partida;
- "GetTurretList": retorna uma lista das torres presentes na partida;
- "GetMinionsList": retorna uma lista dos lacaios presentes na partida;
- "GetPlayer": retorna informações sobre o jogador em execução;
- "MouseClick": simula um clique do mouse em uma posição específica;
- "GetAsynKeyState": retorna o estado assíncrono de uma tecla específica;
- "isKeyPress": retorna true se a tecla especificada estiver pressionada;
- "isKeyDown": retorna true se a tecla especificada estiver em estado "down";
- "GetTick": retorna o tempo de execução do script;
- "GetListCount": retorna o número de elementos em uma lista;
- "ClickOrder": envia um comando de clique para o jogo;
- "IsForeground": retorna true se o jogo estiver em primeiro plano;
- "GetGameTick": retorna o tempo atual do jogo;
- "Wait": pausa a execução do script por um determinado período de tempo;
- "PressVK": simula a pressão de uma tecla específica;
- "SetPos": define a posição de uma janela do Windows;
- "SetMousePos": define a posição do cursor do mouse;
- "GetPos": retorna a posição atual de uma janela do Windows;
- "W2S": converte as coordenadas de mundo do jogo em coordenadas de tela;
- "PrintToLog": imprime uma mensagem no log do script.

Cada uma dessas funções pode ser usada para realizar diferentes tarefas e controlar o comportamento do script em execução.



---

## Função ``GetHeroList``

A função "GetHeroList" retorna uma lista de objetos do tipo "MyObj" que representam os Objetos presentes na partida.

### Sintaxe

```lua
GetHeroList()
```

### Retorno

A função retorna uma lista de objetos do tipo "MyObj", onde cada objeto representa um herói presente na partida.

### Exemplo de uso

```lua
local heroes = plataform:GetHeroList()

for _, hero in pairs(heroes) do
   ui:Text(hero.GetName());
end
```

Neste exemplo, a função "GetHeroList" é chamada e retorna uma lista de objetos "MyObj". Em seguida, um loop "for" é usado para iterar sobre cada objeto na lista e imprimir o nome do herói. 



---

## Função ``GetTurretList``

A função "GetTurretList" retorna uma lista de objetos do tipo "MyObj" que representam as torres presentes na partida.

### Sintaxe

```lua
function GetTurretList()
```

### Retorno

A função retorna uma lista de objetos do tipo "MyObj", onde cada objeto representa uma torre presente na partida.

### Exemplo de uso

```lua
local turrets = plataform:GetTurretList()

for _, turret in pairs(turrets) do
    ui:Text(turret.GetName());
end
```

Neste exemplo, a função "GetTurretList" é chamada usando o objeto "plataform" e retorna uma lista de objetos "MyObj". Em seguida, um loop "for" é usado para iterar sobre cada objeto na lista e imprimir o nome da torre na interface. 

---

## Função ``GetMinionsList``

A função "GetMinionsList" retorna uma lista de objetos do tipo "MyObj" que representam os lacaios presentes na partida.

### Sintaxe

```lua
function GetMinionsList()
```

### Retorno

A função retorna uma lista de objetos do tipo "MyObj", onde cada objeto representa um lacaio presente na partida.

### Exemplo de uso

```lua
local minions = plataform:GetMinionsList()

for _, minion in pairs(minions) do
    ui:Text(minion.GetName())
end
```

Neste exemplo, a função "GetMinionsList" é chamada usando o objeto "plataform" e retorna uma lista de objetos "MyObj". Em seguida, um loop "for" é usado para iterar sobre cada objeto na lista e imprimir o nome do lacaio no console. 

---
## Função ``GetPlayer``

A função "GetPlayer" retorna um objeto do tipo "MyObj" que representa o jogador em execução.

### Sintaxe

```lua
function GetPlayer()
```

### Retorno

A função retorna um objeto do tipo "MyObj" que representa o jogador em execução.

### Exemplo de uso

```lua
local player = plataform:GetPlayer()

ui:Text(player.GetName()).
```

Neste exemplo, a função "GetPlayer" é chamada usando o objeto "plataform" e retorna um objeto "MyObj". Em seguida, o nome do jogador é impresso na interface usando a propriedade "GetName" do objeto "MyObj". 

---
## Função ``MouseClick``

A função "MouseClick" clica na posição atual do cursor do mouse.

### Sintaxe

```lua
function MouseClick(leftClick, delay)
```

### Argumentos

- `leftClick`: Um valor booleano que indica se o botão esquerdo do mouse será clicado. Se for "true", o botão esquerdo será clicado. Se for "false", o botão direito será clicado. 

- `delay`: O tempo em milissegundos que o botão do mouse será mantido pressionado antes de ser solto.

### Retorno

Esta função não retorna nada.

### Exemplo de uso

```lua
-- Clique no botão esquerdo do mouse com um atraso de 500 milissegundos
plataform:MouseClick(true, 500)
```

Neste exemplo, a função "MouseClick" é chamada usando o objeto "plataform" com o argumento "true", o que significa que o botão esquerdo do mouse será clicado. O argumento "500" indica que haverá um atraso de 500 milissegundos antes de soltar o botão do mouse.

---
## Função ``GetAsynKeyState``

A função "GetAsynKeyState" retorna o estado assíncrono da tecla especificada.

### Sintaxe

```lua
function GetAsynKeyState(key)
```

### Argumentos

- `key`: O valor numérico do código da tecla para a qual se deseja verificar o estado.

### Retorno

O valor do retorno é um booleano que represeta se a tecla foi pressioanda ou está precionada

### Exemplo de uso

```lua
-- Verifique se a tecla "A" está sendo pressionada
if (plataform:GetAsynKeyState(65)) then
    ui:Text("A está pressionada")
end
```

---
## Função ``isKeyPress``

A função "isKeyPress" verifica se a tecla especificada está sendo pressionada.

### Sintaxe

```lua
function isKeyPress(key)
```

### Argumentos

- `key`: O valor numérico do código da tecla para a qual se deseja verificar o estado.

### Retorno

Retorna `true` se a tecla especificada estiver sendo pressionada, caso contrário, retorna `false`.

### Exemplo de uso

```lua
-- Verifique se a tecla "A" está sendo pressionada
if plataform:isKeyPress(65) then
    ui:Text("A está pressionada")
end
```

Neste exemplo, a função "isKeyPress" é chamada usando o objeto "plataform" com o argumento "65", que corresponde ao código da tecla "A". Se a tecla "A" estiver pressionada, a mensagem "A está pressionada" será impressa no console.

---

## Função ``isKeyDown``

A função "isKeyDown" verifica se a tecla especificada está sendo pressionada.

### Sintaxe

```lua
function isKeyDown(key)
```

### Argumentos

- `key`: O valor numérico do código da tecla para a qual se deseja verificar o estado.

### Retorno

Retorna `true` se a tecla especificada estiver sendo pressionada, caso contrário, retorna `false`.

### Exemplo de uso

```lua
-- Verifique se a tecla "A" está sendo pressionada
if (plataform:isKeyDown(65)) then
    ui:Text("A está foi pressionada")
end
```
## Função ``GetTick()`` 
Retorna o tempo atual do sistema em milissegundos. 

#### Argumentos
 Esta função não recebe nenhum argumento. 
 
#### Retorno
 - `number`: um número que representa o tempo atual do sistema em milissegundos.


### Exemplo de uso

```lua
local tickSistem = plataform:GetTick();
```

---

## Funções `` IsLolForeground() ``

Verifica se a janela do jogo está em primeiro plano.

#### Argumentos

Esta função não recebe nenhum argumento.

#### Retorno

- `boolean`: `true` se a janela do jogo estiver em primeiro plano, `false` caso contrário.

---


## Funções `` GetListCount(list) ``

Retorna o número de elementos em uma lista.

#### Argumentos

- `list` (table): a lista a ser verificada.

#### Retorno

- `number`: o número de elementos na lista.

---

## Funções ``ClickOrder(x, y, order)``

Envia um clique do mouse para um ponto específico na tela.

#### Argumentos

- `x` (number): a coordenada X do ponto onde o clique será enviado.
- `y` (number): a coordenada Y do ponto onde o clique será enviado.
- `order` (boolean): o tipo de clique a ser enviado. Deve ser uma das seguintes opções:
  - `"true"`: clique com o botão esquerdo do mouse.
  - `"false"`: clique com o botão direito do mouse.


#### Retorno

Esta função não retorna nenhum valor.

---

## Funções `` IsLolForeground() ``

Verifica se a janela do jogo está em primeiro plano.

#### Argumentos

Esta função não recebe nenhum argumento.

#### Retorno

- `boolean`: `true` se a janela do jogo estiver em primeiro plano, `false` caso contrário.

---

## Funções `` GetGameTick() ``

Retorna o tempo atual do jogo em milissegundos.

#### Argumentos

Esta função não recebe nenhum argumento.

#### Retorno

- `number`: um número que representa o tempo atual do jogo em milissegundos.

---


## Funções ``Wait(ms)``

Faz o sistema esperar o tempo desejado em milissegundos.

#### Argumentos

- `time` (number): O tempo em milissegundos que a função deve esperar antes de continuar a execução.

#### Retorno

Esta função não retorna nenhum valor.

#### Exemplo de uso

```lua
-- Espera 1 segundo antes de continuar a execução
plataform:Wait(1000)
```

---

## Funções ``PressVK(key, delay)``

Pressiona uma tecla especificada e aguarda um tempo antes de soltar.

#### Argumentos

- `vk` (number): O valor numérico da tecla a ser pressionada.
- `delay` (number): O tempo em milissegundos que a função deve esperar antes de soltar a tecla.

#### Retorno

Esta função não retorna nenhum valor.

#### Exemplo de uso

```lua
-- Pressiona a tecla "A" e espera 500ms antes de soltar
plataform:PressVK(65, 500)
```

___

## Funções ``SetPos``

Move o cursor do mouse para uma posição 3D específica no jogo.

#### Argumentos

- `vec3` (table): um objeto vec3 contendo as coordenadas X, Y e Z da posição para a qual o cursor do mouse será movido.

#### Retorno

Esta função não retorna nenhum valor.

---

## Funções ``SetMousePos``

Define a posição absoluta do cursor do mouse na tela.

#### Argumentos

- `vec2` (table): um objeto vec2 contendo as coordenadas X e Y da posição absoluta do cursor do mouse.

#### Retorno

Esta função não retorna nenhum valor.

___

## Função `GetPos`

A função "GetPos" retorna a posição atual do cursor do mouse em coordenadas 2D.

### Sintaxe

```lua
function GetPos()
```

### Argumentos

Esta função não recebe nenhum argumento.

### Retorno

- `Vec2`: um objeto `Vec2` que contém as coordenadas X e Y atuais do cursor do mouse.

### Exemplo de uso

```lua
-- Obtém a posição atual do cursor do mouse
local mousePos = plataform:GetPos()

-- Exibe a posição em um texto
ui:Text(string.format("A posição atual do cursor do mouse é: %f, %f", mousePos.x, mousePos.y))
```

___

## Função ``W2S``

Converte uma posição 3D no mundo do jogo em uma posição 2D na tela.

#### Argumentos

- `position` (Vec3): uma tabela contendo os valores X, Y e Z da posição 3D no mundo do jogo.

#### Retorno

- `Vec2`: uma tabela contendo os valores X e Y da posição 2D na tela.

#### Exemplo de uso

```lua
-- Obtenha a posição do herói local
local localHero = plataforma:GetLocalHero()
local heroPos = localHero:GetPos()

-- Converta a posição 3D em uma posição 2D na tela
local screenPos = plataforma:W2S(heroPos)

-- Imprima a posição na tela
ui:Text(string.format( "Posição do herói na tela: %f, %f", screenPos.x, screenPos.y ))
```

___
## Função ``PrintToLog``
A função "PrintToLog" envia uma mensagem para o log do jogo.

### Sintaxe

```lua
function PrintToLog(message)
```

### Argumentos

- `message` (string): a mensagem a ser enviada para o log do jogo.

### Retorno

Esta função não retorna nenhum valor.

### Exemplo de uso

```lua
-- Enviar mensagem para o log
plataform:PrintToLog("Olá, mundo!")
```
## Classe `GameEntry`

A classe `GameEntry` representa um objeto que contém todas as funções de chamada de objeto do jogo.
Segue a documentação para a função do objeto `GameEntry` == MyObj:

___

## Função `GetTeam`

Retorna o time atual do jogador controlado pelo objeto.

### Sintaxe

```lua
function GameEntry:GetTeam()
```

### Retorno

- `number`: o número do time atual do jogador. Pode ser `100` (azul) ou `200` (vermelho).

### Exemplo de uso

```lua
-- Verifique o time atual do jogador
local team = Obj:GetTeam()
if (team == 100) then
    ui:Text("O jogador está no time azul.")
elseif (team == 200) then
    ui:Text("O jogador está no time vermelho.")
end
```
___

## Função `GetPosition`

A função `GetPosition` retorna a posição tridimensional do objeto.

#### Sintaxe

```lua
function GameEntry:GetPosition()
```

#### Retorno

- `Vec3`: um objeto `Vec3` que contém as coordenadas x, y e z da posição tridimensional do objeto.

#### Exemplo de uso

```lua
-- Obter a posição do jogador
local playerPosition = GameEntry:GetPosition()
```
___

## Função ` IsVisible() `

A função "IsVisible" verifica se o objeto é visível na tela.

#### Argumentos

Esta função não recebe nenhum argumento.

#### Retorno

- `boolean`: `true` se o objeto for visível, `false` caso contrário.

---

## Função ` IsTargetable() `

A função "IsTargetable" verifica se o objeto pode ser definido como um alvo.

#### Argumentos

Esta função não recebe nenhum argumento.

#### Retorno

- `boolean`: `true` se o objeto puder ser definido como um alvo, `false` caso contrário.

___

## Função `GetTeam()`

Retorna o número do time do personagem.

- Argumentos: nenhum
- Retorno: `number` - o número do time do personagem.

## Função `GetPosition()`

Retorna a posição 3D atual do personagem como um vetor de 3 componentes.

- Argumentos: nenhum
- Retorno: `Vec3` - a posição 3D atual do personagem.


## Função `GetHP()`

Retorna o valor atual do HP do personagem.

- Argumentos: nenhum
- Retorno: `number` - o valor atual do HP do personagem como um número de ponto flutuante.

## Função `GetMaxHP()`

Retorna o valor máximo do HP do personagem.

- Argumentos: nenhum
- Retorno: `number` - o valor máximo do HP do personagem como um número de ponto flutuante.

## Função `GetDamage()`

Retorna o valor de dano do personagem.

- Argumentos: nenhum
- Retorno: `number` - o valor de dano do personagem como um número de ponto flutuante.

## Função `GetRange()`

Retorna a distância de ataque do personagem.

- Argumentos: nenhum
- Retorno: `number` - a distância de ataque do personagem como um número de ponto flutuante.

## Função `GetArmor()`

Retorna o valor de armadura do personagem.

- Argumentos: nenhum
- Retorno: `number` - o valor de armadura do personagem como um número de ponto flutuante.

## Função `GetName()`

Retorna o nome do personagem.

- Argumentos: nenhum
- Retorno: `string` - o nome do personagem como uma cadeia de caracteres.

## Função `IsAlive()`

Retorna um valor booleano que indica se o personagem está vivo.

- Argumentos: nenhum
- Retorno: `boolean` - `true` se o personagem está vivo, `false` caso contrário.

## Função `GetLevel()`

Retorna o nível do personagem.

- Argumentos: nenhum
- Retorno: `number` - o nível do personagem como um número inteiro.




## Função ``GetArmorPenetration()``

Retorna o valor de penetração de armadura do personagem.

- **Retorno**: `number` - o valor de penetração de armadura do personagem.

---

## Função ``GetBonusAttack()``

Retorna o valor de ataque extra do personagem.

- **Retorno**: `number` - o valor de ataque extra do personagem.

---

## Função ``GetAbilityPower()``

Retorna o valor de poder de habilidade (Ability Power) do personagem.

- **Retorno**: `number` - o valor de poder de habilidade do personagem.

---

## Função ``Initialized()``

Verifica se o objeto foi inicializado corretamente.

- **Retorno**: `boolean` - `true` se o objeto foi inicializado corretamente, caso contrário, `false`.

---

## Função ``GetLethality()``

Retorna o valor de letalidade do personagem.

- **Retorno**: `number` - o valor de letalidade do personagem.
___

## Função `DisTo(obj)`

Calcula a distância entre o objeto atual e outro objeto especificado.

#### Argumentos

-   `obj` (objeto): o objeto do qual se deseja obter a distância.

#### Retorno

-   `number`: a distância em unidades do jogo (float).

#### Exemplo de uso
```lua
local distance = player:DisTo(OtherHero);
```
___

## Função `IsEnemy(obj)`

Verifica se um objeto é um inimigo.

#### Argumentos

-   `obj` (GameEntry): o objeto a ser verificado.

#### Retorno

-   `boolean`: `true` se o objeto for um inimigo, `false` caso contrário.

#### Exemplo de Uso
```lua
 if( player:IsEnemy(OtherHero) ) then
		-- CODE HERE
 end
```
___
## Função `GetBuffer`

Obtem a lista de buffer da classe (BufferEntry) essa classe represeta cada sessão de buffer

#### Retorno:
 Lista (table) de objetos da classe BufferEntry
 
___

`Q()`, `W()`, `E()`, `R()`, `F()` e `D()`: cada uma dessas funções retorna um objeto da classe `Spell` correspondente à habilidade associada à tecla em questão.

___
___

## Classe `Spell`:

A classe `Spell` representa uma habilidade mágica que um personagem pode usar no jogo. Esta classe contém as seguintes propriedades e métodos:

## Função ``GetTimer``

Retorna o tempo restante de cooldown da magia em segundos.

### Retorno

-   `timer`(float): Tempo restante em segundos até que a magia possa ser utilizada novamente.

___

## Função ``GetLevel``

A função `GetLevel` da classe `Spell` retorna o nível da magia em questão como um número inteiro. Ela não possui argumentos. Aqui está a documentação detalhada:

```
GetLevel()
```

Retorna o nível da magia como um número inteiro.

**Retorno:**
- `level` (int): o nível da magia.

___

## Função ``GetName``

Essa função não possui argumentos.
**Retorno:**
- `str`: Retorna o nome da magia como uma string. 
___

## Função ``GetDamage``

A função `GetDamage` da classe `Spell` retorna o valor do dano físico da magia como um número de ponto flutuante (`float`).

**Retorno:**

-   `float`: O valor do dano físico da magia.

___

## Função ``GetLetter``

A função `GetLetter` da classe `Spell` retorna a letra da magia.

**Retorno:**

-   `Char`: A letra da magia.

___

## Função ``Cast``

A função `Cast` da classe `Spell` Solta a magia pressionando a tecla.

**Retorno:**
A função não tem retorno

___


## Função `CastTrigger(trigger)`

Verifica se um objeto é um inimigo.

#### Argumentos

-   `trigger` (Booleano): Indica se pode pressionar ou soltar a tecla.
			  `false` para soltar `true` para pressionar

#### Retorno:
a função não tem retorno



## Classe `BufferEntry`:

A classe `BufferEntry` representa um efeito de magia que é aplicado a um personagem. Ele pode ser um buff (efeito positivo) ou um debuff (efeito negativo). Esta classe contém as seguintes propriedades e métodos:


### `GetName() -> str`

Retorna o nome do buffer.

### `GetStart() -> float`

Retorna o momento em que o buffer começou a ser aplicado, em segundos desde o início da partida.

### `GetCount() -> float`

Retorna a duração do buffer em segundos.

### `GetCountAlt() -> float`

Retorna a quantidade acumulada do buffer.

### `GetEnd() -> float`

Retorna o momento em que o buffer expira, em segundos desde o início da partida.
