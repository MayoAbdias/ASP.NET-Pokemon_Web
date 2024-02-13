using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class EmailServices
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailServices()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("mayoezequiel99@gmail.com", "gkwd rnkj mmep dnmd");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com";
        }
        public void armarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email = new MailMessage();
            email.From = new MailAddress("noresponder@correoprueba.com");
            email.To.Add(emailDestino);
            email.Subject = asunto;
            //email.IsBodyHtml = true;
            //email.Body = "<h1>Nos alegra que te hayas inscripto en nuestra web.. </h1>";
            email.Body = cuerpo;
        }
        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
