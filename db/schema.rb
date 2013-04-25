# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121109163942) do

  create_table "admin_pages", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.string   "url",        :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "admin_pages", ["title"], :name => "index_admin_pages_on_title"
  add_index "admin_pages", ["url"], :name => "index_admin_pages_on_url"

  create_table "certificates", :force => true do |t|
    t.integer  "identity_id",                :null => false
    t.string   "subject"
    t.string   "serial",                     :null => false
    t.text     "public"
    t.string   "type"
    t.string   "uuid",         :limit => 40
    t.datetime "revoked_at"
    t.datetime "valid_after"
    t.datetime "valid_before"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "certificates", ["identity_id"], :name => "index_certificates_on_identity_id"
  add_index "certificates", ["serial"], :name => "index_certificates_on_serial", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "documents", :force => true do |t|
    t.string   "__type",                  :limit => 30,  :null => false
    t.integer  "journal_id"
    t.string   "uuid",                    :limit => 40
    t.string   "file",                    :limit => 200, :null => false
    t.boolean  "file_processing"
    t.datetime "file_processed_at"
    t.string   "original_file_name",      :limit => 200, :null => false
    t.string   "content_type",            :limit => 75,  :null => false
    t.integer  "size",                                   :null => false
    t.string   "sha1_sum",                :limit => 40,  :null => false
    t.integer  "starting_page_by_script"
    t.integer  "length_by_script"
    t.integer  "starting_page_by_human"
    t.integer  "length_by_human"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.datetime "deleted_at"
  end

  add_index "documents", ["__type"], :name => "index_documents_on___type"
  add_index "documents", ["original_file_name", "journal_id"], :name => "index_documents_on_original_file_name_and_journal_id"

  create_table "identities", :force => true do |t|
    t.string   "email",      :limit => 100
    t.string   "name",       :limit => 100,                   :null => false
    t.boolean  "active",                    :default => true, :null => false
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "identities", ["email"], :name => "index_identities_on_email", :unique => true
  add_index "identities", ["name"], :name => "index_identities_on_name"

  create_table "jobs", :force => true do |t|
    t.string   "__type",      :limit => 30, :null => false
    t.integer  "document_id"
    t.text     "args"
    t.string   "started_by"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "jobs", ["__type"], :name => "index_jobs_on___type"
  add_index "jobs", ["document_id"], :name => "index_jobs_on_document_id"

  create_table "journals", :force => true do |t|
    t.integer  "type",                       :null => false
    t.integer  "serial",                     :null => false
    t.integer  "part"
    t.string   "uuid",         :limit => 40
    t.integer  "revoked_by"
    t.datetime "revoked_at"
    t.datetime "published_at",               :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "journals", ["published_at"], :name => "index_journals_on_published_at"
  add_index "journals", ["revoked_by", "revoked_at"], :name => "index_journals_on_revoked_by_and_revoked_at"
  add_index "journals", ["type", "serial", "part"], :name => "index_journals_on_type_and_serial_and_part"
  add_index "journals", ["uuid"], :name => "index_journals_on_uuid"

  create_table "pages", :force => true do |t|
    t.integer  "document_id",                   :null => false
    t.integer  "number",                        :null => false
    t.text     "content",                       :null => false
    t.boolean  "delta",       :default => true, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "pages", ["document_id"], :name => "index_pages_on_document_id"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "signatures", :force => true do |t|
    t.integer  "document_id"
    t.integer  "signature_document_id"
    t.integer  "certificate_id"
    t.datetime "signed_at",             :null => false
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "signatures", ["certificate_id"], :name => "index_signatures_on_certificate_id"
  add_index "signatures", ["document_id"], :name => "index_signatures_on_document_id"
  add_index "signatures", ["signature_document_id"], :name => "index_signatures_on_signature_document_id"

end
