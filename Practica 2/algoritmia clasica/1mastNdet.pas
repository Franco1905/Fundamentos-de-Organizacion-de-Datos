program ejemplo;

var
    regm: prod; 
    min, regd1, regd2,regd3: v_prod;
    mae1: maestro; 
    det1,det2,det3: detalle;
procedure leer (var archivo: detalle; var dato:v_prod);
begin
    if (not eof(archivo))then 
        read (archivo,dato)
    else 
        dato.cod := valoralto;
end;

procedure minimo (var r1,r2,r3: v_prod; var min:v_prod);
begin
    if (r1.cod<=r2.cod) and (r1.cod<=r3.cod) then 
    begin
        min := r1;
        leer(det1,r1)
    end
    else 
    begin
        if (r2.cod<=r3.cod) then 
        begin
            min := r2;
            leer(det2,r2)
        end
        else 
        begin  
            min := r3;
            leer(det3,r3)
        end;
    end;
end;

begin
    assign (mae1, 'maestro'); 
    assign (det1, 'detalle1');
    assign (det2, 'detalle2'); 
    assign (det3, 'detalle3');
    reset (mae1); 
    reset (det1); 
    reset (det2); 
    reset (det3);
    leer(det1, regd1);
    leer(det2, regd2); 
    leer(det3, regd3);
    minimo(regd1, regd2, regd3, min);
    while (min.cod <> valoralto) do 
    begin
        read(mae1,regm);
        while (regm.cod <> min.cod) do
            read(mae1,regm);
        while (regm.cod = min.cod ) do 
        begin
            regm.cant:=regm.cant - min.cantvendida;
            minimo(regd1, regd2, regd3, min);
        end;
    seek (mae1, filepos(mae1)-1);
    write(mae1,regm);
    end;
end.