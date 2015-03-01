using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Threading.Tasks;

namespace Kulendayz2014DLL
{
    class ObradaOsoba
    {

        private WebClient client = new WebClient();
        public List<Osoba> getOsobe(String json)
        {
            List<Osoba> osobe = new List<Osoba>();
            try
            {
                DataContractJsonSerializer serializer = new DataContractJsonSerializer(osobe.GetType());

                MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(json));
                osobe = serializer.ReadObject(ms) as List<Osoba>;
                ms.Close();


            }
            catch (Exception ex)
            {
            }

            return osobe;

        }



    }
}
