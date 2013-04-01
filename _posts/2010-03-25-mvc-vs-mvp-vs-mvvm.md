---
title: MVC vs MVP vs MVVM
category: code
layout: post
tags : [design patterns, silverlight]
---

{% include JB/setup %}

<p>
So here is my view of mvc, mvp, and mvvm....disclaimer....this is my educated opinion of the differences between mvc, mvp, and mvvm..... 
</p>

<p>
<img src="/assets/images/elvis.jpg" style="float: left; margin: 10px; border: none;" />
Once upon a time there was a passionate .Net developer named Elvis who hated how un-testable and un-maintainable UI development was. There were too many times where the soul (business logic and "workflow") of his application was lost in UI specific bells and whistles. So he decided to figure out a way to separate his domain model from the UI "noise". He was a console app developer, and found that the best way to have this seperation was to route all keyboard input from the user <strong>through a controlling class that would delegate a response to the view or do some processing on the model</strong>. The approach was wonderful! The concept of routing all keyboard events through this controller mechanism helped separate his business logic from the rendering logic required for displaying information to the user. It worked so well that the developer extended this to web development. <strong>Using an http handler, he was able to route all http requests through a controlling class</strong> (ASP MVC) just like he routed keyboard input from his console app. He dubbed this approach to development <strong>Model, View, Controller</strong>. Life was good and Elvis was happy.
</p>

<p>Soon after....</p>

<p>
Elvis was tasked with creating a rich client application using WinForms. Given his newly found design pattern, he started down the path of using MVC. He soon found that routing these events through a controller wasn't as easy in a rich client application. In this environment, the user could move the mouse, drag and drop, click buttons, type into text boxes and many other things. Elvis knew that it would be a <strong>ridiculous undertaking to try to route all of these events through a controller...even near impossible</strong>. Elvis was distraught...how would he ever be able to provide the same kind of separation he so enjoyed in console and web applications in this rich client environment???
</p>

<p>
After much deliberation. Elvis had an epiphany. <strong>The routing mechanism was already created for him...it was the simple concept of an event</strong>. Every action, whether it'd be a button click, or the user typing into a text box, resolved to an event on the form. Elvis knew that putting the business logic behind a button click, or text changed event was a bad idea. But, he wanted to leverage the rich eventing model provided by WinForms (and for that matter asp.net "classic"). Elvis, began by creating a class that would serve as the facilitator for his view interaction. <strong>All form events would just pass the request to this facilitator using one simple line of code</strong>.
</p>

<pre name="code" class="c#">
public class MyForm : Form, IView
{
    private _presenter = new Presenter(); // private member
    public MyForm()
    {
        buttonSave.Click += buttonSave_CLICK;
    }
 
    protected void buttonSave_CLICK() //save on click
    {
        _presenter.Save();
    }
}
</pre>

<p>
If the view behavior needed to change...the event could be rewired easily:
</p>

<pre name="code" class="c#">
public class MyForm : Form, IView
{
    private _presenter = new Presenter(); // private member
    public MyForm()
    {
        buttonSave.Hover += buttonSave_HOVER;
    }
 
    protected void buttonSave_HOVER() //save on click
    {
        _presenter.Save();
    }
}
</pre>
 
<p>
This worked really well for Elvis. <strong>But he needed some way to communicate back to his view implementation</strong>. He also wanted to keep the concrete view abstracted away from his facilitator. Elvis decided to create an <strong>interface that the concrete view has to implement</strong>. His facilitator class could then call back to the view whenever it deemed necessary.
For example:
</p>

<pre name="code" class="c#">
public class MyForm : Form, IView
{
    private _presenter = new Presenter(this);
    public MyForm()
    {
        buttonSave.Click += buttonSave_CLICK;
    }
    
    //save on click
    protected void buttonSave_CLICK() 
    {
        _presenter.Save();
    }
 
    //show message box if save is successful
    private IView.NotifySaveSuccessful() 
    {
        MessageBox.Show("success");
    }
 
    //show message box if save is successful
    private IView.NotifySaveFailed() 
    {
        MessageBox.Show("oh noes!");
    }
}
</pre>

<p> 
Elvis was able to put all his business logic inside of this facilitator class which he decided to call the <strong>Presenter</strong>. He was able to leverage the rich eventing model that WinForms (and asp.net "classic" for that mater) and still provide the separation of UI and Model he stands behind. Elvis dubbed this "evolution" of the MVC pattern <strong>Model, View, Presenter</strong>. Life was good and Elvis was happy.
</p>

<p> 
Soon after....Given Microsoft's 2 year release cycle....
</p>

<p> 
Elvis was tasked to do some Silverlight development. Taking the challenge with stride, he began implementing the application using the Model, View, Presenter pattern...things were going great. Then, one dark and stormy night, the business stakeholder he was working with sent an email:
</p>
 
<p>
Elvis,
<br/><br/>
We've heard of this new thing called UX! We've decided to bring a guy name Leonardo onto our team. He will be doing our UX for us. Please coordinate all of your UX development efforts with him.
<br/><br/>
Sincerely,<br/>
The buzz word guys
</p>

<p> 
Leonardo, unlike Elvis, had great artistic talent and was exceptionally good with XAML markup, but knew very little about code and developing programmatically. Elvis continued with his MVP approach despite Leonardo's short comings, but quickly found that working with Leonardo proved to be a little difficult....even the simplest tasks of wiring up a button click event in the code behind was an undertaking for him...Elvis found himself constantly having to change how things were wired up whenever Leonardo got "inspired" and wanted to change the UI. On top of this, Leonardo <strong>couldn't take advantage of the rich declarative databinding infrastructure that silverlight provides</strong>...unfortunately you can't bind to a Presenter method such as PopulateCustomer(Customer customerToPopulate);..."One problem at a time." Elvis thought to himself...
</p>

<p>Here is the <strong>MVP</strong> code that Elvis has created so far:</p>

<pre name="code" class="c#">
public class ContactsManagementPresenter
{
    public interface IView
    {
        void NotifyError(string error);
        void NotifySaveSuccessful();
        void PopulateContact(Contact contact);
        void PopulateContacts(List&lt;Contact&gt; contacts);
    }

    private Contact _currentEditingContact;
    private List&lt;Contact&gt; _contacts;
    private IView _view;
    public ContactsManagementPresenter(IView view)
    {
        _view = view;
        _currentEditingContact = new Contact
        {
            Email = string.Empty,
            FirstName = string.Empty,
            LastName = string.Empty,
            Id = Guid.NewGuid()
        };

        _contacts = new List&lt;Contact&gt;();

        //in a real environment, service calls would be made to
        //populate a list of contacts from the server
        _contacts.Add(new Contact
        {
            Id = Guid.NewGuid(),
            FirstName = "John",
            LastName = "Doe",
            Email = "johndoe@example.com"
        });

        _contacts.Add(new Contact
        {
            Id = Guid.NewGuid(),
            FirstName = "Jane",
            LastName = "Smith",
            Email = "janesmith@example.com"
        });

        _contacts.Add(new Contact
        {
            Id = Guid.NewGuid(),
            FirstName = "Rick",
            LastName = "Roll",
            Email = "user@example.com"
        });
    }

    public void Load()
    {
        _view.PopulateContacts(_contacts);
        _view.PopulateContact(_currentEditingContact);
    }

    public void NewContact()
    {
        _currentEditingContact = new Contact
        {
            Email = string.Empty,
            FirstName = string.Empty,
            LastName = string.Empty,
            Id = Guid.NewGuid()
        };

        _view.PopulateContact(_currentEditingContact);
    }

    public void SaveContact(string firstName, 
        string lastName, 
        string email)
    {
        if(string.IsNullOrEmpty(lastName))
        {
            _view.NotifyError("Last name is required.");
            return;
        }

        _currentEditingContact.FirstName = firstName;
        _currentEditingContact.LastName = lastName;
        _currentEditingContact.Email = email;

        //server side updates as opposed to this line of code
        if(_contacts.Any(c =&gt; c.Id == _currentEditingContact.Id) == false)
        {
            _contacts.Add(_currentEditingContact);
        }

        _view.PopulateContacts(_contacts);
        _view.PopulateContact(_currentEditingContact);
        _view.NotifySaveSuccessful();
    }

    public void EditContact(Guid id)
    {
        _currentEditingContact = _contacts.Single(c =&gt; c.Id == id);
        _view.PopulateContact(_currentEditingContact);
    }
}
</pre>

<p>
Elvis wanted to at least get this MVP implementation to the point where Leonardo <strong>could databind to it declaratively through xaml</strong>. He had seen databinding in Silverlight before and found that all the underlying binding structure really needed was to implement <strong>INotifyPropertyChanged</strong>.
</p>

<pre name="code" class="c#">
public class ContactManagmentPresenter : INotifyPropertyChanged
{
    public ContactManagmentPresenter()
    {
    }

    protected void OnPropertyChanged(string PropertyName)
    {
        var e = new PropertyChangedEventArgs(PropertyName);
        PropertyChangedEventHandler Handler = PropertyChanged;
        if (Handler != null) Handler(this, e);
    }

    public event PropertyChangedEventHandler PropertyChanged;
}
</pre>

<p>
After doing so, Elvis simply took _currentEditingContact and _contacts and <strong>exposed "getters"</strong> on them so that Leonardo <strong>could databind to these constructs without the need for IView interface methods</strong> such as PopulateContact and PopulateContacts.
</p>

<pre name="code" class="c#">
public class ContactManagmentPresenter : INotifyPropertyChanged
{
    public ContactManagmentPresenter()
    {
        _contacts = new List&lt;Contact&gt;();
        OnPropertyChanged("Contacts");
        _contact = new Contact();
        OnPropertyChanged("CurrentEditingContact");
    }
    
    protected void OnPropertyChanged(string PropertyName)
    {
        var e = new PropertyChangedEventArgs(PropertyName);
        PropertyChangedEventHandler Handler = PropertyChanged;
        if (Handler != null) Handler(this, e);
    }

    public event PropertyChangedEventHandler PropertyChanged;

    private Contact _currentEditingContact;
    public Contact CurrentEditingContact
    {
        get { return _currentEditingContact; }
        private set
        {
            _currentEditingContact = value;
            OnPropertyChanged("CurrentEditingContact");
        }
    }

    private List&lt;Contact&gt; _contacts;
    public List&lt;Contact&gt; Contacts
    {
        get { return _contacts; }
        private set
        {
            _contacts = value;
            OnPropertyChanged("Contacts");
        }
    }
}
</pre>

<p>
Leonardo was happier with this implementation. Now, <strong>instead of having to implement the IView interface</strong>, he can simple do this:
</p>

<pre name="code" class="html">
....
&lt;TextBox Margin="0, 0, 0, 5" 
            Text="{Binding CurrentEditingContact.FirstName, Mode=TwoWay}" /&gt;
&lt;TextBox Margin="0, 0, 0, 5" 
            Text="{Binding CurrentEditingContact.LastName, Mode=TwoWay}" /&gt;
&lt;TextBox Margin="0, 0, 0, 5" 
            Text="{Binding CurrentEditingContact.Email, Mode=TwoWay}" /&gt;
.....
.....
&lt;data:DataGrid Grid.Row="1"
 ItemsSource="{Binding Contacts}"
 CanUserReorderColumns="False"
 AutoGenerateColumns="False"
 AlternatingRowBackground="WhiteSmoke" RowBackground="White"
 SelectionMode="Extended"
 Margin="5, 0, 5, 0"
 SelectedItem="{Binding CurrentEditingContact, Mode=TwoWay}"
 IsReadOnly="True" &gt;
 &lt;data:DataGrid.Columns&gt;
    &lt;data:DataGridTextColumn Binding="{Binding FirstName}" 
                             Header="First Name" /&gt;
    &lt;data:DataGridTextColumn Binding="{Binding LastName}" 
                             Header="Last Name" /&gt;
    &lt;data:DataGridTextColumn Binding="{Binding Email}" 
                             Header="Email" /&gt;
 &lt;/data:DataGrid.Columns&gt;
&lt;/data:DataGrid&gt;
...
</pre>
