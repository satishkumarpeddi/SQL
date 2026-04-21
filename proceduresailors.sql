create or replace procedure get_info_of_sailors(
    p_sid in sailors.sid%type,
    psname out varchar2,
    prating out number
)
is 
begin
    select sname,rating into psname,prating from sailors where p_sid = sid;
    exception
      when no_data_found then
        psname:='Not Found';
        prating:=NULL; 
end;
/

declare
    v_sid sailors.sid%type;
    v_sname varchar2(50);
    v_rating number;
begin
    v_sid:=&v_sid;
    get_info_of_sailors(v_sid,v_sname,v_rating);
    dbms_output.put_line(v_sid||' '||v_sname);
end;
/