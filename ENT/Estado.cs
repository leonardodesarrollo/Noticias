//------------------------------------------------------------------------------
// <auto-generated>
//     Este código fue generado por una herramienta.
//     Versión de runtime:4.0.30319.42000
//
//     Los cambios en este archivo podrían causar un comportamiento incorrecto y se perderán si
//     se vuelve a generar el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ENT
{
    using System;
    
    
    public class Estado
    {
        
        private Int32 mIdEstado;
        
        private String mNombreEstado;
        
        private Int32 mActivo;
        
        public virtual Int32 IdEstado
        {
            get
            {
                return this.mIdEstado;
            }
            set
            {
                this.mIdEstado = value;
            }
        }
        
        public virtual String NombreEstado
        {
            get
            {
                return this.mNombreEstado;
            }
            set
            {
                this.mNombreEstado = value;
            }
        }
        
        public virtual Int32 Activo
        {
            get
            {
                return this.mActivo;
            }
            set
            {
                this.mActivo = value;
            }
        }
    }
}
