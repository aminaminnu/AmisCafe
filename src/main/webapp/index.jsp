<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <title>Amis Café - Taste the Difference</title>
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- Favicons 
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon"> -->

  <!-- Fonts -->
  <link href="https://fonts.googleapis.com" rel="preconnect">
  <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Amatic+SC:wght@400;700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="assets/css/main.css" rel="stylesheet">
</head>
<body class="index-page">

  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container position-relative d-flex align-items-center justify-content-between">

      <a href="index.html" class="logo d-flex align-items-center me-auto me-xl-0">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="assets/img/logo.png" alt=""> -->
        <h1 class="sitename">Amis Café</h1>
        <span>.</span>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="#hero" class="active">Home<br></a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#menu">Menu</a></li>
          <li><a href="#events">Events</a></li>
          <li><a href="#chefs">Chefs</a></li>
          <li><a href="#gallery">Gallery</a></li>
         <li class="dropdown">
  <a href="#"><span>Order</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
    <ul>
    <!-- Indian Cuisine -->
<li class="dropdown">
  <a href="#"><span>Indian</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
  <ul>
    <li><a href="menu?cuisine=Indian&type=veg">Veg</a></li>
    <li><a href="menu?cuisine=Indian&type=nonveg">Non-Veg</a></li>
    <li><a href="menu?cuisine=Indian&type=specials">Specials</a></li>
  </ul>
</li>

<!-- Chinese Cuisine -->
<li class="dropdown">
  <a href="#"><span>Chinese</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
  <ul>
    <li><a href="menu?cuisine=Chinese&type=veg">Veg</a></li>
    <li><a href="menu?cuisine=Chinese&type=nonveg">Non-Veg</a></li>
    <li><a href="menu?cuisine=Chinese&type=specials">Specials</a></li>
  </ul>
</li>

<!-- Italian Cuisine -->
<li class="dropdown">
  <a href="#"><span>Italian</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
  <ul>
    <li><a href="menu?cuisine=Italian&type=veg">Veg</a></li>
    <li><a href="menu?cuisine=Italian&type=nonveg">Non-Veg</a></li>
    <li><a href="menu?cuisine=Italian&type=specials">Specials</a></li>
  </ul>
</li>

<!-- Continental Cuisine -->
<li class="dropdown">
  <a href="#"><span>Continental</span> <i class="bi bi-chevron-down toggle-dropdown"></i></a>
  <ul>
    <li><a href="menu?cuisine=Continental&type=veg">Veg</a></li>
    <li><a href="menu?cuisine=Continental&type=nonveg">Non-Veg</a></li>
    <li><a href="menu?cuisine=Continental&type=specials">Specials</a></li>
  </ul>
</li>
</ul>
         
         
         <li><a href="#contact">Contact</a></li>
</ul>
<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
</nav>

<!-- Right side: show only if user is logged in -->
<c:if test="${not empty sessionScope.user}">
  <div class="dropdown ms-3">
    <a class="btn btn-danger dropdown-toggle" href="#" role="button" id="userMenu" 
       data-bs-toggle="dropdown" aria-expanded="false">
      Welcome, ${sessionScope.user.name}
    </a>
    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userMenu">
      <li><a class="dropdown-item" href="viewCart"><i class="bi bi-cart"></i> Cart</a></li>
      <li><a class="dropdown-item" href="index.jsp#book-a-table"><i class="bi bi-calendar-event"></i> Book a Table</a></li>
      <li><a class="dropdown-item text-danger" href="logout"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
    </ul>
  </div>
</c:if>
         
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section light-background">

      <div class="container">
        <div class="row gy-4 justify-content-center justify-content-lg-between">
          <div class="col-lg-5 order-2 order-lg-1 d-flex flex-column justify-content-center">
            <h1 data-aos="fade-up">Enjoy Your Healthy<br>Delicious Food</h1>
            <p data-aos="fade-up" data-aos-delay="100">We are team of talented designers making websites with Bootstrap</p>
            <div class="d-flex" data-aos="fade-up" data-aos-delay="200">
              <div class="d-flex flex-wrap gap-2" data-aos="fade-up" data-aos-delay="200">
     <button type="button" class="btn-get-started" data-bs-toggle="modal" data-bs-target="#loginModal">
      Login
    </button>
    <button type="button" class="btn-get-started" style="background:#fff; color:#c00; border:1px solid #c00;" 
          data-bs-toggle="modal" data-bs-target="#signupModal">
    Sign Up
   </button>
  </div>
              
            </div>
          </div>
          <div class="col-lg-5 order-1 order-lg-2 hero-img" data-aos="zoom-out">
            <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
          </div>
        </div>
      </div>

    </section><!-- /Hero Section -->
    
    
  <!-- Login Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-4 rounded-3 shadow-lg">
      <div class="modal-header border-0">
        <h5 class="modal-title">Login to Amis Café</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form action="UserController" method="post">
  <input type="hidden" name="action" value="login">
  <div class="mb-3">
    <input type="email" class="form-control" name="email" placeholder="Email" required>
  </div>
  <div class="mb-3">
    <input type="password" class="form-control" name="password" placeholder="Password" required>
  </div>
  <button type="submit" class="btn btn-danger w-100">Login</button>
</form>
        
      </div>
    </div>
  </div>
</div>

<!-- Sign Up Modal -->
<div class="modal fade" id="signupModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content p-4 rounded-3 shadow-lg">
      <div class="modal-header border-0">
        <h5 class="modal-title">Create Your Account</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <form action="UserController" method="post">
  <input type="hidden" name="action" value="signup">
  <input type="hidden" name="role" value="USER">
  <div class="mb-3">
    <input type="text" class="form-control" name="name" placeholder="Full Name" required>
  </div>
  <div class="mb-3">
    <input type="email" class="form-control" name="email" placeholder="Email" required>
  </div>
  <div class="mb-3">
    <input type="password" class="form-control" name="password" placeholder="Password" required>
  </div>
  <button type="submit" class="btn btn-danger w-100">Sign Up</button>
</form>
        
      </div>
    </div>
  </div>
</div>
  
    

    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>About Us<br></h2>
        <p><span>Learn More</span> <span class="description-title">About Us</span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">
          <div class="col-lg-7" data-aos="fade-up" data-aos-delay="100">
            <img src="assets/img/about.jpg" class="img-fluid mb-4" alt="">
            <div class="book-a-table">
              <h3>Book a Table</h3>
              <p>+1 5589 55488 55</p>
            </div>
          </div>
         <div class="col-lg-5" data-aos="fade-up" data-aos-delay="250">
  <div class="content ps-0 ps-lg-5">
    <p class="fst-italic">
      Welcome to Amis Café, where we serve delicious meals made with fresh ingredients and love.
    </p>
    <ul>
      <li><i class="bi bi-check-circle-fill"></i> <span>Freshly prepared dishes made daily for your enjoyment.</span></li>
      <li><i class="bi bi-check-circle-fill"></i> <span>Our recipes are crafted to bring out the finest flavors.</span></li>
      <li><i class="bi bi-check-circle-fill"></i> <span>Experience a cozy atmosphere perfect for family and friends.</span></li>
    </ul>
    <p>
      At Amis Café, we prioritize quality and taste in every meal we serve. Come and enjoy a delightful dining experience with us.
    </p>

    <div class="position-relative mt-4">
      <img src="assets/img/about-2.jpg" class="img-fluid" alt="Delicious food at Amis Café">
      <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox pulsating-play-btn"></a>
    </div>
  </div>
</div>
         
      </div>

    </section><!-- /About Section -->

    <!-- Why Us Section -->
    <section id="why-us" class="why-us section light-background">

      <div class="container">

        <div class="row gy-4">

        <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
  <div class="why-box">
    <h3>Why Choose Amis Café</h3>
    <p>
      At Amis Café, we offer a unique dining experience with fresh ingredients, delicious recipes, and a warm, welcoming atmosphere. Every meal is prepared with care to satisfy your taste buds.
    </p>
    <div class="text-center">
      <a href="#" class="more-btn"><span>Learn More</span> <i class="bi bi-chevron-right"></i></a>
    </div>
  </div>
</div><!-- End Why Box -->

<div class="col-lg-8 d-flex align-items-stretch">
  <div class="row gy-4" data-aos="fade-up" data-aos-delay="200">

    <div class="col-xl-4">
      <div class="icon-box d-flex flex-column justify-content-center align-items-center">
        <i class="bi bi-clipboard-data"></i>
        <h4>Fresh Ingredients</h4>
        <p>We use only the freshest ingredients to create meals that are both healthy and delicious.</p>
      </div>
    </div><!-- End Icon Box -->

    <div class="col-xl-4" data-aos="fade-up" data-aos-delay="300">
      <div class="icon-box d-flex flex-column justify-content-center align-items-center">
        <i class="bi bi-gem"></i>
        <h4>Exquisite Recipes</h4>
        <p>Our chefs craft each dish with care, ensuring flavors that delight and satisfy every guest.</p>
      </div>
    </div><!-- End Icon Box -->

    <div class="col-xl-4" data-aos="fade-up" data-aos-delay="400">
      <div class="icon-box d-flex flex-column justify-content-center align-items-center">
        <i class="bi bi-inboxes"></i>
        <h4>Cozy Atmosphere</h4>
        <p>Enjoy a warm, inviting space perfect for family gatherings, friends, or a relaxing meal alone.</p>
      </div>
    </div><!-- End Icon Box -->

  </div>
</div>
        

    <!-- Stats Section -->
    <section id="stats" class="stats section dark-background">

      <img src="assets/img/stats-bg.jpg" alt="" data-aos="fade-in">

      <div class="container position-relative" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p>Clients</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p>Projects</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
              <p>Hours Of Support</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-3 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="32" data-purecounter-duration="1" class="purecounter"></span>
              <p>Workers</p>
            </div>
          </div><!-- End Stats Item -->

        </div>

      </div>

    </section><!-- /Stats Section -->

  <!-- Menu Section --> 
<section id="menu" class="menu section">

  <!-- Section Title -->
  <div class="container section-title" data-aos="fade-up">
    <h2>Our Menu</h2>
    <p><span>Check Our</span> <span class="description-title">Delicious Dishes</span></p>
  </div><!-- End Section Title -->

  <div class="container">

    <ul class="nav nav-tabs d-flex justify-content-center" data-aos="fade-up" data-aos-delay="100">
      <li class="nav-item">
        <a class="nav-link active show" data-bs-toggle="tab" data-bs-target="#menu-starters">
          <h4>Starters</h4>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-breakfast">
          <h4>Breakfast</h4>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-lunch">
          <h4>Lunch</h4>
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" data-bs-toggle="tab" data-bs-target="#menu-dinner">
          <h4>Dinner</h4>
        </a>
      </li>
    </ul>

    <div class="tab-content" data-aos="fade-up" data-aos-delay="200">

      <!-- Starters -->
      <div class="tab-pane fade active show" id="menu-starters">
        <div class="tab-header text-center">
          <p>Menu</p>
          <h3>Starters</h3>
        </div>
        <div class="row gy-5">

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-1.png" class="glightbox"><img src="assets/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
            <h4>Bruschetta</h4>
            <p class="ingredients">Grilled bread, fresh tomatoes, garlic, olive oil</p>
            <p class="price">$5.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
            <h4>Stuffed Mushrooms</h4>
            <p class="ingredients">Mushrooms, cheese, herbs, garlic</p>
            <p class="price">$7.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
            <h4>Chicken Wings</h4>
            <p class="ingredients">Spicy chicken wings with dipping sauce</p>
            <p class="price">$8.95</p>
          </div>

        </div>
      </div><!-- End Starters -->

      <!-- Breakfast -->
      <div class="tab-pane fade" id="menu-breakfast">
        <div class="tab-header text-center">
          <p>Menu</p>
          <h3>Breakfast</h3>
        </div>
        <div class="row gy-5">

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
            <h4>Pancakes</h4>
            <p class="ingredients">Fluffy pancakes with maple syrup and berries</p>
            <p class="price">$6.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
            <h4>Omelette</h4>
            <p class="ingredients">Eggs, cheese, vegetables, choice of meat</p>
            <p class="price">$7.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
            <h4>Avocado Toast</h4>
            <p class="ingredients">Sourdough, avocado, cherry tomatoes, seeds</p>
            <p class="price">$5.95</p>
          </div>

        </div>
      </div><!-- End Breakfast -->

      <!-- Lunch -->
      <div class="tab-pane fade" id="menu-lunch">
        <div class="tab-header text-center">
          <p>Menu</p>
          <h3>Lunch</h3>
        </div>
        <div class="row gy-5">

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-1.png" class="glightbox"><img src="assets/img/menu/menu-item-1.png" class="menu-img img-fluid" alt=""></a>
            <h4>Caesar Salad</h4>
            <p class="ingredients">Romaine lettuce, croutons, parmesan, Caesar dressing</p>
            <p class="price">$8.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-2.png" class="glightbox"><img src="assets/img/menu/menu-item-2.png" class="menu-img img-fluid" alt=""></a>
            <h4>Grilled Chicken Sandwich</h4>
            <p class="ingredients">Grilled chicken, lettuce, tomato, mayo, bun</p>
            <p class="price">$9.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-3.png" class="glightbox"><img src="assets/img/menu/menu-item-3.png" class="menu-img img-fluid" alt=""></a>
            <h4>Margherita Pizza</h4>
            <p class="ingredients">Tomato, mozzarella, basil, olive oil</p>
            <p class="price">$12.95</p>
          </div>

        </div>
      </div><!-- End Lunch -->

      <!-- Dinner -->
      <div class="tab-pane fade" id="menu-dinner">
        <div class="tab-header text-center">
          <p>Menu</p>
          <h3>Dinner</h3>
        </div>
        <div class="row gy-5">

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-4.png" class="glightbox"><img src="assets/img/menu/menu-item-4.png" class="menu-img img-fluid" alt=""></a>
            <h4>Grilled Salmon</h4>
            <p class="ingredients">Salmon fillet, lemon, herbs, seasonal vegetables</p>
            <p class="price">$14.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-5.png" class="glightbox"><img src="assets/img/menu/menu-item-5.png" class="menu-img img-fluid" alt=""></a>
            <h4>Beef Steak</h4>
            <p class="ingredients">Grilled beef, garlic butter, mashed potatoes</p>
            <p class="price">$16.95</p>
          </div>

          <div class="col-lg-4 menu-item">
            <a href="assets/img/menu/menu-item-6.png" class="glightbox"><img src="assets/img/menu/menu-item-6.png" class="menu-img img-fluid" alt=""></a>
            <h4>Vegetable Pasta</h4>
            <p class="ingredients">Pasta, seasonal vegetables, tomato sauce, parmesan</p>
            <p class="price">$12.95</p>
          </div>

        </div>
      </div><!-- End Dinner -->

    </div>

  </div>

</section><!-- /Menu Section -->
  

   <!-- Testimonials Section -->
<section id="testimonials" class="testimonials section light-background">

  <!-- Section Title -->
  <div class="container section-title" data-aos="fade-up">
    <h2>Testimonials</h2>
    <p>What Are They <span class="description-title">Saying About Us</span></p>
  </div><!-- End Section Title -->

  <div class="container" data-aos="fade-up" data-aos-delay="100">

    <div class="swiper init-swiper">
      <script type="application/json" class="swiper-config">
        {
          "loop": true,
          "speed": 600,
          "autoplay": {
            "delay": 5000
          },
          "slidesPerView": "auto",
          "pagination": {
            "el": ".swiper-pagination",
            "type": "bullets",
            "clickable": true
          }
        }
      </script>
      <div class="swiper-wrapper">

        <div class="swiper-slide">
          <div class="testimonial-item">
            <div class="row gy-4 justify-content-center">
              <div class="col-lg-6">
                <div class="testimonial-content">
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span>“The food at Amis Café is absolutely amazing! Every dish is fresh, flavorful, and beautifully presented. I always enjoy coming here with friends and family.”</span>
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                  <h3>Saul Goodman</h3>
                  <h4>CEO &amp; Founder</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 text-center">
                <img src="assets/img/testimonials/testimonials-1.jpg" class="img-fluid testimonial-img" alt="">
              </div>
            </div>
          </div>
        </div><!-- End testimonial item -->

        <div class="swiper-slide">
          <div class="testimonial-item">
            <div class="row gy-4 justify-content-center">
              <div class="col-lg-6">
                <div class="testimonial-content">
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span>“I love the cozy atmosphere at Amis Café. The staff is friendly, and the menu has something for everyone. It's my go-to spot for breakfast and brunch!”</span>
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                  <h3>Sara Wilsson</h3>
                  <h4>Designer</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 text-center">
                <img src="assets/img/testimonials/testimonials-2.jpg" class="img-fluid testimonial-img" alt="">
              </div>
            </div>
          </div>
        </div><!-- End testimonial item -->

        <div class="swiper-slide">
          <div class="testimonial-item">
            <div class="row gy-4 justify-content-center">
              <div class="col-lg-6">
                <div class="testimonial-content">
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span>“Amazing quality and great service! I tried their lunch menu, and every dish was delicious. Highly recommend the pasta and salads.”</span>
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                  <h3>Jena Karlis</h3>
                  <h4>Store Owner</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 text-center">
                <img src="assets/img/testimonials/testimonials-3.jpg" class="img-fluid testimonial-img" alt="">
              </div>
            </div>
          </div>
        </div><!-- End testimonial item -->

        <div class="swiper-slide">
          <div class="testimonial-item">
            <div class="row gy-4 justify-content-center">
              <div class="col-lg-6">
                <div class="testimonial-content">
                  <p>
                    <i class="bi bi-quote quote-icon-left"></i>
                    <span>“Every visit to Amis Café is a delight. From the appetizers to desserts, everything tastes fresh and homemade. The ambiance makes it perfect for relaxing meals.”</span>
                    <i class="bi bi-quote quote-icon-right"></i>
                  </p>
                  <h3>John Larson</h3>
                  <h4>Entrepreneur</h4>
                  <div class="stars">
                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 text-center">
                <img src="assets/img/testimonials/testimonials-4.jpg" class="img-fluid testimonial-img" alt="">
              </div>
            </div>
          </div>
        </div><!-- End testimonial item -->

      </div>
      <div class="swiper-pagination"></div>
    </div>

  </div>

</section><!-- /Testimonials Section -->
   
    <!-- Events Section -->
<section id="events" class="events section">

  <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">

    <div class="swiper init-swiper">
      <script type="application/json" class="swiper-config">
        {
          "loop": true,
          "speed": 600,
          "autoplay": {
            "delay": 5000
          },
          "slidesPerView": "auto",
          "pagination": {
            "el": ".swiper-pagination",
            "type": "bullets",
            "clickable": true
          },
          "breakpoints": {
            "320": {
              "slidesPerView": 1,
              "spaceBetween": 40
            },
            "1200": {
              "slidesPerView": 3,
              "spaceBetween": 1
            }
          }
        }
      </script>
      <div class="swiper-wrapper">

        <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-1.jpg)">
          <h3>Custom Parties</h3>
          <div class="price align-self-start">$99</div>
          <p class="description">
            Celebrate your special moments your way! Our team will help you design a personalized party with delicious food, drinks, and a cozy atmosphere.
          </p>
        </div><!-- End Event item -->

        <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-2.jpg)">
          <h3>Private Parties</h3>
          <div class="price align-self-start">$289</div>
          <p class="description">
            Enjoy an exclusive gathering with friends or colleagues. Amis Café offers a private space, customized menu, and attentive service to make your party memorable.
          </p>
        </div><!-- End Event item -->

        <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-3.jpg)">
          <h3>Birthday Parties</h3>
          <div class="price align-self-start">$499</div>
          <p class="description">
            Make birthdays extra special with our themed party setups, tasty treats, and fun activities. Perfect for kids and adults alike!
          </p>
        </div><!-- End Event item -->

        <div class="swiper-slide event-item d-flex flex-column justify-content-end" style="background-image: url(assets/img/events-4.jpg)">
          <h3>Wedding Parties</h3>
          <div class="price align-self-start">$899</div>
          <p class="description">
            Celebrate your wedding day in style. From exquisite menus to elegant decor, we provide a beautiful setting and exceptional service for your big day.
          </p>
        </div><!-- End Event item -->

      </div>
      <div class="swiper-pagination"></div>
    </div>

  </div>

</section><!-- /Events Section -->
    
    <!-- Chefs Section -->
<section id="chefs" class="chefs section">

  <!-- Section Title -->
  <div class="container section-title" data-aos="fade-up">
    <h2>Chefs</h2>
    <p><span>Our</span> <span class="description-title">Professional Chefs</span></p>
  </div><!-- End Section Title -->

  <div class="container">

    <div class="row gy-4">

      <div class="col-lg-4 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
        <div class="team-member">
          <div class="member-img">
            <img src="assets/img/chefs/chefs-1.jpg" class="img-fluid" alt="Walter White">
            <div class="social">
              <a href="#"><i class="bi bi-twitter"></i></a>
              <a href="#"><i class="bi bi-facebook"></i></a>
              <a href="#"><i class="bi bi-instagram"></i></a>
              <a href="#"><i class="bi bi-linkedin"></i></a>
            </div>
          </div>
          <div class="member-info">
            <h4>Walter White</h4>
            <span>Master Chef</span>
            <p>With years of experience in culinary arts, Walter White brings creativity and precision to every dish, ensuring an unforgettable dining experience.</p>
          </div>
        </div>
      </div><!-- End Chef Team Member -->
    
          <div class="col-lg-4 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
  <div class="team-member">
    <div class="member-img">
      <img src="assets/img/chefs/chefs-2.jpg" class="img-fluid" alt="Sarah Johnson">
      <div class="social">
        <a href="#"><i class="bi bi-twitter"></i></a>
        <a href="#"><i class="bi bi-facebook"></i></a>
        <a href="#"><i class="bi bi-instagram"></i></a>
        <a href="#"><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
    <div class="member-info">
      <h4>Sarah Johnson</h4>
      <span>Pastry Chef</span>
      <p>Sarah specializes in creating exquisite desserts and pastries. Her passion for baking brings a sweet touch to every dish she prepares.</p>
    </div>
  </div>
</div><!-- End Chef Team Member -->

<div class="col-lg-4 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
  <div class="team-member">
    <div class="member-img">
      <img src="assets/img/chefs/chefs-3.jpg" class="img-fluid" alt="William Anderson">
      <div class="social">
        <a href="#"><i class="bi bi-twitter"></i></a>
        <a href="#"><i class="bi bi-facebook"></i></a>
        <a href="#"><i class="bi bi-instagram"></i></a>
        <a href="#"><i class="bi bi-linkedin"></i></a>
      </div>
    </div>
    <div class="member-info">
      <h4>William Anderson</h4>
      <span>Cook</span>
      <p>William brings creativity and skill to every meal he prepares. With years of experience, he ensures each dish is flavorful and memorable.</p>
    </div>
  </div>
</div><!-- End Chef Team Member -->

</div>
</div>
</section><!-- /Chefs Section -->
          

    <!-- Book A Table Section -->
    <section id="book-a-table" class="book-a-table section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Book A Table</h2>
        <p><span>Book Your</span> <span class="description-title">Stay With Us<br></span></p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row g-0" data-aos="fade-up" data-aos-delay="100">

          <div class="col-lg-4 reservation-img" style="background-image: url(assets/img/reservation.jpg);"></div>

          <div class="col-lg-8 d-flex align-items-center reservation-form-bg" data-aos="fade-up" data-aos-delay="200">
            <form action="BookingController" method="post" role="form" class="booking-form book-a-table">
  <div class="row gy-4">
    <div class="col-lg-4 col-md-6">
      <input type="text" name="name" class="form-control" placeholder="Your Name" required>
    </div>
    <div class="col-lg-4 col-md-6">
      <input type="email" name="email" class="form-control" placeholder="Your Email" required>
    </div>
    <div class="col-lg-4 col-md-6">
      <input type="text" name="phone" class="form-control" placeholder="Your Phone" required>
    </div>
    <div class="col-lg-4 col-md-6">
      <input type="date" name="date" class="form-control" required>
    </div>
    <div class="col-lg-4 col-md-6">
      <input type="time" name="time" class="form-control" required>
    </div>
    <div class="col-lg-4 col-md-6">
      <input type="number" name="people" class="form-control" placeholder="# of people" required>
    </div>
  </div>

  <div class="form-group mt-3">
    <textarea class="form-control" name="message" rows="5" placeholder="Message"></textarea>
  </div>

  <div class="text-center mt-3">
    <button type="submit" class="btn btn-primary">Book a Table</button>
  </div>
</form>
            
          </div><!-- End Reservation Form -->

        </div>

      </div>

    </section><!-- /Book A Table Section -->

    <!-- Gallery Section -->
    <section id="gallery" class="gallery section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>Gallery</h2>
        <p><span>Check</span> <span class="description-title">Our Gallery</span></p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="swiper init-swiper">
          <script type="application/json" class="swiper-config">
            {
              "loop": true,
              "speed": 600,
              "autoplay": {
                "delay": 5000
              },
              "slidesPerView": "auto",
              "centeredSlides": true,
              "pagination": {
                "el": ".swiper-pagination",
                "type": "bullets",
                "clickable": true
              },
              "breakpoints": {
                "320": {
                  "slidesPerView": 1,
                  "spaceBetween": 0
                },
                "768": {
                  "slidesPerView": 3,
                  "spaceBetween": 20
                },
                "1200": {
                  "slidesPerView": 5,
                  "spaceBetween": 20
                }
              }
            }
          </script>
          <div class="swiper-wrapper align-items-center">
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-1.jpg"><img src="assets/img/gallery/gallery-1.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-2.jpg"><img src="assets/img/gallery/gallery-2.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-3.jpg"><img src="assets/img/gallery/gallery-3.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-4.jpg"><img src="assets/img/gallery/gallery-4.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-5.jpg"><img src="assets/img/gallery/gallery-5.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-6.jpg"><img src="assets/img/gallery/gallery-6.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-7.jpg"><img src="assets/img/gallery/gallery-7.jpg" class="img-fluid" alt=""></a></div>
            <div class="swiper-slide"><a class="glightbox" data-gallery="images-gallery" href="assets/img/gallery/gallery-8.jpg"><img src="assets/img/gallery/gallery-8.jpg" class="img-fluid" alt=""></a></div>
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>

    </section><!-- /Gallery Section -->

   <!-- Contact Section -->
<section id="contact" class="contact section">

  <!-- Section Title -->
  <div class="container section-title" data-aos="fade-up">
    <h2>Contact</h2>
    <p><span>Need Help?</span> <span class="description-title">Contact Us</span></p>
  </div><!-- End Section Title -->

  <div class="container" data-aos="fade-up" data-aos-delay="100">

    <!-- Google Maps -->
    <div class="mb-5">
      <iframe style="width: 100%; height: 400px;" 
              src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12097.433213460943!2d-74.0062269!3d40.7101282!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xb89d1fe6bc499443!2sDowntown+Conference+Center!5e0!3m2!1smk!2sbg!4v1539943755621" 
              frameborder="0" allowfullscreen=""></iframe>
    </div><!-- End Google Maps -->

    <!-- Contact Info -->
    <div class="row gy-4">
      <div class="col-md-6">
        <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="200">
          <i class="icon bi bi-geo-alt flex-shrink-0"></i>
          <div>
            <h3>Address</h3>
            <p>A108 Adam Street, New York, NY 535022</p>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="300">
          <i class="icon bi bi-telephone flex-shrink-0"></i>
          <div>
            <h3>Call Us</h3>
            <p>+1 5589 55488 55</p>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="400">
          <i class="icon bi bi-envelope flex-shrink-0"></i>
          <div>
            <h3>Email Us</h3>
            <p>info@example.com</p>
          </div>
        </div>
      </div>
      <div class="col-md-6">
        <div class="info-item d-flex align-items-center" data-aos="fade-up" data-aos-delay="500">
          <i class="icon bi bi-clock flex-shrink-0"></i>
          <div>
            <h3>Opening Hours<br></h3>
            <p><strong>Mon-Sat:</strong> 11AM - 23PM; <strong>Sunday:</strong> Closed</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Contact Form -->
    <form action="contact" method="post" class="email-form" data-aos="fade-up" data-aos-delay="600">
      <div class="row gy-4">
        <div class="col-md-6">
          <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
        </div>
        <div class="col-md-6">
          <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
        </div>
        <div class="col-md-12">
          <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
        </div>
        <div class="col-md-12">
          <textarea class="form-control" name="message" rows="6" placeholder="Message" required=""></textarea>
        </div>
        <div class="col-md-12 text-center">
          <button type="submit" class="btn-submit">Send Message</button>
        </div>
      </div>
    </form><!-- End Contact Form -->

  </div>
</section>


  </main>

  <footer id="footer" class="footer dark-background">

    <div class="container">
      <div class="row gy-3">
        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-geo-alt icon"></i>
          <div class="address">
            <h4>Address</h4>
            <p>A108 Adam Street</p>
            <p>New York, NY 535022</p>
            <p></p>
          </div>

        </div>

        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-telephone icon"></i>
          <div>
            <h4>Contact</h4>
            <p>
              <strong>Phone:</strong> <span>+1 5589 55488 55</span><br>
              <strong>Email:</strong> <span>info@example.com</span><br>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 d-flex">
          <i class="bi bi-clock icon"></i>
          <div>
            <h4>Opening Hours</h4>
            <p>
              <strong>Mon-Sat:</strong> <span>11AM - 23PM</span><br>
              <strong>Sunday</strong>: <span>Closed</span>
            </p>
          </div>
        </div>

        <div class="col-lg-3 col-md-6">
          <h4>Follow Us</h4>
          <div class="social-links d-flex">
            <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

      </div>
    </div>

   <div class="container copyright text-center mt-4">
  <p>© <span>Copyright</span> <strong class="px-1 sitename">Amis Café</strong> <span>All Rights Reserved</span></p>
</div>
   

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Main JS File -->
  <script src="assets/js/main.js"></script>
</body>
</html>