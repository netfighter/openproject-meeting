#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2011-2013 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.md for more details.
#++

class RemoveMeetingRoleIdFromMeetingParticipants < ActiveRecord::Migration
  def up
    remove_column :meeting_participants, :meeting_role_id
  end

  def down
    add_column :meeting_participants, :meeting_role_id, :integer
  end
end