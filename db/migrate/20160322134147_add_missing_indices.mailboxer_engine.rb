<<<<<<< HEAD
# This migration comes from mailboxer_engine (originally 20131206080417)
=======

>>>>>>> 68ab471aa294942844a4484fda99090f6680fe2b
class AddMissingIndices < ActiveRecord::Migration[4.2]
  def change
   
    add_index :mailboxer_conversation_opt_outs, [:unsubscriber_id, :unsubscriber_type],
              name: 'index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type'
    add_index :mailboxer_conversation_opt_outs, :conversation_id

    add_index :mailboxer_notifications, :type
    add_index :mailboxer_notifications, [:sender_id, :sender_type]
    add_index :mailboxer_notifications, [:notified_object_id, :notified_object_type],
              name: 'index_mailboxer_notifications_on_notified_object_id_and_type'
    add_index :mailboxer_receipts, [:receiver_id, :receiver_type]
  end
end
