require_relative 'test_helper'

class TestSavingAndLoading < Minitest::Test
  def test_it_can_load_the_things_it_saves
    # Turn these two rows into an array of entries
    entries = [Entry.new(reg_date: '11/12/08')]
    #   ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode
    #  1,11/12/08 10:47,Allison,Nguyen,arannon@jumpstartlab.com,6154385000,3155 19th St NW,Washington,DC,20010
    #  2,11/12/08 13:23,SArah,Hankins,pinalevitsky@jumpstartlab.com,414-520-5000,2022 15th Street NW,Washington,DC,20009
    

    # print it to some file (this is made up code, you need to do it the way you do in your real code)
    Printer.new(entries, 'test_output.csv').print

    # load it from the printed file
    loaded_entries = Loader.new('test_output.csv').load

    assert_equal 2, loaded_entries.size
    entry = loaded_entries.first
    assert_equal '11/12/08 10:47', entry.regdate
    assert_equal 'Allison',  entry.first_name
  end
end
