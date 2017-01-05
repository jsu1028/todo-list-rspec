require "rspec"

require_relative "list"
require_relative "task"

describe List do
  # Your specs here
    let(:title) { "Things to do" }
    let(:tasks) { [taskA, taskB, taskC] }
    let(:taskA) { Task.new(descriptionA) }
    let(:descriptionA) { "Try Rspec" }
    let(:taskB) { Task.new(descriptionB) }
    let(:descriptionB) { "Do more Code" }
    let(:taskC) { Task.new(descriptionC) }
    let(:descriptionC) { "Do TDD" }

    let(:list) { List.new(title, tasks) }

  describe "#initialize" do
    it "takes a title eql to 'New Shopping List' and array of tasks for its arguments" do
      @title = "New Shopping List"
      @tasks = [Task.new("buy ruby"), Task.new("buy ruby from Railey")]
      @groceryList = List.new(@title, @tasks)

      expect(@groceryList).to be_instance_of(List)
      expect(@title).to eql("New Shopping List")
      expect(@groceryList.title).to eql (@title)
      expect(@groceryList.tasks.length).to eql (2)
    end

    it "requires two arguments" do
      expect { List.new }.to raise_error(ArgumentError)
    end
  end

  describe "#add_task" do
    it "adds task to array of tasks" do
      new_task = Task.new("brand new task")
      list.add_task(new_task)
      expect(list.tasks.length).to eql(4)
    end
  end

  describe "#complete_task" do
    it "completes task at index" do
      index = 0
      list.complete_task(index)
      expect(list.tasks[index].complete?).to be_truthy
    end
  end

  describe "#delete_task" do
    it "removes task at index" do
      list.tasks.delete_at(2)
      expect(list.tasks.size).to eql(2)
    end
  end

  describe "#completed_tasks" do
    it "should select completed tasks" do
      list.complete_task(1)
      list.complete_task(0)
      expect(list.completed_tasks.size).to eql(2)
    end
  end

  describe "#incomplete_tasks" do
    it "should select incomplete tasks" do
      expect(list.incomplete_tasks.size).to eql(3)
    end
  end
end
