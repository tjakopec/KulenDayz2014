using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace Kulendayz2014
{
    [DataContract]
    class Osoba
    {
        [DataMember]
        public string ime { get; set; }
        [DataMember]
        public string prezime { get; set; }
        [DataMember]
        public string slika { get; set; }
        [DataMember]
        public int sifra { get; set; }
        [DataMember]
        public DateTime datumRodenja { get; set; }
        [DataMember]
        public Skola skola { get; set; }
        [DataMember]
        public List<Interes> interesi { get; set; }

        [DataMember]
        public Decimal koeficijent { get; set; }

    }
}
