# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(username: "martinmoreno", password: "password", email: "mmoreno6@miuandes.cl")
ProfilePage.create(user: u1, picture: "image", name: "Martin", last_name: "Moreno", bio: "Student", location: "Chile")

u2 = User.create(username: "yiyoiturralde", password: "password", email: "yiyo@miuandes.cl")
ProfilePage.create(user: u2, picture: "image", name: "Yiyo", last_name: "Iturralde", bio: "Student", location: "Chile")

u3 = User.create(username: "juanitoperez", password: "password", email: "juanito@miuandes.cl")
ProfilePage.create(user: u3, picture: "image", name: "Juanito", last_name: "Perez", bio: "Student", location: "Chile")

admin_user = User.create(system_admin: true, username: "admin", password: "admin", email: "admin@admin.cl")
ProfilePage.create(user: admin_user, picture: "image", name: "Admin", last_name: "Admin", bio: "Admin", location: "Adminlandia")
MailBox.create(user: admin_user)

mb = MailBox.create(user: u1)
ReceivedMessage.create(mail_box: mb, sender_username: "yiyoiturralde", title: "Hi!", body: "How are you Martin")
ReceivedMessage.create(mail_box: mb, sender_username: "juanitoperez", title: "My Birthday", body: "Hey Martin, remember to bring me a present to my birthday")
SendMessage.create(mail_box: mb, receiver_username: "yiyoiturralde", title: "Hi yiyo!", body: "Im fine, and you?")

mb2 = MailBox.create(user: u2)
ReceivedMessage.create(mail_box: mb2, sender_username: "martinmoreno", title: "Hi yiyo!", body: "Im fine, and you?")
SendMessage.create(mail_box: mb2, receiver_username: "martinmoreno", title: "Hi!", body: "How are you Martin")

mb3 = MailBox.create(user: u3)
SendMessage.create(mail_box: mb3, receiver_username: "martinmoreno", title: "My Birthday", body: "Hey Martin, remember to bring me a present to my birthday")


oc = OrganizationCreator.create(user: u1)
o = Organization.create(organization_creator: oc)
OrganizationInvitation.create(user: u2 , organization: o, admin: false)
OrganizationInvitation.create(user: u3, organization: o, admin: true)


ohp = OrganizationHomePage.create(organization: o,name: "UAndes", description: "Universidad de los Andes, Chile", banner_picture: "url")
ImageOrganizationPage.create(organization_home_page: ohp, image: "url_image")
VideoOrganizationPage.create(organization_home_page: ohp,video: "url_video")
PdfOrganizationPage.create(organization_home_page: ohp,pdf: "url_pdf")


ec = EventCreator.create(user: u1)
e = Event.create(event_creator: ec, organization: o, location: "Event Location 1", minimum_guest: 20, event_rule: true)
ehp = EventHomePage.create(event: e, banner_picture: "banner1", title: "Event Name1", description: "Description Event 1")
ImageEventPage.create(event_home_page: ehp, image: "image1")
VideoEventPage.create(event_home_page: ehp, video: "video1")
PdfEventPage.create(event_home_page: ehp, pdf: "pdf1")

ei1 = EventInvitation.create(user: u2, event: e, report:true)
Notification.create(event_invitation: ei1, calendar: "Calendar1", notification_type: 0)
ei2 = EventInvitation.create(user: u3, event: e, report: false)
Notification.create(event_invitation: ei2, calendar: "Calendar2", notification_type: 0)
c1 = Comment.create(event_invitation: ei1, event_home_page: ehp, content: "Comment1")
ImageComment.create(comment: c1, image: "Image Comment1")
HyperLinkComment.create(comment: c1, hyperlink: "Hyperlink1")
Comment.create(event_invitation: ei2, event_home_page: ehp, content: "Comment2")
Comment.create(event_invitation: ei2, event_home_page: ehp, commented_id: 1,content: "Comment1Reply")


ed1 = EventDate.create(event: e, event_date: "2020-06-18 17:58:55")
EventDate.create(event: e, event_date: "2020-06-19 16:58:55")

UserVote.create(event_date: ed1, event_invitation: ei1)

ec = EventCreator.create(user: u1)
e = Event.create(event_creator: ec, organization: o, location: "Event Location 2", minimum_guest: 10, event_rule: false, hidden: true)
ehp = EventHomePage.create(event: e, banner_picture: "banner2", title: "Event Name2", description: "Description Event 2")
ImageEventPage.create(event_home_page: ehp, image: "image2")
ImageEventPage.create(event_home_page: ehp, image: "image3")
VideoEventPage.create(event_home_page: ehp, video: "video2")


ei1 = EventInvitation.create(user: u2, event: e, report: false)
Notification.create(event_invitation: ei1, calendar: "Calendar3", notification_type: 0)
ei2 = EventInvitation.create(user: u3, event: e, report: false)
Notification.create(event_invitation: ei2, calendar: "Calendar4", notification_type: 0)
c1 = Comment.create(event_invitation: ei2, event_home_page: ehp, content: "Comment4")
HyperLinkComment.create(comment: c1, hyperlink: "Hyperlink2")

ed1 = EventDate.create(event: e, event_date: "2020-06-23 17:20:55")
ed2 = EventDate.create(event: e, event_date: "2020-06-24 16:40:55")

UserVote.create(event_date: ed1, event_invitation: ei1)
UserVote.create(event_date: ed2, event_invitation: ei2)

ec = EventCreator.create(user: u2)
e = Event.create(event_creator: ec, location: "Event Location 3", minimum_guest: 50, event_rule: true)
ehp = EventHomePage.create(event: e, banner_picture: "banner3", title: "Event Name3", description: "Description Event 3")
VideoEventPage.create(event_home_page: ehp, video: "video3")
PdfEventPage.create(event_home_page: ehp, pdf: "pdf2")
PdfEventPage.create(event_home_page: ehp, pdf: "pdf3")

ei1 = EventInvitation.create(user: u3, event: e, report: false)
Notification.create(event_invitation: ei1, calendar: "Calendar5", notification_type: 0)
Comment.create(event_invitation: ei1, event_home_page: ehp, content: "Comment5")
Comment.create(event_invitation: ei1, event_home_page: ehp, content: "Comment6")

EventDate.create(event: e, event_date: "2020-06-23 17:20:55")
EventDate.create(event: e, event_date: "2020-07-11 16:40:55")
ed3 = EventDate.create(event: e, event_date: "2020-08-20 11:40:55")

UserVote.create(event_date: ed3, event_invitation: ei1)

