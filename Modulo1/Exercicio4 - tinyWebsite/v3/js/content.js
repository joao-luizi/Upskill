const head = `
	<div id="topo"> </div>
    <nav align="center">
        <a data-page="index" href="">Homepage |</a>
        <a data-page="blog" href="">Blog |</a>
        <a data-page="gallery" href="">Gallery |</a>
        <a data-page="report" href="">Students Data |</a>
        <a data-page="application" href="">Application Form |</a>
        <a data-page="contact" href="">Contact |</a>
        <a data-page="resources" href="">Resources</a>
    </nav>
`

const foot = `
	<hr>
	<p align="center">&copy; Copyright ${currentYear} www.&ltabc&gt.com</p>
	<p align="center"><a href="#topo">Topo</a></p>
`
/*
0: index
1: blog
2: gallery
3: report
4: application
5: contact
6: resources
*/
const pages = {
	"index": `
	<h1 align="center">Welcome to My Website</h1>
	`,
	"blog":`
	<h1 align="center">Lorem Ipsum</h1>
	<h2 align="center">Ipsum</h2>

	<p align="center"><i>"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."</i><br>
	"There is no one who loves pain itself, who seeks after it and wants to have it, simply because it is pain..."</p>

	<hr>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquam mi odio, et fermentum velit tempus in. Maecenas feugiat finibus urna, at vehicula ante fringilla a. Maecenas non magna sed nibh rutrum posuere. Aliquam erat volutpat. Nulla quis nisi fringilla, feugiat urna eu, viverra nisi. Curabitur dignissim dignissim mauris. In auctor eleifend sapien in fringilla. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nunc ornare ipsum at pretium finibus. Vestibulum quis nisl leo. Fusce quis rutrum dui.</p>

	<p>Nunc et purus nec velit suscipit porttitor. Cras dui turpis, accumsan nec scelerisque sit amet, efficitur a felis. Proin at nisi tempor, auctor augue rhoncus, dictum nulla. Vivamus suscipit imperdiet rutrum. Nam ac risus rutrum, vestibulum orci vitae, cursus nibh. Praesent sodales dolor ut dolor mattis posuere. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nulla tristique neque et massa volutpat tempus. Vivamus aliquet tellus ac leo tempor suscipit. Duis posuere quam in odio rhoncus blandit. Cras feugiat nibh ut nunc tempus, ut sodales metus sodales. Cras risus nibh, viverra sed diam sit amet, sollicitudin vehicula elit. Sed id faucibus sem.</p>

	<p>Mauris id tellus at ligula facilisis interdum et eu tellus. Proin non facilisis risus. Sed facilisis augue non nisi sodales placerat. Nulla vel luctus erat, id imperdiet dolor. Nunc sed nibh vel nisl porttitor placerat. Maecenas lobortis laoreet placerat. Nulla et sodales est. Nam bibendum dictum sagittis. Donec pellentesque egestas pellentesque.</p>

	<p>Duis eget ullamcorper mauris. Sed tempor risus augue, eu consequat ipsum accumsan egestas. Duis finibus at metus in porta. Nunc maximus arcu eros, quis pretium lectus lacinia ac. Aliquam suscipit ex at tortor fermentum finibus ut vel nulla. Curabitur facilisis vehicula nulla et euismod. Curabitur orci ante, vestibulum posuere consectetur at, pulvinar in velit.</p>

	<p>Aenean lobortis varius lacinia. Cras at viverra quam. Aenean tempus blandit urna sit amet volutpat. Integer purus odio, bibendum at pulvinar eget, facilisis eu justo. In at massa ullamcorper, facilisis nunc eu, euismod mi. Cras ornare tincidunt turpis. Aenean eu diam risus. Integer in elit magna. Cras efficitur auctor ullamcorper.</p>

	<p><b>Generated 5 paragraphs, 356 words, 2385 bytes of Lorem Ipsum</b></p>
	<hr>

	<p><a href="mailto:help@lipsum.com">help@lipsum.com</a></p>
	`,
	"gallery":`
	<h1 align="center">Our Gallery</h1>

	<div align="center">
	<img src="img/image1.jpg" width="266" height="190" alt="Office Image">
	<img src="img/image2.jpg" width="266" height="190" alt="Home Office">
	<img src="img/image3.jpg" width="266" height="190" alt="Alternate Office">
	</div>
	`
	,
	"report": `
	<h1 align="center">Students Report</h1>

	<table align="center" border="1" cellspacing="0" cellpadding="10">
		<thead>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>County</th>
				<td><b>Email</b></td>
				<th align="left">Website</th>
			</tr>
		</thead>

		<tbody>    
			<tr>
				<td>James</td>
				<td>Butt</td>
				<td>Orleans</td>
				<td><a href="mailto:jbutt@gmail.com">jbutt@gmail.com</a></td>
				<td><a href="http:www.google.com">http://www.google.com</a></td>
			</tr>
		
			<tr>
				<td>Josephine</td>
				<td>Darakjy</td>
				<td>Livingston</td>
				<td><a href="mailto:josephine_darakjy@darakjy.org">josephine_darakjy@darakjy.org</a></td>
				<td><a href="http://www.yahoo.com">http://www.yahoo.com</a></td>
			</tr>
		
			<tr>
				<td>Art</td>
				<td>Venere</td>
				<td>Gloucester</td>
				<td><a href="mailto:art@venere.org">art@venere.org</a></td>
				<td><a href="http://www.hotmail.com">http://www.hotmail.com</a></td>
			</tr>
		</tbody>
		
		<tfoot>
			<tr>
				<td colspan="5">3 of 3 records displayed.</td>
			</tr>
		</tfoot>

	</table>
	`
	,
	"application":`
	<h1 align="center">Application Form</h1>

	<form>
	<input type="hidden" name="hiddenfield" value="whatever">

	<fieldset>
		<legend><b>Personal Information:</b></legend>
		Name: <input type="text" name="fullname"><br><br>
		Email: <input type="email" name="email"><br><br>
		Skype ID: <input type="text" name="skypeid"><br><br>
		Education/Degree? <input type="text" name="degree"><br><br>
	</fieldset><br>

	<fieldset>
		<legend><b>Freelancing Information:</b></legend>

		Which platforms do you use for freelancing?<br>
		<input type="checkbox" name="platform"> Upwork
		<input type="checkbox" name="platform"> Freelancer
		<input type="checkbox" name="platform"> Elancer
		<input type="checkbox" name="platform"> Reference based work
		<input type="checkbox" name="platform"> Other? <input type="text"><br><br>
		
		Which clients do you serve?<br>
		<input type="checkbox" name="clients">Foreign
		<input type="checkbox" name="clients">Local<br><br>
		
		What is your core area?<br>
		<input type="radio" name="corearea">Writer
		<input type="radio" name="corearea">Developer
		<input type="radio" name="corearea">Designer
		<input type="radio" name="corearea">Software Developer
		<input type="radio" name="corearea">Mobile Developer
		<input type="radio" name="corearea">Other? <input type="text"><br><br>

	</fieldset>


	What kind of training are you interested (if required): <br>
	<select name="trainingtype">
		<option value="remote">remote training</option>
		<option value="office">at office</option>
		<option value="home">home training</option>
	</select>
	<br><br>

	Do you want to say something about this website?<br>
	<textarea name="comment" cols="60" rows="10"></textarea>

	<input type="submit" value="Submit this Form">
	<input type="reset">

	</form>
	`
	,
	"contact": `
	<h1 align="center">Contact Us / Address Information</h1>

	<form>
	<table style="border:5px dotted" align="center">
	<tr>
	<td>Your Name: <input type="text"></td>
	</tr>
	<tr>
	<td>Your Email: <input type="email"></td>
	</tr>
	<tr>
	<td>Subject: <input type="text" name="subject"></td>
	</tr>
	<tr>
	<td>Comments: <br><textarea cols="50" rows="5"></textarea></td>
	</tr>
	<tr>
	<td><input type="submit"> <input type="reset"></td>
	</tr>
	</table>
	</form>

	<table align="center">
	<tr>
	<td>
	<p>Our postal address in Lisbon is:</p>

	<p style="color:blue;font-size:20px"><b>BC2 A1, Broadcast Centre<br>
	Rua das Flores<br>
	Lisbon</b></p>

	<p>Email <a href="mailto:editorial.policy.adviser@bbc.co.uk">editorial.policy.adviser@bbc.co.uk</a></p>

	<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3113.380674161149!2d-9.145790749083766!3d38.70906826552796!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0xd19347e69b37c71%3A0xa2005f8dd29eda4c!2sRua%20das%20Flores%2C%20Lisboa!5e0!3m2!1sen!2spt!4v1604574213423!5m2!1sen!2spt" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>

	</td>
	</tr>
	</table>
	`
	,
	"resources": `
	<h1 align="center">Helpful Resources</h1>

	<blockquote>

	<h3>Academic Resources</h3>
	<ul>
		<li><a href="http://clas.ku.edu/undergrad">College Advising & Student Services</a>- Change or update your major plus many more resources related to majors in the College of Liberal Arts and Sciences</li>
		<li><a href="http://careers.ku.edu/">University Career Center</a> - Information about student careers in majors at KU, internships and the Career Advancement Program</li>
	</ul>

	<h3>Campus Resources</h3>
	<ol>
		<li><a href="http://clas.ku.edu/undergrad">College Advising & Student Services</a>- Change or update your major plus many more resources related to majors in the College of Liberal Arts and Sciences</li>
		<li><a href="http://careers.ku.edu/">University Career Center</a> - Information about student careers in majors at KU, internships and the Career Advancement Program</li>
	</ol>


	<h3>TED talks, Graduation Speeches & Other Recorded Speakers</h3>
	<p>One way to learn from experienced business leaders and innovators who have first-hand knowledge of the business world is to find and watch recordings of their talks online.</p>

	<iframe width="560" height="315" src="https://www.youtube.com/embed/bNpx7gpSqbY" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

	</blockquote>
	`

}


