<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>    
<div class="container tm-mt-60">
	<div class="row tm-mb-50">
		<div class="col-lg-4 col-12 mb-5">
			<h2 class="tm-text-primary mb-5">Contact Page</h2>
			<form id="contact-form" action="" method="POST"
				class="tm-contact-form mx-auto">
				<div class="form-group">
					<input type="text" name="name" class="form-control rounded-0"
						placeholder="Name" required />
				</div>
				<div class="form-group">
					<input type="email" name="email" class="form-control rounded-0"
						placeholder="Email" required />
				</div>
				<div class="form-group">
					<select class="form-control" id="contact-select" name="inquiry">
						<option value="-">Subject</option>
						<option value="sales">Sales &amp; Marketing</option>
						<option value="creative">Creative Design</option>
						<option value="uiux">UI / UX</option>
					</select>
				</div>
				<div class="form-group">
					<textarea rows="8" name="message" class="form-control rounded-0"
						placeholder="Message" required=></textarea>
				</div>

				<div class="form-group tm-text-right">
					<button type="submit" class="btn btn-primary">Send</button>
				</div>
			</form>
		</div>
		<div class="col-lg-4 col-12 mb-5">
			<div class="tm-address-col">
				<h2 class="tm-text-primary mb-5">Our Address</h2>
				<p class="tm-mb-50">Quisque eleifend mi et nisi eleifend
					pretium. Duis porttitor accumsan arcu id rhoncus. Praesent
					fermentum venenatis ipsum, eget vestibulum purus.</p>
				<p class="tm-mb-50">Nulla ut scelerisque elit, in fermentum
					ante. Aliquam congue mattis erat, eget iaculis enim posuere nec.
					Quisque risus turpis, tempus in iaculis.</p>
				<address class="tm-text-gray tm-mb-50">
					120-240 Fusce eleifend varius tempus<br> Duis consectetur at
					ligula 10660
				</address>
				<ul class="tm-contacts">
					<li><a href="#" class="tm-text-gray"> <i
							class="fas fa-envelope"></i> Email: info@company.com
					</a></li>
					<li><a href="#" class="tm-text-gray"> <i
							class="fas fa-phone"></i> Tel: 010-020-0340
					</a></li>
					<li><a href="#" class="tm-text-gray"> <i
							class="fas fa-globe"></i> URL: www.company.com
					</a></li>
				</ul>
			</div>
		</div>
		<div class="col-lg-4 col-12">
			<h2 class="tm-text-primary mb-5">Our Location</h2>
			<!-- Map -->
			<div class="mapouter mb-4">
				<div class="gmap-canvas">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3918.4435924065174!2d106.6252534757038!3d10.853826357759889!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752bee0b0ef9e5%3A0x5b4da59e47aa97a8!2zQ8O0bmcgVmnDqm4gUGjhuqduIE3hu4FtIFF1YW5nIFRydW5n!5e0!3m2!1svi!2s!4v1711469559487!5m2!1svi!2s"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
			</div>
		</div>
	</div>
</div>


