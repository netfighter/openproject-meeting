#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2011-2013 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See doc/COPYRIGHT.md for more details.
#++

require File.dirname(__FILE__) + '/../spec_helper'

describe "MeetingMinutes" do
  before do
    @min = FactoryGirl.build :meeting_minutes
  end

  # meeting minutes are editable when the meeting agenda is locked
  describe "#editable?" do
    before(:each) do
      @mee = FactoryGirl.build :meeting
      @min.meeting = @mee
    end
    describe "with no agenda present" do
      it "is not editable" do
        @min.editable?.should be_false
      end
    end
    describe "with an agenda present" do
      before(:each) do
        @a = FactoryGirl.build :meeting_agenda
        @mee.agenda = @a
      end
      it "is not editable when the agenda is open" do
        @min.editable?.should be_false
      end
      it "is editable when the agenda is closed" do
        @a.lock!
        @min.editable?.should be_true
      end
    end
  end
end
