##### Martin Moreno
##### Jose Miguel Iturralde

_______
To run the implemented queries: 

```bash
rake db:queries_demo
```

[To see the Relational Model click here](https://www.lucidchart.com/publicSegments/view/755872e6-5752-446a-9971-919bd9438e13/image.png)

----

### What should happen model-wise if an event is deleted and guests have already cast votes?

Model-wise what will happen will be that the records associated with that specific event will be deleted in the following tables:
* event_home_page, image_event_page, video_event_page, pdf_event_page, comment, image_comment, hyperlink_comment, event_date, user_vote and event_creator

As for the table event_invitation, the foreign key event_id will be optional but just in the case the table is updated (not created). This because new notifications will be created when the event is destroyed, and this new pack of notifications will need the event_notification_id in order to match it with a user.
And this is why we cant delete the records of the events in the table event_invitation, just put his id to null.

-----

### What should happen model-wise if an organization is deleted and events have been already created within the organization?

Model-wise what will happen will be that the records associated with that specific organizations will be deleted in the following tables:
* organization_home_page, image_organization_page, video_organization_page, pdf_organization_page, organization_creator and organization_invitation

As for the events that were created within that the organization will happen the same as described in the question above

-----

### What should happen model-wise if a user is deleted and the user has already created organizations, events and/or comments?

Model-wise what will happen will be that all the records associated with that user will be deleted, in the case that the user had already created an organization and an event will happen the same as described in the questions above.