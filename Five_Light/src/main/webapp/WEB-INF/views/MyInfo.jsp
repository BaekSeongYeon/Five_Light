<%@ page import="com.fivelight.domain.Exercise" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>당근 P.T</title>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
	
	<link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/aos.css">
	<link rel="stylesheet" href="css/ionicons.min.css">
	<link rel="stylesheet" href="css/bootstrap-datepicker.css">
	<link rel="stylesheet" href="css/jquery.timepicker.css">
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/icomoon.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/font.css">
	
	<!-- 차트 링크 아래 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- 차트 링크 끝 -->
</head>

<body>
	<!-- 관리자 로그인 이후 -->

	<!-- 좌측 카테고리 -->
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		
		<aside id="colorlib-aside" role="complementary" class="boxShadow js-fullheight text-center">
			<div class="cotainer">
				<div class="row">
					<div class="col-12 logo">
						<a href="MyInfo.jsp"><img src="images/logo.png"></a>
					</div>
					
					<!-- 로고 밑 닉네임 -->
					<div id="nickname_1" class="col-8 userName" value="${info.nickname}">
						<h2 id="user_nickname">${info.nickname}</h2>
					</div>
					
					<div class="col-4 nickCorr">
						<img type="button" class="nickCorrBtn" src="images/nickCorr.png">
					</div>
					<!-- 로고 밑 닉네임 끝 -->
				</div>
					
				<!-- 좌측 목록 -->
				<div class="col-12">
					<div class="main-menu">
						<nav id="colorlib-main-menu" role="navigation" list-style=snone>
							<ul class="main-menu">
								<li><a href="myInfo.do">My Info</a></li>
								<li><a href="challenge.do">Challenge</a></li>
								<li><a href="ranking.do">Ranking</a></li>
								<li><a href="training.do">Training</a></li>
							</ul>
						</nav>
					</div>
					
					<div class="row">
						<div class="col-6 infoLogout">
							<a href="logout.do"	onclick="return confirm('정말 로그아웃 하시겠습니까??');">로그아웃</a>
						</div>
						<div class="col-6 infoDelete">
							<a href="infoDelete.do?email=${info.email}"	onclick="return confirm('정말 회원탈퇴 하시겠습니까??');">회원탈퇴</a>
						</div>
					</div>
					
					<div class="fiveLight">
						<p>Five_Light ㅣ 오경락 백성연 공석준 기아성 최지훈</p>
					</div>
				</div>
				<!-- 좌측 목록 끝 -->
			</div>
		</aside>
	</div>
	<!-- 좌측 카테고리 끝 -->

	<!-- 로그인 상태 라인  -->
	<div id="colorlib-main">
		<section class="ftco-section">
			<div class="container">
				<div class="row">							
					<div class="col-12">
						<!-- 라인 그래프 -->
						<div id="myChart_head">
							<canvas id="myChart"></canvas>
									
							<!-- 운동 셀렉트 -->
							<div class="row">
								<div class="myinfoBtnDown">
									<% List<Exercise> exerciseList = (List<Exercise>)session.getAttribute("exerciseList"); %>
									<div id="ex_select" class="col-2">
										<% for(int i = 0; i < exerciseList.size(); i++) { %>
										<button id="rankgraph<%= i %>" class="rankgraphBtn col-2">
											<div class="text-center move" value="<%= exerciseList.get(i).getEx_name() %>">
												<p><%= exerciseList.get(i).getEx_name() %></p>
											</div>
										</button>
										<% } %>
									</div>	
								</div>									
							</div>
							<!-- 운동 셀렉트 끝 -->
						</div>
						<!-- 라인 그래프 끝-->

						<!-- 피드백 -->
						<div class="row">
							<div class="col-8">
								<div class="card flex-fill">
									<div class="card-header">
										<h5 class="card-title mb-0">피드백</h5>
									</div>
									
									<table class="table table-hover my-0">
										<thead>
											<tr>
												<th>날짜</th>
												<th class="d-none d-xl-table-cell">P.T</th>
												<th>내용</th>
											</tr>
										</thead>
										
										<tbody>
											<c:forEach var="feedbackList" items="${feedbackList}">
												<tr>
													<td>${feedbackList.feed_date}</td>
													<td class="d-none d-xl-table-cell">${feedbackList.ex_name}</td>
													<td><a href="feedDetail.do?nickname=${feedbackList.nickname}">내용보기</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 피드백 끝 -->

							<!-- 몸무게 -->
							<div class="col-4">
								<div class="card flex-fill">
									<div class="card-header">
										<h5 class="card-title mb-0">나의 도전</h5>												
									</div>
									
									<table id="weight_table" class="table table-hover my-0">
										<tbody>
											<tr>
												<th>시작 몸무게</th>
												<td>
													<span id="weight_start">${info.weight_start}</span>
													<span>Kg</span>
												</td>
											</tr>
											<tr>
												<th>현재 몸무게</th>
												<td>
													<span id="weight_now">${info.weight_now}</span>
													<span>Kg</span>
												</td>
											</tr>
											<tr>
												<th>목표 몸무게</th>
												<td>
													<span id="weight_target">${info.weight_target}</span>
													<span>Kg</span>
												</td>														
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 몸무게 끝 -->
						</div>								
					</div>
				</div>
			</div>
		</section>
	</div>
						
	<script type="text/javascript">
		// 몸무게, 닉네임 스크립트
		var nickname = $('#user_nickname').text()
		var name = `${info.name}`
		var weight_start = $('#weight_start').text()
		var weight_now = $('#weight_now').text()
		var weight_target = $('#weight_target').text()
		
		// 라인 그래프
		var ctx = document.getElementById('myChart').getContext('2d')
		
		$(document).on('click', '#user_nickname', ()=> {
			// input 창에서 마우스 클릭 시, placeholder 없어지는 코드 : onfocus="this.placeholder=&apos;&apos;"
			$('#user_nickname').contents().unwrap().wrap('<input id="user_nick_corr" type="text" placeholder="${info.nickname}" size=27 style="height: 40px !important;"/>')
			$('#user_nick_corr').after('<button id="nick_correct">변경하기</button>')
			$('#nick_correct').after('<button id="nick_correct_cancel">변경취소</button>')
		})
		
		$(document).on('click', '#nick_correct_cancel', ()=> {
			var nickname = $('#nickname_1').attr('value')
			
			$('#user_nick_corr').remove()
			$('#nick_correct').remove()
			$('#nick_correct_cancel').remove()								
			$('#nickname_1').append('<h2 id="user_nickname" style="cursor:pointer">' + nickname + '</h2>')
		})
		
		$(document).on('click', '#nick_correct', ()=> {
			var nickname = $('#user_nick_corr').val()
			
			if(nickname == ''){
				nickname = `${info.nickname}`
			}
				
			
			$.ajax({
				url: "nickcorr.do",
				data: {
					nickname : nickname,
					name : name,
					access : `${info.access}`,
					weight_start : weight_start,
					weight_now : weight_now,
					weight_target : weight_target
				},
				dataType: "text",
				
				success: function(res) {
					$('#user_nick_corr').remove()
					$('#nick_correct').remove()
					$('#nick_correct_cancel').remove()
					$('#nickname_1').append('<h2 id="user_nickname" style="cursor:pointer">' + nickname + '</span>')
					$('#nickname_1').attr('value', nickname)
				},
				
				error: function(e) {
					if(nickname == 'admin') {
						alert('이 Nickname은 사용할 수 없습니다!!')
					}
					
					else {
						alert('이미 존재하는 Nickname 입니다. 다른 Nickname을 입력해 주세요!')											
					}
				}
			})
		})
		
		$('.text-center.move').click(function() {
			var ex_name = $(this).attr('value')
			
			$('#myChart').remove()
			$('#ex_select').before('<canvas id="myChart"><canvas>')	
			
			ctx = document.getElementById('myChart').getContext('2d')								
			
			$.ajax({
				url: 'rankgraph.do',
				data: {
					ex_name : ex_name,
					nickname : nickname
				},
				dataType: "json",
				
				success: function(res) {
					var getRank_date = function() {
	                	var labels = []
	                	
	                	for(let i = 0; i < res.length; i++) {
	                		DBdate = res[i].rank_date.substring(0, 10)
	                		labels.push(DBdate)
	                	}
	                	
	                  	return labels
	               	}
					
					var getRank_acc = function() {
	                	var data = []
	                	
	                	for(let i = 0; i < res.length; i++) {						                		
	                		data.push(res[i].rank_acc)
	                	}
	                	
	                  	return data
	               	}
					
					var chart = new Chart(ctx, {
					    type: 'line',
					    data: {
					    	labels: getRank_date(),
					        datasets: [
					            {
					            	label: '기록(%)',
					            	data: getRank_acc(),
					                backgroundColor: 'transparent',
					                borderColor: '#FA9200',										                
					                lineTension: 0,
					                pointRadius: 5,
					                pointBackgroundColor: '#FA9200'
					            }
					        ]
					    },
					    
					    options: {										        
					        title: {
					            display: true,
					            text: ex_name,
					            fontColor: 'black',
					            fontSize: 30
					        },
					        
					        scales: {
					            xAxes: [{
					            	ticks: {
					            		display: true,
					            		fontColor: 'black',
					            		fontSize: 14
					            	}
					            }],
					            
					            yAxes: [{
					                ticks: {
					                    display: true,
					                    min: 0,   //y축 최솟값
					                    max: 100, //y축 최댓값
					                    stepSize: 10,
					                    fontColor: 'black',
					                    fontSize: 13
					                }
					            }]
					        },
					        
					        legend: { // 범례
					            position: 'bottom',
					            labels: {
					                usePointStyle: true, // 지정된 포인트 모양에 따라 범례 아이콘 생성
					                boxWidth: 10,
					                padding: 10
					            }
					        }
					    }  
					})										
				}
			})
		})
		
		<!-- 라인 차트 -->
		var chart = new Chart(ctx, {
		    type: 'line', // 막대, line : 꺾은선 그래프
		    data: {
		        labels: ['1일차', '2일차', '3일차', '4일차', '5일차', '5일차', '7일차'],
		        datasets: [
		            {
		            	label: '기록(%)',
		                data: [null, null, null, null, null, null, null],
		                backgroundColor: 'transparent', // 투명한
		                borderColor: '#FA9200',
		                /* borderDash: [0 ,6],
		                borderCapStyle: 'round', // 점선 그래프, 점의 모양 */
		                lineTension: 0, // line 볼록정도
		                pointRadius: 5, // 포인트 크기
		                //pointStyle: 'circle', // 직사각형, triangle : 삼각형, default : circle (원형)
		                pointBackgroundColor: '#FA9200' // default : 'transparent'
		            }
		        ]
		    },
		    
		    options: {
		    	title: {
		            display: true,
		            text: 'Challenge Data',
		            fontColor: 'black',
		            fontSize: 30
		        },
		        
		        scales: {
		        	xAxes: [{
		            	ticks: {
		            		display: true,
		            		fontColor: 'black',
		            		fontSize: 14
		            	}
		            }],
		            
		            yAxes: [{
		                ticks: {
		                    display: true,
		                    min: 0,   //y축 최솟값
		                    max: 100, //y축 최댓값
		                    stepSize: 10,
		                    fontColor: 'black',
		                    fontSize: 13
		                }
		            }]
		        },
		        
		        legend: { // 범례
		        	display: true,
		            position: 'bottom',
		            labels: {
		                usePointStyle: 'circle', // 지정된 포인트 모양에 따라 범례 아이콘 생성
		                boxWidth: 10,
		                padding: 10
		            }
		        }
		    }
		})
		<!-- 라인 차트 끝 -->
	</script>
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
	    	<circle class="path-bg" cx="24" cy="24" r="22" fill="none"stroke-width="4" stroke="#eeeeee" />
	        <circle class="path" cx="24" cy="24" r="22" fill="none"stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
	    </svg>
	</div>

	<!-- 라인차트 스크립트 시작 -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
</body>
</html>