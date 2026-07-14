Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D17C44501
	for <ath11k@archiver.kernel.org>; Tue, 14 Jul 2026 02:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=; b=x8e7QNQsQwoZRM4uuuTfyBK/i2
	FjX4ys1wgur2SmZj4Q+x12mIxiJe1/TEtq8S6+OXKJSk80cLlNGtT06rj2Gvcm6xr3sP7auOEbNIB
	3ymeFLseg5QbytSHmcxX5ub8+34zkCypSjxhZt9x+xnnF+9ELPsag++Cv5NP5LwWwRb7NKf0vIXTb
	MAt0vqk5z8AitF4ld3BkwWvuFGLxH0jhebiHhZ89XcP8M/RRMLiU8wbkE482zzz9/W5vsPPJCkRIB
	e849MuZGFjCsAYrF8GY/kDuq+b+fIRM6t7P37zyIHA8wMrNxjxmk8CpW/LLgd613vsRpcdGEV19M9
	s/81KUcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT7q-0000000Alp5-2fsF;
	Tue, 14 Jul 2026 02:44:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT7o-0000000Alo8-0DWF
	for ath11k@lists.infradead.org;
	Tue, 14 Jul 2026 02:44:01 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNn6OX2954425
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 02:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=; b=KGafVAMqtHkOmRY4
	tmGl+zGa6Hf9/8j9uQc8K73AABn0VXca/Ya2uXn8Sw8G7BLBFjXBoDyolbuVXqAl
	4alGkBIb4qZJ4O3SniPqzWQ96q8fyMyTpQgwvuPzMMuJqMblnNhddQBUqCyzXo4P
	IBXlENchzcdas9zadJb7tmZiyf7GwmV/AW0JKo7XvVttofDQ9gUL2UAZ+Sp7RWFB
	KNCIgvIRE3zxYJ6crdbRNO1pbf8rci8xUlN790cbJJ8KlExGrmzyma6Z/Ltt/2zM
	/KfZJ595nlRZczV0THOtemOOL/RSVFNQeLbbuuX0C5FF7220fijFoaN4Jqz5960L
	1AAAcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4ucre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 14 Jul 2026 02:43:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc86a9ef97so80713505ad.3
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 19:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783997037; x=1784601837; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=;
        b=eONRv1orJnR1+luyq46/wQCbriWHbbss4ftYzJv3krTh3e7UP2YP52oWqpIFTaTtPs
         Apd3QBy8j7UU4ACOvVk0LqPELRVncRmjWMaKqWySfLHxC7x1Nlq46nBexydanTZWCngr
         dR2GoipEwho+O/j3XocOI4nEPDWz9BO40PUS8CV4T3dXMMy2UnvbEnLHC1vIapfV8bMP
         1+F6durXJO+Hp+c2AlYSTtTC4myHFe8p4OO24E4/V8s2Vx0aDky5EiDaRgN0Ims34qhC
         Y5I6GQkHZDcouJJY4RmKwJ9Oxqvwj653Qh8RqacaR8xU6BqW9Vk+JAxB6PZei/9eAHk/
         TgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783997037; x=1784601837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=;
        b=ayMtZR7IFNlyw9sDiCwVinladF80mfwmuSNdfxcwYiqTkw7X4OUUAAnO8OeQT5T8JV
         FazDsAKGYdryrse1TPiaqB+p6eTx1zneCGjJ8x7D2PgxAZHu4Az8JMMtYt/g/0HbpTjY
         r6ZYnzQ7xL+MUO8Doovb82ikTTJq9a1w1O1vGg9Ml2cH0UOtb+RMagT4G1B4l8b5uIjY
         KkFgghUzBsVfMvfkuhTtxhewWYpGDMexy1fFztaQcCeru/2G6+tf3Oh7eXMoedeJNkPG
         yHjKY8g17URHivgYWMtZvY+rO8ruzQubdt3Ik3d9GnXxc0cfs7pjWt0Bb/Y8Gr5ft+6r
         tC9w==
X-Forwarded-Encrypted: i=1; AHgh+RqsEDQ6mGn/1xvPu1QnqfSlZT941mHFG3FbOvEKcOmWtCGbSNEOyguIf12XgTmiaM7RE0hMb0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTNfkkyUsCc9T9eL7tmZaDr2d6KCS0oEFelPJkzsGRwro+KP6N
	D14/ZmoHm3c2Yo25ERo8qN+DPDDHjIZjPPnnAGST77cGIKqacwONO6LZf7BkNQTOFjtnRd6p28c
	hXVSB1NWyIZuvfBBI5bgy4MRgQeXRTd8wUldbHuGI/GIuaS6zxwphl5q6GUbMYmXi
X-Gm-Gg: AfdE7ckAo35XN4cvloc14M2qNlYqBY+RuDVI7VKRKw4wOWkH+QTb59DTuo1YEXC3kH4
	6q/aMkrplJRp8eQ2Rz2sD/We7q3NHGPpxvFy7Pd1T1pw5O2R0ZbDDocH7gb3vHHaI+nblaxhpgQ
	WOM9x8DkTYjGd7zUjFJ7MVGJ8OglF1fpVKUWjp4W+UlUQHdjWf8ErRiKA9o1/amHyw9blCTbC9x
	S3a+J4Ko90dx9Bsob5vOWTtF/LLA3pJL02iZRd4lJiZRUk5wANbNV4LtujWQk8kd40MREz51TXB
	0+1xZuJQhWPzd2mKZsMFgBZEr08JlclcozMDjdQU9cxs/m88xjL4ea10Kvl+dXgQC/42dmYviDG
	vonQooIvi66EaMnuOlacGyuRBzOqxKM8BLzPc30CrAzxYJtY/U4PjjDc9ApV5Gyv3Z7alS7mkuo
	+TIaVUg6Y=
X-Received: by 2002:a17:903:189:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2cee9a8ad02mr17077875ad.13.1783997037193;
        Mon, 13 Jul 2026 19:43:57 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2cee9a8ad02mr17077665ad.13.1783997036665;
        Mon, 13 Jul 2026 19:43:56 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7ddsm108461875ad.1.2026.07.13.19.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 19:43:55 -0700 (PDT)
Message-ID: <c57ac898-e74b-482b-8993-c4aeed728ac4@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID in
 WMI scan request
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55a26e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fdWN1coKQMrcGTyBBJUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAyNiBTYWx0ZWRfX7VP/DATl4u57
 2I07tboYNXAEe71QDX7FJHfNA+jYBTMWPrpxQ2/Ywe98xb70ruwRKuhCuAby0riPq1e2Gj/8Hio
 2d2DZDkhhXZR412EBj8ykdtr3fMK3T0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAyNiBTYWx0ZWRfX2ooIR8J71blb
 Y7TCikh3sZoTcpXu/0qdbhuHyUMHleFG0dj0lZhOZNWufiKS5d83PywgjwX9uo0wFWu5qElJRaT
 /Igej8CiRsH5QAmOdcOT5cltpo4YDWRjh8KXcFIBVmoEM2uyHuDVWeechkQvi1vxGBH4BYui3Zl
 bbh86gQkTit7byHfJiPCOmndU7WtHS9hMW+lFxuW0+5WKyaQk2DZ/Z2snknltZyjMFbpAJzW5oY
 q0/KS3N/hRIGok60PeImnw1HmdPbGCh8miHbDfL1nDDdXQU9FFMN8UTC1aprAGDmtu0xs/CrbF4
 dfJ0cHtkW0jihhB4mcq+S9sgEvGyh98eXAGyRpV6MsO07Nv7lH78HzuV2Jhm1n6OgikliLn2x8L
 tCtLxTx40tBrHM/ef4H3rgP+Ock/Bkj0yvUjG2SH0f2IonocfCs/Ffeoea6Mw/AzP6JVVq4kqwT
 63CXFZHD0D4raJrCibQ==
X-Proofpoint-ORIG-GUID: Ty60Unok8qYOQ0ytFKVl7dzP3o_kxDWI
X-Proofpoint-GUID: Ty60Unok8qYOQ0ytFKVl7dzP3o_kxDWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_194400_198079_4845C9E7 
X-CRM114-Status: UNSURE (   9.27  )
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



On 7/14/2026 12:15 AM, Jeff Johnson wrote:
> Issue was reported in ath12k, but exists in ath11k as well.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
>       wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
>  drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
> change-id: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


