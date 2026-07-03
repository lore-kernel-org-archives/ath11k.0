Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFEBC43458
	for <ath11k@archiver.kernel.org>; Fri,  3 Jul 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7nX2t7d/sMmYWGo3rIr0X5bV0IZTvF333uqoqdP2u0=; b=RdCeekRh2M3sWmEbFKpp9Ih/Zq
	GB9+r9XUXf1RD3N42cbNHwepmog5q61OKp42YdV/TIofmg6T7+kmSePr7+KEnStKUU3FyPRoV4gBc
	qdLQ5Ucs+yJzZpJ0MsSFF/qcVmsS2LdwYCr/xjFbUPYq/7cqc6SkSTL6VXEHdToSt9eONB7DnJC5J
	BnMIlh7wHlvUySNd9mQiq3OgNaMjNhkHEn7JEgbEFlFhda25LjMPUJAww8cLakjryO7oVjYVAG1Z1
	Kh56x3tTap5o+PYk4SayDgmAAGpf77t6bHzVpqmnaRzeP8vG3bEAExN4EZs6HizYfa8zS/YNYEdeV
	S3evEqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbG0-00000006fEh-0Asu;
	Fri, 03 Jul 2026 10:36:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfbFw-00000006fBS-42q6
	for ath11k@lists.infradead.org;
	Fri, 03 Jul 2026 10:36:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635s3Vc3126906
	for <ath11k@lists.infradead.org>; Fri, 3 Jul 2026 10:36:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7nX2t7d/sMmYWGo3rIr0X5bV0IZTvF333uqoqdP2u0=; b=EpJdPjDS1nK7FVuc
	MpWYxPN1aKqTdHLS0tw5yQCXtxcMTIby4BTOJ6bwQUxcn15qaE/22tHgCbu+ZN/5
	uZdmwzjZpBnebH9i0TtMmZozqbP7VIcdjvjMtpYJqKJj7g0yr4ro6chrub1oo7k3
	od8kKowptdwNXwTW/qgPgjzzgWpeQp95Gf6GhhVI5SccldkjHR9NpmlY3ImaaMlC
	APNYEWe8YYQbApC46CZfupqD2RXJF8mAxFKYnwKXMeDpq9hbZNsV3jl0hhuuGTgZ
	7TrBHGMjC7cRFUH0BjOxgEON+AthjlkeQ5ilaq3Td+El0FiDxdFfAZQRYMox/YW2
	rEVHig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnm0mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 10:36:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cac01e89e3so7265245ad.0
        for <ath11k@lists.infradead.org>; Fri, 03 Jul 2026 03:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783074983; x=1783679783; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7nX2t7d/sMmYWGo3rIr0X5bV0IZTvF333uqoqdP2u0=;
        b=NGJunfc/sP0mcL6tZWUyM1G+IS1HlZeqOZV1MXt6heGTNZhvH3H2XqTSasu0cTQwih
         +figI5/XSGePo0QlJnBdL+UhEOxD3iHCQpVZJ3Vv4FOWPM6fX5wh5UhmNZVvU0c+NSKH
         yZdRHvzg6tx0o4PNZcVHYamoD/QTM6K7pej5fQ/pXTTZBEqpXgwMaqZ0eWOCRohQePjk
         mxALisIuxQ84FLKjqXYj+C3HXQEY8qXqQUs1TslyCP281Ha2oGg6OsKkLgtPu7RFBeF3
         TPJGJUaMixA45rahv31U93/JGKfNUrw/f3oBC5sJRpCFTE+zpH15XdIFdrZN1I+TC7wc
         WRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783074983; x=1783679783;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7nX2t7d/sMmYWGo3rIr0X5bV0IZTvF333uqoqdP2u0=;
        b=X07EYkmUZ7lH/5e7mFSwmAC9la83xU/MxxjrEZPmlm+LPLAYLBb/hkCzMyaB3ibk8c
         hyQ94NKCxCL7v0Wnyn3YtzeMzoBbogz7tiiOfagGRIyidkKIdI92OY/C09etv8oAIkRN
         2cs7OmJCb7M6XrmpqzwChQSNCx/2O6NAxWW92ViGWf9rCpGRJc5SD3RylhX3538qF0cw
         jo2bp10uQZE6qw3Up1cPLV3n0kn4hjiux2XhtNG6tCQH1SDou5ViSDLx03p5SUfpJvh2
         kAGAcoCj/buljIKfFF7SqXGxSj53CIkF58GUgBi1VOC5ypY0654tl/p1w6QNxRCyEE8F
         yw8g==
X-Forwarded-Encrypted: i=1; AFNElJ8T/XfeDeNmyn7SXrpHV728jPOmPLUXQBp/9HOvqZVlRFDYyD9I6ABuJjr2iDRBa06QTLESQqU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3UvyL7xP3tl5NFZRJgGgXulEzwxtmyj/i0XMC1H1+eT/iXs6T
	4UxiIXUDPLMjaeUYOcnS3yyDTbEdVlr0N9on6JGn1YzWgdXh5Z5vG30uTwuu8aFm71aWOUTkPpP
	n/HHNQAZdgGOP7NuJ/CD0gp7N3KOdF8kTUoI5DENcdlh9WFI9tlOTD0FIePBs/5yv
X-Gm-Gg: AfdE7cnXWTVvnQWCv8CySC3DasuMri7bqo2igfooznc9LXOX+uqOqodJOnlpUDymKt0
	sks4YcTXq9wbPEGYXLHoezV6g5s52lyOAH4quITC9+/KPg6i3ZKHUeR+eZ2O3aD9JTxsC016JvV
	Zt9aucJrVTrf1B0QtXa6tW/0xx2V59pnIGlmC8bzaYtF9zLyHH8iP+J8waX5ofuIYfBsZB2458y
	C5/erCq++leef8yoXeQwcpF5OfC4q6EdWkAno+KalEp7NDxmDagFBFrCu3FAdm+XjY3C8VafyOy
	orxl1TAqIzFK2ZYaQG7xbVjIlOANv0elExbTsHAwcxhR+srl0dpasdJWDxFLHsoCE9iz/r5+i15
	FdD3dd8QYyinWinDt7/DI8YK21yGcECEUWREwOfNnkBbuMcz1egQ=
X-Received: by 2002:a17:903:3c6b:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cacb070082mr42780325ad.15.1783074982846;
        Fri, 03 Jul 2026 03:36:22 -0700 (PDT)
X-Received: by 2002:a17:903:3c6b:b0:2c9:d56d:afa3 with SMTP id d9443c01a7336-2cacb070082mr42779985ad.15.1783074982316;
        Fri, 03 Jul 2026 03:36:22 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b446a766asm13555217c88.7.2026.07.03.03.36.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 03:36:21 -0700 (PDT)
Message-ID: <20d52df0-a33c-48da-8f62-9adb7c77eea0@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 16:06:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix potential buffer underflow in
 ath11k_hal_rx_msdu_list_get()
To: Dmitry Morgun <d.morgun@ispras.ru>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
References: <20260530114252.42615-1-d.morgun@ispras.ru>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260530114252.42615-1-d.morgun@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: LZ9sUmiBir9KrMPghdBUpRxMiaClVsvK
X-Proofpoint-ORIG-GUID: LZ9sUmiBir9KrMPghdBUpRxMiaClVsvK
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a4790a7 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=HH5vDtPzAAAA:8 a=xjQjg--fAAAA:8 a=EUspDBNiAAAA:8 a=YRM84PAP6wGYPlwToDIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
 a=QM_-zKB-Ew0MsOlNKMB5:22 a=L4vkcYpMSA5nFlNZ2tk3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEwMiBTYWx0ZWRfX7GXsDy4UcJ/A
 Z95dR61jArLTitPu79TES5O00qzBkt6wFxll7OhIZYk+bRgeWjDfzGTjYtg7nMUE7Wy6oV6DcNc
 uSUL51mR41gqezZfMLxNxXqdbPknc/g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEwMiBTYWx0ZWRfX/oKl9IcYQBW5
 t/DJsUO7jLCtF6JXoVIQRldaQN6ssGq1zr3ccbzasDg06894iI1ofh/frM5Sn+Ub5Rh81S9N8Xt
 ySymFqe7SseRUiO/WMFZCHy9TIW8YbZForquu0UMkSIB66u55+mtt3uW0i6rQUX80YjiXomfVVv
 0pNXu1y1GgafQAK0Cx72tyf/wsUDKvZvkgRLWfWi0s9uaJro+GxUMVdCP50Xdvjv1/i1MWXKKNg
 /tMAZYKqS0Az9LyGKIeUafqqPrJxb1NGyWwyljUQe+jdvakxCXKadMmfcv1GR0r6+2DlaFmwBuS
 wpnNy+9A/sBWfvK8jwW/it8ya6Ks02w7n0pqtS7DeySBnhEB3IqB3m7O6OZ0rSdBqpOqqvE2LMk
 ZxNvGIRJPxu0qCHfQ22L9Xk8wZuMMpV7lZ+8hUWl2UHXDSIl7En46ZoVx6GpMlpGFto/7/XfdCA
 E7zlqcsDn4qyeVLcpsQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_033625_346148_977F7C2F 
X-CRM114-Status: GOOD (  10.77  )
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

On 5/30/2026 5:12 PM, Dmitry Morgun wrote:
> When the first entry in msdu_details has a zero buffer address,
> the code accesses msdu_details[i - 1] with i == 0, causing a
> buffer underflow.
> 
> Fix similarly to ath12k_wifi7_hal_rx_msdu_list_get() by adding
> a separate check for i == 0 before the main condition to prevent
> the out-of-bounds access.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Signed-off-by: Dmitry Morgun <d.morgun@ispras.ru>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

