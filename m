Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD5EC8303F
	for <ath11k@archiver.kernel.org>; Thu, 28 Aug 2025 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XjZ3jX1113k8dvFlR8NXrbbl126/WddYFoCad8ZhqNg=; b=FMoqzKqHHWT6x3T2HzorF73JfB
	w8eGnD4TuXtMuOJu7W+IstaC6src0LZmvhSPIpVjpBrNX0XJnCgMkHOSPar7Ylp6LL/P48r83MuQq
	X8KXRXrwQ15sNVYd+JZuW8ZoZ6I4rIDz6Duzqox+ovAFvxLQBtZtjzmzJuviKTST4hidphrNUsVPq
	nslXYIFRMK9ULz/+8K7L2FT1FtqceCwOuuzfnZFzt+pVYlb6okSBI4lFLRnSzJDszj/zKZIfkeHbX
	zWeutPaqphsId3NdfSxQM+HYs5PhDFU3YgUGedEc95Gc47Chj0hSGms6aJQHeVTKbRYPjy1jvCmyg
	E+ljfUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWW-00000002oSQ-1KHB;
	Thu, 28 Aug 2025 18:39:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urdjo-00000001wXl-3P0F
	for ath11k@lists.infradead.org;
	Thu, 28 Aug 2025 14:36:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SEBdak029277
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 14:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=XjZ3jX1113k8dvFlR8NXrb
	bl126/WddYFoCad8ZhqNg=; b=CHFBY08+ZwImMbXRu5kSZlY82MC5tAyuiH3IXv
	L4gzBww7ikVz7mXzwHlJAu9Ejiii6i7G5WWbcTflYsRaY58L9mUi38ES2Oy6GsJ4
	OzMV/aNRdg3sRrs7r3p3CEZ/aXYk35wyE8ypSGu71/96gOL6vMYA1PyLoTT4Z7oT
	Jn+v6R97ecA2zi8UDF7BOMvfQB6M4d833ysLh5fVj4eEZ4EQTOTtnqQreeP2xZXA
	9ALRkqvIOcouoSVjAEIXoe85T8I9SYZcV2sL1mU/UZULrQSeiWCWzc6u3OjDZokV
	7hJPT35cuVg3eNW5b7MuOTO/1Ew30Ehfmg3OPNzbi/IOPF7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umgpa1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 14:36:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24636484391so13037905ad.3
        for <ath11k@lists.infradead.org>; Thu, 28 Aug 2025 07:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756391786; x=1756996586;
        h=content-transfer-encoding:from:content-language:subject:cc:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjZ3jX1113k8dvFlR8NXrbbl126/WddYFoCad8ZhqNg=;
        b=H9gtEDHHLXgU7OHtbzqf5TUNIHx/teKs+zFzActxElkDG8ELyKFD0aKKfPO+HKtfVr
         Y7pgWhcqRDK2KUUcRzG7SwHukQ1nUCpT56LFF3UDTpNbQ1txY7RjJi2LXA2xG0DrlkA1
         rZ6iljlq3Z7APhAUyWXWXSGtrhsJ5ZnUWOj9UF9RucBcWpOJyHBmrMAoXOuU/i0qNVtk
         g+30eUayvopoZDnBVJ2L+Gaaqqj4iMUkw/CFymsM51ylBgAzOWhNIVoDdG7sGFgRHgZz
         QBe0cZd/Rd7HSc4NNXLuqTLVuWhV+IVHcge+X0BuQ8+nCTIGd8YvijgJMcY2cd0ETo2v
         s3/w==
X-Forwarded-Encrypted: i=1; AJvYcCXbw3jhaen1gQG8gHxMmnK97bwgdfNDejTCOtJ19QY9lpCOyQLvXGV9lAhvAtC7OgkFJ8uiuMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMJ+4RsJIaF7VN3fBxNXT9Za1xEcbpiDVUGZCHK//Mv9uFE8MT
	+gsptuAeP8XYSs/VeQecikc/4OoGg/Ma2AU9TpwjUlGgCT/uK1ba+V4nazyJ2OThJs9KetW/On9
	fJEj/xDgKX1ftpXA7OcE6Shx7l2j02UI3JDXBJkCnfvFCwHgehnwv74IwQaRb22EuteHMYLui
X-Gm-Gg: ASbGnctcMX3R276V/aLwx1AbpSqOM8DUlcCNWmz6Z4Kusfxj4T/4wyzapagIoOJnFxg
	7TMzMniII4WN7LQQT3KBpwUuLaTr7IERYyeUorIc/JWoj5J+yRAClTRdpxnEhhhIVIMWTShK2in
	b/3EaTDJoYB8VJ9VHtC0zxLoY5M3GoxEz4yrHA3VDkyLhg9BQmEFbf6xYp9199Dq1OrF7wMfTS9
	bwLlO/V/D2q8RJCk1dhoWgZ1SoMhHI6mFb/ap33I/Jr/OQ6xeLcghe2CuRsRdSdU/xjr5zChSrP
	hiv8RE+PmP1w9fT3Vux+hUWkHd/u7dXoVmvW9D0R9EZoSE/u/ZUg+t9d/4hFBfzIhq9MOZmd+OJ
	5
X-Received: by 2002:a17:903:2287:b0:246:f14b:31d1 with SMTP id d9443c01a7336-246f14b3365mr173812595ad.32.1756391785828;
        Thu, 28 Aug 2025 07:36:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL2bqK0GrWCTia2+2Ggcvj+uvADGJopEJM1qYkYmwTlTNYATTf2IHqE+217g1/8c+O+RYceQ==
X-Received: by 2002:a17:903:2287:b0:246:f14b:31d1 with SMTP id d9443c01a7336-246f14b3365mr173811965ad.32.1756391785205;
        Thu, 28 Aug 2025 07:36:25 -0700 (PDT)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24882c840e1sm63260945ad.69.2025.08.28.07.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 07:36:24 -0700 (PDT)
Message-ID: <9eb91098-48a6-420f-bb6e-e7968ab0a2e4@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 07:36:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath11k firmware ath-20250827
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68b0696b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=K7P3aSCmrdTuO1j2XbMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX+vVNi3xNBxkI
 JfRG3HZWwSe8OAG0YF+t55f7iJM9l1oabzH6UKeDK0JcRyXh4EsXXIhAIxQuerOC3u8ig/AZz5q
 aIX+2ofaTEADm7+/Bbu8WmlD5UG9nEyRzriXVe6FkXyKWqRiOgeZBzc1S76Ba68k7wDR7WalO7g
 TDKKDVrq1gKygQT/C98ZpH3sJTUpgf3UgC+DwW5umtf5Z9MKJ/tvpGVDjwB5qsiVbHhmR2KKkA8
 jHmA+cCJ4xYNwVZGFsFCaSuEOWQBk6XDColAU6Ui90G9V1wLJQv1uvDNhXEH9665ycLoJ62i2AP
 o6Uljaopwz6WMHGT4xqG2pA9KLqY7bBhrgXZBU/D95KBzrWilwO8AXFQ4Z6EEHiUJT8ylw3HD7S
 Q7NclegN
X-Proofpoint-GUID: 8a38KrBogjJlktmtbRhGlylQN2wN02Gg
X-Proofpoint-ORIG-GUID: 8a38KrBogjJlktmtbRhGlylQN2wN02Gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_073628_868944_F6E69D0A 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

  Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20250827

for you to fetch changes up to 0cfc1632ef7b1cc15eea36214fc67098f6d49531:

  ath11k: Support WCN6855 hw2.1 with NFA firmware variant (2025-08-27 07:43:22 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath11k: Support WCN6855 hw2.1 with NFA firmware variant

 WHENCE | 2 ++
 1 file changed, 2 insertions(+)

