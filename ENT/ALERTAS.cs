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
    
    
    public class ALERTAS
    {
        
        private Int32 mID;
        
        private String mID_ALERTA;
        
        private String mDELIVERYTO;
        
        private String mFEED_URL;
        
        private String mHOWMANY;
        
        private String mhowOften;
        
        private String mlanguage;
        
        private String mquery;
        
        private String mregion;
        
        public virtual Int32 ID
        {
            get
            {
                return this.mID;
            }
            set
            {
                this.mID = value;
            }
        }
        
        public virtual String ID_ALERTA
        {
            get
            {
                return this.mID_ALERTA;
            }
            set
            {
                this.mID_ALERTA = value;
            }
        }
        
        public virtual String DELIVERYTO
        {
            get
            {
                return this.mDELIVERYTO;
            }
            set
            {
                this.mDELIVERYTO = value;
            }
        }
        
        public virtual String FEED_URL
        {
            get
            {
                return this.mFEED_URL;
            }
            set
            {
                this.mFEED_URL = value;
            }
        }
        
        public virtual String HOWMANY
        {
            get
            {
                return this.mHOWMANY;
            }
            set
            {
                this.mHOWMANY = value;
            }
        }
        
        public virtual String howOften
        {
            get
            {
                return this.mhowOften;
            }
            set
            {
                this.mhowOften = value;
            }
        }
        
        public virtual String language
        {
            get
            {
                return this.mlanguage;
            }
            set
            {
                this.mlanguage = value;
            }
        }
        
        public virtual String query
        {
            get
            {
                return this.mquery;
            }
            set
            {
                this.mquery = value;
            }
        }
        
        public virtual String region
        {
            get
            {
                return this.mregion;
            }
            set
            {
                this.mregion = value;
            }
        }
    }
}
