/*
	Hypothesis by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
*/

(function($) {

	var	$window = $(window),
		$body = $('body'),
		$header = $('#header'),
		$banner = $('#banner');

	// Breakpoints.
		breakpoints({
			xlarge:   [ '1281px',  '1680px' ],
			large:    [ '981px',   '1280px' ],
			medium:   [ '737px',   '980px'  ],
			small:    [ '481px',   '736px'  ],
			xsmall:   [ '361px',   '480px'  ],
			xxsmall:  [ null,      '360px'  ]
		});

	// Play initial animations on page load.
		$window.on('load', function() {
			window.setTimeout(function() {
				$body.removeClass('is-preload');
			}, 100);
		});

	// Scrolly.
		$('.scrolly').scrolly({
			offset: function() { return $header.height() - 5; }
		});

	// Header.
		if ($banner.length > 0
		&&	$header.hasClass('alt')) {

			$window.on('resize', function() { $window.trigger('scroll'); });

			$banner.scrollex({
				bottom:		$header.outerHeight(),
				terminate:	function() { $header.removeClass('alt'); },
				enter:		function() { $header.addClass('alt'); },
				leave:		function() { $header.removeClass('alt'); $header.addClass('reveal'); }
			});

		}

	// Dropdowns.
		$('#nav > ul').dropotron({
			alignment: 'right',
			hideDelay: 350,
			baseZIndex: 100000
		});

	// Menu.
		$('<a href="#navPanel" class="navPanelToggle">Menu</a>')
			.appendTo($header);

		$(	'<div id="navPanel">' +
				'<nav>' +
					$('#nav') .navList() +
				'</nav>' +
				'<a href="#navPanel" class="close"></a>' +
			'</div>')
				.appendTo($body)
				.panel({
					delay: 500,
					hideOnClick: true,
					hideOnSwipe: true,
					resetScroll: true,
					resetForms: true,
					target: $body,
					visibleClass: 'is-navPanel-visible',
					side: 'right'
				});

	// Banner.
		if ($banner.length > 0) {

			// Edge + IE: Workaround for object-fit.
				if (browser.name == 'edge'
				||	browser.name == 'ie') {

					var $video = $banner.find('video'),
						v = $video[0],
						t, f;

					// Handler function.
						var f = function() {

							var w = v.videoWidth, h = v.videoHeight,
								pw = $window.width(), ph = $window.height(),
								nw, nh, x;

							// Calculate new width, height.
								if (pw > ph) {

									nw = pw;
									nh = (nw / w) * h;

								}
								else {

									nh = ph;
									nw = (nh / h) * w;

								}

							// Set width, height.
								if (nw < pw) {

									v.style.width = '100vw';
									v.style.height = 'auto';

								}
								else
									v.style.width = nw + 'px';

								if (nh < ph) {
									v.style.height = '100vh';
									v.style.width = 'auto';
								}
								else
									v.style.height = nh + 'px';

							// Set position (bottom-right).
								v.style.top = v.style.bottom = v.style.left = v.style.right = 'auto';
								v.style.bottom = '0';
								v.style.right = '0';

						};

					// Do an initial call of the handler.
						(f)();

					// Add event listeners.
						$window.on('resize load', function() {

							clearTimeout(t);

							t = setTimeout(f, 125);

						});

				}

		}

	// Tabs.
		$('.tabs').selectorr({
			titleSelector: 'h3',
			delay: 250
		});

	
		const $text = document.querySelector(".typing .text");





	// 배너 every care text 타이핑 효과 

	// 글자 모음
	const letters = [
	"Every Care" 
	];

	// 글자 입력 속도
	const speed = 100;
	let i = 0;

	// 타이핑 효과
	const typing = async () => {  
	const letter = letters[i].split("");
	
	while (letter.length) {
		await wait(speed);
		$text.innerHTML += letter.shift(); 
	}
	
	// 잠시 대기
	await wait(800);
	
	// 지우는 효과
	remove();
	}

	// 글자 지우는 효과
	const remove = async () => {
	const letter = letters[i].split("");
	
	while (letter.length) {
		await wait(speed);
		
		letter.pop();
		$text.innerHTML = letter.join(""); 
	}
	
	// 다음 순서의 글자로 지정, 타이핑 함수 다시 실행
	i = !letters[i+1] ? 0 : i + 1;
	typing();
	}


	// 숫자 카운트 효과

	// 딜레이 기능 ( 마이크로초 )
	function wait(ms) {
	return new Promise(res => setTimeout(res, ms))
	}

	// 초기 실행
	setTimeout(typing, 1400);


	// 각 카운터에 대한 함수 정의
	const counter = ($counter, max) => {
		let now = max;
		
		const handle = setInterval(() => {
			$counter.innerHTML = Math.ceil(max - now);
			
			// 목표수치에 도달하면 정지
			if (now < 1) {
				clearInterval(handle);
			}
			
			// 증가되는 값이 계속하여 작아짐
			const step = now / 10;
			
			// 값을 적용시키면서 다음 차례에 영향을 끼침
			now -= step;
		}, 50);
	}

	window.onload = () => {
		// 각 카운터에 대한 요소 선택
		const $counter = document.querySelector(".count");
		const $counter1 = document.querySelector(".count1");
		const $counter2 = document.querySelector(".count2");
		
		// 각 카운터의 목표 수치 설정
		const max = 1557; // 총 가입자 수의 목표 수치
		const max1 = 612; // 메이트 수의 목표 수치
		const max2 = 5000; // 총 이용 건수의 목표 수치
		
		// 각 카운터에 대한 카운트 함수 호출
		setTimeout(() => counter($counter, max), 800); // 총 가입자 수 카운트
		setTimeout(() => counter($counter1, max1), 900); // 메이트 수 카운트
		setTimeout(() => counter($counter2, max2), 1000); // 총 이용 건수 카운트
	}

	var handleResponsive = () => {
		var items = [...document.querySelectorAll('.horizontal-scroll-item')];
		if (window.matchMedia("(max-width: 991px)").matches && window.matchMedia("(min-width: 767px)").matches) {
			items.forEach((item, index) => {
				if (index % 2 === 1) {
					item.firstChild.firstChild.style.order = 9999;
					// You can add more styling or adjustments here for this specific condition
				}
			});
		}
	};
	
	

	

})(jQuery);


