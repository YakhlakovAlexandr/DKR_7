uses GraphABC;

procedure draw(x,y,a,r:real;k:integer); 
begin
if k>0 then 
 begin
  r:=r*sin(pi/4);
  draw(x,y,a+pi/4,r,k-1);
  draw(x+r*cos(a+pi/4),y-r*sin(a+pi/4),a-pi/4,r,k-1);
 end
else
line(trunc(x),trunc(y),trunc(x+r*cos(a)),trunc(y-r*sin(a))); 
end; 

var x, y, x1, y1, k: integer;
 
procedure KeyDown(key: integer);
begin
  case key of
    VK_A:  begin  y1 := y1 - 50 end;
    VK_z:  begin  y1 := y1 + 50 end;
    VK_s:  k -= 1;
    VK_x:  k += 1; 
    VK_Down:  begin y += 50;  end;
    Vk_Up: begin y := y - 50;  end;
    vk_Left: x := x - 50;
    vk_Right: x := x + 50;
    vk_F: 
  end; 
  Window.Clear; 
  draw(x, y, x1, y1, k);
  redraw;
end;
 
begin
  LockDrawing;
  x := 100;
  y := 200;
  x1 := 400;
  y1 := 200;
  k:= 2;
  draw(x, y, x1, y1, k);
  redraw;
  onKeyDown += keydown;
end.
