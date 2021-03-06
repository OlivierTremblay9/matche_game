part of mane;


class Board {
  CanvasElement canvas;
  CanvasRenderingContext2D context;
  ButtonElement solve;
  int x = 0;
  int y = 0;
  int width;
  int height;
  int lengthMatches;
  int widthMatches;
  int clearance;
  Match activeMatch=null;
  Memory gameSpace;
  int gameState;

  Board(this.canvas,this.lengthMatches,this.widthMatches,this.clearance,this.solve) {
    context = canvas.getContext('2d');
    width = canvas.width;
    height = canvas.height;
    gameSpace=new Memory(this);
    gameSpace.initGameStep(3);
    
    querySelector('#canvas').onMouseDown.listen(onMouseDown);
    querySelector('#info_0').innerHtml="Coordonnnés:X=n/a , Y=n/a";
    querySelector('#info_1').innerHtml="Vous avez ${gameSpace.displacements} disponibles";
    querySelector('#canvas').onMouseMove.listen(onMouseMove);
    window.onKeyDown.listen( onKeyDown); // Use onKeyDown instead of onKeyPress 
    window.animationFrame.then(gameLoop);
    solve.onClick.listen(solveGame);
  }

  
  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void clear() {
    context.clearRect(0, 0, width, height);
    
  }

  void border() {
    var grd = context.createLinearGradient(0, 0, canvas.width, canvas.height);
    context.rect(0, 0, width, height);
    grd.addColorStop(0, '#D9D9D9');
    grd.addColorStop(1, '#D9D9D9');
    context.fillStyle = grd;
    context.fill();
    // grid drawing 
    for(int i=clearance;i<height;i+=(lengthMatches~/2)){
      context.moveTo(0, i);  
      context.lineTo(650, i);
    }
    for(int i=clearance;i<width;i+=(lengthMatches~/2)){
          context.moveTo(i, 0);  
          context.lineTo(i, 350);
        }
    context.lineWidth = 1;
    context.strokeStyle = '#C3E8F7';
    context.stroke();

    gameSpace.draw();
   
   
  }
  

  
  void draw() {
    clear();
    border();
  }
  
  
  void onMouseDown(MouseEvent e) {
    int x= e.offset.x;
    int y= e.offset.y;
    Segment nearest;
    gameState=0;
    String Message="Vous avez ${gameSpace.displacements} disponibles";
    if (activeMatch==null){
      activeMatch=gameSpace.verifyIfSelectedMatchclick(x,y);
    }
    else{
      nearest=gameSpace.nearestSegment(x, y);
      if(gameSpace.moveMatch(activeMatch, nearest)==false) {
        activeMatch.setPosDraw(activeMatch.posX,activeMatch.posY,activeMatch.orientation); 
      }        
      else{
        if (gameSpace.displacements==0){
            if (gameSpace.validate()==true){
              print('vous avez gagné!');
              gameState =1;
              Message='Vous avez gagné';
            }
            else{
              print('vous avez perdu!');
              gameState=2;
              Message='Vous avez perdu';
            }
        }
      }  
      activeMatch=null;
    }
    
    querySelector('#info_1').innerHtml=Message;
   
  }
  
  void onMouseMove(MouseEvent e) {
      y = e.offset.y;
      x = e.offset.x;
      Segment nearest;
      if (activeMatch!=null){
        nearest=gameSpace.nearestSegment(x, y);
        activeMatch.setPosDraw(nearest.x_0,nearest.y_0,nearest.orientation());
      }
      querySelector('#info_0').innerHtml="Coordonnés: X= "+ x.toString() + ", Y=" + y.toString();
      
    }
  
  
    
  void onKeyDown(KeyboardEvent e){
    print(e.keyCode);  
    
     if  ((activeMatch!=null)&&(e.keyCode == 32)) {
          print('pressed space');
          activeMatch.rotate();
    }
     
  }
  
  void solveGame(Event e){
    gameSpace.solve();
  }
}

//Board 2------------------------------------------------------------------------------------

class Board2 {
  CanvasElement canvas2;
  CanvasRenderingContext2D context;
  ButtonElement solve2;
  int x = 0;
  int y = 0;
  int width;
  int height;
  int lengthMatches;
  int widthMatches;
  int clearance;
  Match2 activeMatch2=null;
  Memory_second gameSpace2;
  int gameState2;

  Board2(this.canvas2,this.lengthMatches,this.widthMatches,this.clearance,this.solve2) {
    context = canvas2.getContext('2d');
    width = canvas2.width;
    height = canvas2.height;
    gameSpace2=new Memory_second(this);
    gameSpace2.initGameStep(3);
    
    querySelector('#canvas').onMouseDown.listen(onMouseDown);
    querySelector('#info_2').innerHtml="Coordonnnés:X=n/a , Y=n/a";
    querySelector('#info_3').innerHtml="Vous avez ${gameSpace2.displacements2} disponibles";
    querySelector('#canvas2').onMouseMove.listen(onMouseMove);
    window.onKeyDown.listen( onKeyDown); // Use onKeyDown instead of onKeyPress 
    window.animationFrame.then(gameLoop);
    solve2.onClick.listen(solveGame);
  }

  
  void gameLoop(num delta) {
    draw();
    window.animationFrame.then(gameLoop);
  }

  void clear() {
    context.clearRect(0, 0, width, height);
    
  }

  void border() {
    var grd = context.createLinearGradient(0, 0, canvas2.width, canvas2.height);
    context.rect(0, 0, width, height);
    grd.addColorStop(0, '#D9D9D9');
    grd.addColorStop(1, '#D9D9D9');
    context.fillStyle = grd;
    context.fill();
    // grid drawing 
    for(int i=clearance;i<height;i+=(lengthMatches~/2)){
      context.moveTo(0, i);  
      context.lineTo(650, i);
    }
    for(int i=clearance;i<width;i+=(lengthMatches~/2)){
          context.moveTo(i, 0);  
          context.lineTo(i, 450);
        }
    context.lineWidth = 1;
    context.strokeStyle = '#C3E8F7';
    context.stroke();

    gameSpace2.draw();
   
   
  }
  

  
  void draw() {
    clear();
    border();
  }
  
  
  void onMouseDown(MouseEvent e) {
    int x= e.offset.x;
    int y= e.offset.y;
    Segment nearest;
    gameState2=0;
    String Message="Vous avez ${gameSpace2.displacements2} disponibles";
    if (activeMatch2==null){
      activeMatch2=gameSpace2.verifyIfSelectedMatch2click(x,y);
    }
    else{
      nearest=gameSpace2.nearestSegment(x, y);
      if(gameSpace2.moveMatch2(activeMatch2, nearest)==false) {
        activeMatch2.setPosDraw(activeMatch2.posX2,activeMatch2.posY2,activeMatch2.orientation); 
      }        
      else{
        if (gameSpace2.displacements2==0){
            if (gameSpace2.validate2()==true){
              print('vous avez gagné!');
              gameState2 =1;
              Message='Vous avez gagné';
            }
            else{
              print('vous avez perdu!');
              gameState2=2;
              Message='Vous avez perdu';
            }
        }
      }  
      activeMatch2=null;
    }
    
    querySelector('#info_3').innerHtml=Message;
   
  }
  
  void onMouseMove(MouseEvent e) {
      y = e.offset.y;
      x = e.offset.x;
      Segment nearest;
      if (activeMatch2!=null){
        nearest=gameSpace2.nearestSegment(x, y);
        activeMatch2.setPosDraw(nearest.x_0,nearest.y_0,nearest.orientation());
      }
      querySelector('#info_2').innerHtml="Coordonnés: X= "+ x.toString() + ", Y=" + y.toString();
      
    }
  
  
    
  void onKeyDown(KeyboardEvent e){
    print(e.keyCode);  
    
     if  ((activeMatch2!=null)&&(e.keyCode == 32)) {
          print('pressed space');
          activeMatch2.rotate();
    }
     
  }
  
  void solveGame(Event e){
    gameSpace2.solve();
  }
}
