Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F707CD342C
	for <ath11k@archiver.kernel.org>; Wed,  6 May 2026 18:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hWkIqC1spCWZJCjwZCz3MyMzSv0Xnf0zHmXzkGZ0ybI=; b=CfMQsW/+SON5Vv55k/b0ax/unu
	s+98S+DiZi6vzVWCxm5zBSrD5es4iN7SnBNFEHtDzvAlmIMPN0oYvpujVUwVKzGzzjqHxP+4THBSM
	JdUQO5BOC52XYzBacCbKY5AWBcKtLP+6Ei2/pjgztBjUFAvXcBuFmkcvs21Orw07lmPiUDKqdn6bh
	eeAKE097GByBVCgX0KDKqUAHgi8Dq/VWAH8kiNX2LBODczV7pAjVKlCS/bbWIrvP1e8Jz1ckc8ZHw
	6h8RENvvrsfp0Ebxu4VOkdlWg7Fpa7kzphBy5SO3azzLzy4n4apidGJejaMpx6oRnxxy3o2Ig3teP
	2h7Y/txw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgnw-00000001keB-1aMD;
	Wed, 06 May 2026 18:17:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKgnv-00000001kdg-2BCh
	for ath11k@lists.infradead.org;
	Wed, 06 May 2026 18:17:03 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646C5O1A3036592
	for <ath11k@lists.infradead.org>; Wed, 6 May 2026 18:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWkIqC1spCWZJCjwZCz3MyMzSv0Xnf0zHmXzkGZ0ybI=; b=BMVqzLK4MM9Y1t7T
	1X8Swvp+OjxHDdYlTKRymwrM190T9ywN7V3MiwfZzSVEMywrx+4t+hBOO1Ee4P8K
	5Qtwo5GdSoh85yGPbHlV2XvaDZs4NVJEFr8+drilL1YikAmxGQmhJk37GZsU1Opn
	D6K+xX7nN8Hf7mtn5AmWglWUCqD2xgEo2TLkjhxtpjl+E83JBpOq8Jp8s99lHLto
	0wvNmfgZc6Cf5pCVUkOghNhR/K+9E6Ut3gXr9YaphWHduovkB6br/rXsNraxSvno
	WEXZ7e2L5rkO1qOuUhn2LdEf9rdosZOIcGexS7+rSKGeJFwcnEs0uhzttIVqmDMr
	86zxBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e05bf1dvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 06 May 2026 18:17:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b9fe2d6793so911915ad.0
        for <ath11k@lists.infradead.org>; Wed, 06 May 2026 11:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778091421; x=1778696221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWkIqC1spCWZJCjwZCz3MyMzSv0Xnf0zHmXzkGZ0ybI=;
        b=AQqoKR+ASst2N1EKeOQmAWkFhmb3iJPvP6EiwvVS6Bqd5QvKar+qkM2p9NQkXaMTyO
         BoGX7qHJT4a9FgZKKjvoVPPpOrRZjE7RFkiahpo+R+LXNrFIPjImxYhYz1ReU8sUOPr/
         NoNlKYiFBAGo1ve65KkzvadtNxmMnOiK9ca8/0pGbyVmfDnsoegqIvQ5qmEWZ+v0/D1I
         VOBPX8mGBbNQSZ9eR8byGIN74931L5DKxMSC+cPz7AJlg/TJ+MxseH80JY1JwlkP1oLu
         coUaaJhg7+6DpevT9/43UCUaqaa24ZydbE3NX/LuIWhVpp8LBA3w1oTbeKe2rQkJyAFV
         e8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778091421; x=1778696221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWkIqC1spCWZJCjwZCz3MyMzSv0Xnf0zHmXzkGZ0ybI=;
        b=PO4wVDjZCl4DajF8+Tj0a37/szBgjOt2WzxBo7iWXBlL+sXIBxxLYtUHCWyI1gUd1J
         a09aNRZ1PAavF9qKNhIaUSrCCq4I/7wy3UqiGvJtG4x43wVpbrxf2OSDk2Z5gAFn8X7q
         GfSAd2h8Nkr+oztnsweGEpkIiJMT0T8ZxQrUTn/HvhjLXgbnrl9JM5I1o97Bz6B6HOvf
         MqTT4F33VNaDYWaHs6xnC4vH8rSVfYakMcNsx60rvKdoZmZ+hd10yYuC0/mV/AsqioOE
         Z3Kb/jjW1q6Mcu48z0Gi5dCoki+tw5MtXS38VeSqqXhJtfEN/RvzauFctr/2VoVmab6b
         NBig==
X-Forwarded-Encrypted: i=1; AFNElJ+jC9b9oZNUg7RdV00QAWL1+WsRiQm+DDzXho4SscTWgCiFeN71jKbTp32VmnZcvHQ5h8O8p7s=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuOZYeYCPzMALeliqeH3oSVk39C0XT0BJMMMMv1rVuW3b2axhk
	rqV2IP1Glhnvnn5ZYU2a+7qPoQ0eI82EFfJEM1MfKfEsdvndGPHI/GxA53Poa41Irl65VCsj867
	D9mbfJNLEdjdnDxQqg7FBjParSoIOchizu/I6ZdcdeuGCFhnFaJipdNoMpk/5Fw5s
X-Gm-Gg: AeBDies6+cKo9NzY9PcfW8hxzXsx+nLnT+OQceWOmJbeR6vjtXPOhr5WpLmPXqFOwj/
	+cGWReZvlki37l1702clnUUtgPnxD/6MhvaB7XbTW+2yejZuOjD0auhjrF8gnmSCoI4T96Ac4wQ
	cBAiuOEeWSmy0GtJU6go1sw9JnBS4Hw7GzAV31bGzfLQ/gA/rv7Ag1j3raURi7IT7n6QjkRA5iM
	XEBxvgkXzR6Y32mPcyN++HquFRZDBzT9ny7/8PyWnt0nXtqg5xiKx5QqYI8Lov0vVOFtqicvXgE
	c8NoZPPoTHxw8m77J2X5sCzekpcfBdR6hOfmK6fEk4H6b/kOo14fmBYrcMabgCQ8x8a+Rsg3dY6
	Ub6Cas6ri39hBy1uOUsauNocVD0KlZwByyZJqQEjqIV9qp2eLeQsf1teuNnxlGue8/dgw3nbmgH
	dQ
X-Received: by 2002:a17:903:151:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2ba78b48767mr33825745ad.4.1778091421552;
        Wed, 06 May 2026 11:17:01 -0700 (PDT)
X-Received: by 2002:a17:903:151:b0:2b4:5cea:f61c with SMTP id d9443c01a7336-2ba78b48767mr33825535ad.4.1778091420965;
        Wed, 06 May 2026 11:17:00 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.82.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7c038ebasm33167835ad.36.2026.05.06.11.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 11:17:00 -0700 (PDT)
Message-ID: <f6e20530-0b5d-4c19-9ccb-34ee1cc7ee18@oss.qualcomm.com>
Date: Wed, 6 May 2026 23:46:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] fix leaks in some WMI error path
To: Nicolas Escande <nico.escande@gmail.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260506134240.2284016-1-nico.escande@gmail.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260506134240.2284016-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE3OSBTYWx0ZWRfX4XG9e+oy02jB
 HW5sPpDlI6SzZirOlyq3zezVD7HD6r3Q3iAEfai2hsEJpZNBjgstKlgLpRd3RDz2RFjz2yuGlAq
 GEd9FfQQtCNvy5xHFoeoe7P60QVzgzd8ikk6RYzvudFRi4WKf2N90Ck4K5+CRdjmxWW6+Fgn8Pi
 TavLRl7wQv6YOSxG/RApGZdnT6hSJvgvJeWN+7maJGN6tQgvFgHtQ8eTl64wfOI+X4ma44AIRvm
 6Q4+Z2Y6TZ0WFhJUL3sj3dMNCY8HFQOyIbUx2eNUSwxDxknCtLwIZthycYjP3hf5hRAO7Jlb7xj
 70mfvYDnroMPYyRhrk9XdfGsgtjMnzDbpzUiWjB6VV9Pc55dpwqFI58wTFqXWtucxaqmkLo7X8Q
 jPVHnJDGDppCNElNfr7t6MhetVV2x1K/PlNYSCf0nMAoP6GTIZ9x+c1sXnKdl6x7FTfQm0zm4/J
 04QxbyWt929asQ8ebOw==
X-Authority-Analysis: v=2.4 cv=PqmjqQM3 c=1 sm=1 tr=0 ts=69fb859e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZCREz13nqshT/on6E9YcPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=6dxGyyh_nZznhl1tEkMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: zlUNYr0cCbSdsAwN_vJfKgGyglSRxClC
X-Proofpoint-ORIG-GUID: zlUNYr0cCbSdsAwN_vJfKgGyglSRxClC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060179
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_111703_679178_DE91635A 
X-CRM114-Status: GOOD (  15.23  )
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

On 5/6/2026 7:12 PM, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/
> 
> ---
> Changes from v1:
>    - Added patch to also fix ath11k_tm_cmd_wmi_ftm() as per Rameshkumar's remark
> 
> Nicolas Escande (3):
>    wifi: ath11k: fix leak in error path of some WOW related WMI commands
>    wifi: ath11k: fix error path leaks in some WMI calls
>    wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> 
>   drivers/net/wireless/ath/ath11k/testmode.c |   1 +
>   drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++---
>   2 files changed, 113 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

