-- Para la realización de este apartado no hay una solución perfecta pero lo más similar sería
    -- Modificar el tipo empleado_t añadiendo que sea NOT INSATIABLE de manera que no podrá crear subtipos de esta por lo tanto no podrá pertener a los demás
    -- Se ha obtenido información de la siguiente fuente: https://docs.oracle.com/cd/B28359_01/appdev.111/b28371/adobjbas.htm#i456586
    -- Donde dice, Si un tipo no se puede crear una instancia, no puede crear instancias de instancias de ese tipo. No hay constructores (predeterminados o definidos por el usuario) para ello. 
    -- Puede utilizarlo con tipos destinados a servir únicamente como supertipos a partir de los cuales se crean instancias de subtipos especializados.
    -- Si un subtipo no proporciona una implementación para cada método no instantáneo heredado, el subtipo en sí, como el supertipo, debe declararse no realiza la instancia. 
    -- Un subtipo no instantáneo se puede definir en un supertipo instantáneo.


-- Creación del tipo EMPLEADO como objeto
CREATE OR REPLACE TYPE empleado_t AS OBJECT (
   dni VARCHAR(9),
   nombre VARCHAR(100),
   apellido1 VARCHAR(100),
   apellido2 VARCHAR(100)
)NOT INSTANTIABLE; 