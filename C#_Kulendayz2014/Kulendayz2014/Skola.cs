using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;

namespace Kulendayz2014
{
    [DataContract]
    class Skola
    {
        [DataMember]
        public string naziv { get; set; }
        [DataMember]
        public int sifra { get; set; }
        [DataMember]
        public string adresa { get; set; }
    }
}
