resource "microsoft365_exchange_mailbox_folder_permission" "example" {
  mailbox_email_address = "user1@example.com"
  user_id               = "user2@example.com"
  folder_name           = "Inbox"
  permission_level      = "Reviewer"
}