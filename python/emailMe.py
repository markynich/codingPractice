import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

################################################
# Only usable with GMAIL accounts
#
# email_user is the email that will be sending the emails
# email_pswd is the password for email_user
# email_send is the email that will receive it
# personalMsg is the body message inside the email
# subject is the subject of the email
################################################
email_user = 'example@gmail.com'
email_pswd = 'password'
email_send = 'email that will receive it'
personalMsg = 'email body message'
subject = 'subject of email'

################################################
# Use MIMEMultipart library to send email
################################################
msg = MIMEMultipart()
msg['From'] = email_user
msg['To'] = email_send
msg['Subject'] = subject
body = personalMsg
msg.attach(MIMEText(body,'plain'))
text = msg.as_string()

################################################
# login to email account of email_user
################################################
server = smtplib.SMTP('smtp.gmail.com',587)
server.starttls()
server.login(email_user,email_pswd)

################################################
# send email and quit/logout of email
################################################
server.sendmail(email_user,email_send,text)
server.quit()
