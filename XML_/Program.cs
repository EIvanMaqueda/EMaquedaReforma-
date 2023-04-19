using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Linq;

namespace XML_
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
            XmlNodeList list;
            XmlDocument document= new XmlDocument();
            //crear el archivo nuevo
            XmlDocument documentnew= new XmlDocument();
            XmlDeclaration xmlDeclaration = documentnew.CreateXmlDeclaration("1.0", "ISO-8859-1", null);
            XmlElement root = documentnew.DocumentElement;
            documentnew.InsertBefore(xmlDeclaration, root);
            document.Load("../../archivo/DatosXML.xml");
            //XmlElement element = document.DocumentElement;
            //string tipo = element.GetAttribute("tipo");
            list = document.SelectNodes("/noticias/noticia");
            

            XmlElement Info = documentnew.CreateElement(string.Empty, "Info", string.Empty);
            documentnew.AppendChild(Info);
       
            foreach (XmlNode node in list)
            {
                string tipo = "4";
                string libre=node.SelectSingleNode("libre").InnerText;
                string id = node.SelectSingleNode("id").InnerText;
                string categoria = node.SelectSingleNode("categoria").InnerText;
                string titulo = node.SelectSingleNode("titulo").InnerText;
                string resumen = node.SelectSingleNode("resumen").InnerText;
                string prevurl = node.SelectSingleNode("prevurl").InnerText;
                string url = node.SelectSingleNode("url").InnerText;
                string is3idfp = node.SelectSingleNode("is3idfp").InnerText;
                string idaudio = node.SelectSingleNode("idaudio").InnerText;

                XmlElement podcast = documentnew.CreateElement(string.Empty, "podcast", string.Empty);
                Info.AppendChild(podcast);
                podcast.SetAttribute("tipo",tipo);
                podcast.SetAttribute("libre",libre);
                podcast.SetAttribute("id", id);
                podcast.SetAttribute("is3idfp", is3idfp);
                podcast.SetAttribute("is3idfp", is3idfp);
                podcast.SetAttribute("idaudio", idaudio);
                
                //podcast.Attributes.Append(documentnew.CreateAttribute("Id").Value = id) ;
                XmlElement Categoria = documentnew.CreateElement(string.Empty, "Categoria", string.Empty);
                XmlText textCategoria = documentnew.CreateTextNode(categoria);
                Categoria.AppendChild(textCategoria);
                podcast.AppendChild(Categoria);
                
                XmlElement Titulo = documentnew.CreateElement(string.Empty, "Titulo", string.Empty);
                XmlText textTitulo = documentnew.CreateTextNode(titulo);
                Titulo.AppendChild(textTitulo);
                podcast.AppendChild(Titulo);

                XmlElement Resumen = documentnew.CreateElement(string.Empty, "Resumen", string.Empty);
                XmlText textResumen = documentnew.CreateTextNode(resumen);
                Resumen.AppendChild(textResumen);
                podcast.AppendChild(Resumen);

                XmlElement Prevurl = documentnew.CreateElement(string.Empty, "Prevurl", string.Empty);
                XmlText textPrevurl = documentnew.CreateTextNode(prevurl);
                Prevurl.AppendChild(textPrevurl);
                podcast.AppendChild(Prevurl);

                XmlElement Url = documentnew.CreateElement(string.Empty, "Url", string.Empty);
                XmlText textUrl = documentnew.CreateTextNode(url);
                Url.AppendChild(textUrl);
                podcast.AppendChild(Url);
            }
            documentnew.Save("../../archivo/NuevoXml.xml");
        }
    }
}
