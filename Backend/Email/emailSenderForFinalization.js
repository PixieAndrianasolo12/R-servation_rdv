import nodemailer from 'nodemailer';
import ejs from 'ejs';
import fs from 'fs/promises';
import path from 'path';
import { format, addHours } from 'date-fns';
import { v4 as uuidv4 } from 'uuid';
import { fr } from 'date-fns/locale';
import { fileURLToPath } from 'url';
import { dirname } from 'path';



const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);



const emailSenderForFinalization = async (emailReceiver, additionalGuestEmail, filename, {date, time, reason }) => {
  const transporter = nodemailer.createTransport({
    service: 'gmail',
    host: 'smtp.gmail.com',
    port: 587,
    secure: false,
    auth: {
      user: "rakotoarisoatahiry87@gmail.com",
      pass: "fcww uveh lwrt gyqt",
    },
  });

  transporter.verify((error, success) => {
    if (error) {
      console.log('Erreur de configuration Nodemailer:', error);
    } else {
      console.log('Le serveur est prêt à prendre nos messages');
    }
  });

  console.log(`Received date: ${date}, time: ${time}`);

  if (!date || !time || isNaN(new Date(date).getTime())) {
    console.error('Invalid date or time value');
    return;
  }

  const formattedDate = format(new Date(date), 'dd MMMM yyyy', { locale: fr });
  console.log(`Formatted date: ${formattedDate}`);

  try {
    const templatePath = path.join(__dirname, 'EmailTemplate', `${filename}.ejs`);
    const templateContent = await fs.readFile(templatePath, 'utf8');
    console.log('Template EJS loaded');

    const renderedTemplate = ejs.render(templateContent, { date: formattedDate, time, reason });
    console.log('Template EJS rendered');

    const uid = uuidv4();

    const startDateTime = new Date(`${date}T${time}`);
    if (isNaN(startDateTime.getTime())) {
      throw new Error('Invalid start date time');
    }
    console.log('Start date time:', startDateTime);

    const endDateTime = addHours(startDateTime, 1);
    if (isNaN(endDateTime.getTime())) {
      throw new Error('Invalid end date time');
    }
    console.log('End date time:', endDateTime);

    const startISOString = startDateTime.toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z';
    const endISOString = endDateTime.toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z';

    const icsContent = `
BEGIN:VCALENDAR
VERSION:2.0
PRODID:"Centre de contrôle des rendez-vous"
METHOD:REQUEST
BEGIN:VEVENT
UID:${uid}@your-domain.com
DTSTAMP:${new Date().toISOString().replace(/[-:]/g, '').split('.')[0] + 'Z'}
DTSTART:${startISOString}
DTEND:${endISOString}
SUMMARY:${reason}
DESCRIPTION:${reason}
LOCATION:Office
ATTENDEE;CN=User;RSVP=TRUE:mailto:${emailReceiver}
ATTENDEE;CN=Additional Guest;RSVP=TRUE:mailto:${additionalGuestEmail}
END:VEVENT
END:VCALENDAR
`;
    console.log('ICS content generated');

    const mailOptions = {
      from: `"Centre de contrôle Réservation" <"rakotoarisoatahiry87@gmail.com">`,
      to: emailReceiver,
      subject: 'Nouveau rendez-vous',
      html: renderedTemplate,
      attachments: [
        {
          filename: 'invitation.ics',
          content: icsContent,
          contentType: 'text/calendar',
        },
      ],
    };

    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error('Erreur lors de l\'envoi de l\'email:', error);
      } else {
        console.log('Email envoyé: ' + info.response);
      }
    });

  } catch (error) {
    console.error('Erreur lors de la lecture du modèle EJS:', error);
  }
};

export default emailSenderForFinalization;
