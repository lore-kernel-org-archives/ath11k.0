Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21EECD4F5B
	for <ath11k@archiver.kernel.org>; Tue, 19 May 2026 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=M6KNV4mnu4YhRa8LwLFYShZe6x
	Mx8qcg1TEOnjLIqVGlGNIJp8YGnF3kBcSm/+MMaU/7Lx1vQAw+E7+jyLw8fgho2t+q0nkq0NOgj4I
	SPOyL4sIWZfJ0vGMogupMsv0w2InEHAKTpd83uC2cCtuFkIT36gD+vjH4ub1ny6AoBguLjarB9uQA
	MTDxCHBMKtbzp23lIcit74RAh08dHmPHrp5NmuZOWgXyAd/bcDqg8JVzyMLME5FixLyiw3dG0Bl/+
	NGGPFzg4UqbnjkfL8d6IKkLjNr2ia4qBk+2akyd/EChLaVj1eIi/OVAt/xcww0jt39ytp328yTXPy
	9Lvq6E2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJx-00000001nvg-3OVT;
	Tue, 19 May 2026 14:21:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJu-00000001nuX-3nP4
	for ath11k@lists.infradead.org;
	Tue, 19 May 2026 14:21:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9krhq1257003
	for <ath11k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=Mw0ywfGpQCxFnMzB
	Lgb2Pyf5qoETlLQj8H0qchevDZ6GmrMFT3eH+zU2iyMjd0OOky8j3YJZH0mo2x16
	1d6kAi2HdtVIs78TMi/4WtQV9qUd/AZqpyNxz1BG268WIlHVxQ5meJVkptNtcaMg
	Rm1hiY0gwCfd8i3AlWq7xXJYBcS7ToMAxgwXS7AyKAs5f7dT0mW5h/8BvEvYX1o+
	U97j6Intj/8g4KC3IxsV4BxzdwXF65zGi71xcF8lPSVi1hOBRCAlKekbXmpU7DyR
	nt0qeWDYtnzGDw2Dgy4m0jRvrjRh/xo/MjroXB1JBgHNpkb+03sJCdsyDZpnDfdt
	aKMkuA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nhj92h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-135f774f5e6so67668c88.0
        for <ath11k@lists.infradead.org>; Tue, 19 May 2026 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200477; x=1779805277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=FpQoRlONd5OgIOw6yaSU2htW2mrdYEkJRd8U5wjhyczPddvBG5dj1+6eSbM+2ifMVt
         K0MzbxKR1uYll+liTq2ShdjhyL0vaPKXLb9C2X2fFbn+W5xOgwqo6eO4RbCUCgwrKRwK
         U1E7J7KsZdlqTWBY6NXbu8NCSDzw5DJW5yu8Boae9q5WYxxdETbXzH6M87toP/sePOAw
         YudpzFnWSU+8C+exiTb1Xf9NhrSy4xLgKpuKQBXNLC+F2oLQw5yP7EHUaX7KgcuoCdKy
         FUeIjtfol526vGMxCRX4uJ8LpGlbNHJbUX29e38XKXty7iIYftX3fyg/6O4n3gSBUiy9
         nx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200477; x=1779805277;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=lYGNwc1izngEOiTy6MAfLpiEkhrPZpj4lQLJcDQQK861UxpobwZtjOG3KIyqaojYEc
         o5ouqmdoggqZ092OsVSXPTbTZN/Jn6ZRywTtlyK2GJscgemqilCZvo8Rs9u/GrEHBHRp
         QN2b7D6ktMUiTlM9szPmIvT4OX/jeVxoYhGDuih2bUKOTnitYYEH8ZjG/yw4MMkXu6zJ
         ayKYgcDhaFkakNRoly0dcv3UaNtaUxfUy2esCSCJoN2DsajensyAWLFKm1EDGDhEMO/h
         75XrmeUwbJp2O04Z06ocApV8B9+zkYZhOaQN986hmz5kJJiC6KY+S3DwolWAjOk6xxlh
         /+Aw==
X-Forwarded-Encrypted: i=1; AFNElJ/By75wHLHm/7a20Ji7tasVA1Ph03RigUzYDwirdyFhF64xBoaaYRxhEoseUKwUB4v0CXtARqc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyRR/hjFA0ZqfTJ9zrfDHvTm6+2Da43Nda2//p0RvyPsY6uRjn0
	B5WMHKnl7507JglHRMB45EGOu+3zkFbEGsOqnEnGCD56BEnmNtVCSUQXuWv/wwUO8skY8Toif3I
	oI7VhWs9+tLD5GFwOz78Dc0B4RsxjUpKYGWgfoe0WQ/JK0ROtMfzLMiw+EAcdkNvf
X-Gm-Gg: Acq92OEjXGfHe3cWZM9GfiTVON4w3/wofOjExeCGSVn4n4BivCwCHUQCWrlrwEgam9W
	0GzkLxi3zUE+aQd6YaVh0baXUTTeMX2Rjaqs957f+3prsEc3sOXg5earm6aG/uPdW2OWchUzDJ4
	fw8f7fyazGh/FzBR5bfcQO0aS/miSEcGArZj7heFGhRqkizJuknuuG5Q59Ex8w5yGwWw4dnUbIv
	NxGlanMW6j1Hz1Dm3d4sPjoe1ue1aVY9LnfpkjNtm3sx60t69uaF64X+zJkqKfHqt1qHxT7a6VQ
	QQPdT9+F5Ci4H2Q9/0PjfXaD6uTpc9FuVLnqvPSIF7eWoPiGW2ZdN4vSvzCCHJXRh++kbd032zE
	JufGiYRQHhPar914PXg35RdSbu0+eXwR3A3+CaadE3NETLX4xZTayI2o9yG+G5vWYZJEwXz6puL
	EqUhfDJ9TzUEiwdfj3/Z+zZ0ve
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792893c88.4.1779200476606;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792864c88.4.1779200476006;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
Received: from [192.168.1.38] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm19895516c88.15.2026.05.19.07.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:21:15 -0700 (PDT)
Message-ID: <d88a1d9b-853b-476c-8f01-22fe24590892@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:21:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260512
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: qSVzXm8cVoh8ymNj8FMubVNRd1QKYlZQ
X-Proofpoint-ORIG-GUID: qSVzXm8cVoh8ymNj8FMubVNRd1QKYlZQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MiBTYWx0ZWRfX73AYzS+p5pTf
 wmaNLZ1Nr1YhOCGv/tCt6zj3SGlIlW5oZBdlTGwWVPbC6EekH2cN0QOY3PYX5hZ4XJvfo3jaAPa
 V4Y0gYpaDjnvyYl4GWCKVBQoN/Z86PsgJfWXoITBEf/KZmi9rr672lzKd10XNmtf1AgLr/scZYB
 B6o8e+YTFr3k/dQgvMUFxUxJui5zgrz6EafAwWiGnbWDRSpbMELnVsDpg58n80N/uoknpWArvCP
 48R08LcqdlIdanbFaflpcdz5BLNbR9maElPL3FadEH5NdSWMavIiJtyMIU/AMi1fuTziD3SPhBF
 N33nzFwzoEwCjy9GCPmIzuaF0LAE2bl5wyRyMgTrs9ppzakgULhLWumOu+LLRthMx9DBQCyVn3M
 KC3gtQ1T23zLvSWs50M8JMGXhy0xVe01NpdhKpAbSZ5EUdGjQ/V+H5iWEExx3FxTKYB7VuCl7f7
 X1mTP32sVaddDKMbzJQ==
X-Authority-Analysis: v=2.4 cv=ToTWQjXh c=1 sm=1 tr=0 ts=6a0c71dd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=qdzAxcUfUuEVABHHB2UA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072119_067035_7268FD10 
X-CRM114-Status: GOOD (  14.06  )
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

On 5/12/2026 7:28 AM, Jeff Johnson wrote:
> The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:
> 
>   wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260512
> 
> for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784:
> 
>   wifi: ath10k: skip WMI and beacon transmission when device is wedged (2026-05-12 07:00:00 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.1-rc5
> 
> In ath10k, avoid sending any commands to firmware when it is wedged.
> In ath11k, fix WMI buffer leaks on error conditions.
> 
> ----------------------------------------------------------------
> Kang Yang (1):
>       wifi: ath10k: skip WMI and beacon transmission when device is wedged
> 
> Nicolas Escande (3):
>       wifi: ath11k: fix error path leaks in some WMI WOW calls
>       wifi: ath11k: fix error path leaks in some WMI calls
>       wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> 
>  drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
>  drivers/net/wireless/ath/ath11k/testmode.c |   1 +
>  drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 27 deletions(-)

Johannes, since this hasn't been processed, please drop it.
I have some additional patches in ath-current and I'll send an updated PR.

/jeff

