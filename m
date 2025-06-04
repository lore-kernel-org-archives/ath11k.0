Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE20C5B543
	for <ath11k@archiver.kernel.org>; Wed,  4 Jun 2025 04:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6xI/j2rt/FbpC5WTd3gyKMGjPoB0WhMh3mpvInl0QU=; b=JRYpI87n4XvCbNsLZ1VP/0969u
	cjOAsDrlfxwjOv7kVGytQ+d6o1suKYqRwrA5dlO/NEoLM/kno/TytlXT6LSIhWjUU+NmyPym48hWM
	nsCz6EJOA1akV+h1UPKHCuO1jWhFdPxKpayuskC7cYyAQlmMdX8vVwacSNALxPAfbMWCiVh0S8Ju9
	X1UMMl1IYjlymEnBXiAAR4z5dG/Wv+tiPrWNfG32YmcBFWMa8bhm0NToGQJK17Oi/Q5XgJOutu8LO
	SvKY15Bm2B8v4WIhkWzXGy+jgNPiajqGImsQqQIZlcMgPFqA5M4w86mibbSDxDCPR4gZMb+Nbf9qS
	b5WU1T6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgAM-0000000Cahp-0j50;
	Wed, 04 Jun 2025 04:55:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMgAI-0000000Cagq-3Jqi
	for ath11k@lists.infradead.org;
	Wed, 04 Jun 2025 04:55:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553JvvQV000679
	for <ath11k@lists.infradead.org>; Wed, 4 Jun 2025 04:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6xI/j2rt/FbpC5WTd3gyKMGjPoB0WhMh3mpvInl0QU=; b=OC+RE2vMwgO4To2Z
	ZYF5BYwVYCiTYy5WqupvtXrtE2MM7uYd3JhiHABliEUXUpc2NAhN0LkD4RJkr0RZ
	3zvX+KEShGOLYA0SysYVqIomm/tkDo0pKwOtmwpZfWTaRvPo5XiJBVj8dB220Whw
	RPrh/1SATYpJ8+9SVxnPH4fg1MMniaD6b9vtdRZaKX0NQoXLnPOVNOjEeGkSfLgc
	pnXXdbMcyY/Xnooys6d0mM2dRQBgvZ+LNQupTMMca67XmiwfV9EiE1+50C2epiWY
	XESwEhHwkD3JnYXQbChhxXXw5XXGlgiEYrVLB5ZOyUxhuL+WftBpQwm1bo2g1yhh
	Tb2ShQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8q4v75-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 04 Jun 2025 04:55:48 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740774348f6so5419399b3a.1
        for <ath11k@lists.infradead.org>; Tue, 03 Jun 2025 21:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749012947; x=1749617747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G6xI/j2rt/FbpC5WTd3gyKMGjPoB0WhMh3mpvInl0QU=;
        b=TYzF+cXceWmWCBUrmN2XKN7a0Q5GBL5pBLvPe+PJTebzD7dX9633eamvIN1CC7CEpo
         QhzXjKTCact69xdWLazjK34Ppwb0V3lxRPpQoAzHwjaeq8IAowa3EdC+N37f/nm1EIno
         On9qDKm2l2c/tAuRcQb+CoLK2zihWqyD0jGMvVwlgUbY59+X20q76F3D8YYNxjX0/3kN
         IWKhkDLp5USaSSzPqRIfFW5d+pjaq/7jjMmoJT1H3fQfHGv6e8Jr0XShoF7Bkmud5BJZ
         ohnoHlKGHwxbxpltWoOs+HA7OQOKxmiD1jzvaa7AvA9qTdZNheMoeAVaPJsnkr7lf2y4
         Yxuw==
X-Forwarded-Encrypted: i=1; AJvYcCVI7F6y5uExIAXW/mwVPp/HJgPR8iHiJy6gXzmH0thiXrV4WRyZ1vikaeaYcfDSOrOlVivpTdk=@lists.infradead.org
X-Gm-Message-State: AOJu0YygZ+KuUjzQgibk7OXuIqHCpO8GKaFeVcGJalL1VRcVzwcimz5m
	qQ/dGm3iL9jtNGq8vDQsNHCaM2nk4atVsRq7LweAXG9BvrnX4CGFBnqtzaTV8xycNvF/Gc4JWgp
	Ymq8Gc1rqwch/wu5bJxsBmZmDPKihMrhjx+jGXVTjgQUg3UCwtIwf69XZp32K9uazTt7pN2qH
X-Gm-Gg: ASbGncuKNNFSNxXw61PmCTBkZwC67yvFT6Oy7g2yhq7KBSMqhRJSfvOGkUIaiWFDrBC
	S/LDqXTi8FMhAsjSkPuXillOIkglG+fy9YzrwYKoPfS1BnEJtKJoWCuAxVSRG1JXrUoEZ+iqqN2
	dk7rabHIzrPP94+nz/54JPjt3P3KoZnPFn3skoYz2yysYs4K+JrbMJJlteylGJ1zTKN3SfQaPsO
	m9kVXA38J6TV3+idl4dl6ZoHo5kylsp3H91npH9YdcqzDGAENYF6MQh5wcD8af5q7i4h0pEdZXY
	WEspBThzv5C53bzviKDjp+MWQDOBzYYG/fNOnzxXGPs8LkAhTH1EHwFKGU+8uPs8
X-Received: by 2002:a05:6a21:38c:b0:21c:fa68:c33a with SMTP id adf61e73a8af0-21d22b3e23dmr2148101637.23.1749012946997;
        Tue, 03 Jun 2025 21:55:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrke0SC+6zC9HUdqtri8k0yK+V0ol5laCcwPMyQaz3cgeCVLCSdAo7CbS/kXjM0m44UN0i4Q==
X-Received: by 2002:a05:6a21:38c:b0:21c:fa68:c33a with SMTP id adf61e73a8af0-21d22b3e23dmr2148075637.23.1749012946608;
        Tue, 03 Jun 2025 21:55:46 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb36aecsm7917620a12.40.2025.06.03.21.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 21:55:46 -0700 (PDT)
Message-ID: <d4e44cf2-4fe1-827f-0255-9b77fc91bd2f@oss.qualcomm.com>
Date: Wed, 4 Jun 2025 10:25:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/7] wifi: ath11k: fixes and refactor to firmware stats
 related functions
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250220082448.31039-1-quic_bqiang@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250220082448.31039-1-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H1-RS1n6Ac0L_jlVfJ8izXNTwAjA9TJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDAzOSBTYWx0ZWRfXxqa3PYH+IVlP
 nckodyx2YVJ0RJNCjSdegs7t8vWghEpGRBjJ4NqCAdvmB9anp2PiaF0WuUtHCvfxXDxzJHhrJuj
 qpkGoHOC7ZkExYvG2zqpgVPhbA6ETa07suPq5TSkLwDCIrHFmQBH7auDHP8LQ4vMNOIS5a49e3B
 p5iWsccV/GaweT4jyQtjIRDfyxUysqzn55cqRI51lS2Ckkb/yZ64nXOvWyRlz0Ig95PZwTR+37A
 mjLL54CqZgFq/Fm9DIg6281zcFwFQA3U6/Bd/YYJf5D5hnB82CN6CzVHfkbr5zif0C1OU58z5gI
 sZc6vieuBX3+ZCoBUVjqrPFi9UnjFCNTjqQfmU1sJcAaSsPHnZ/wfwMJzO3OskpKiyhYGKH9AbV
 oosj2mO2TfYoyChomETfMaPtxvySzmtGwNOAPjc9iiw0KPAib7eYMxnb70OpYqGnAvCK7DQ+
X-Proofpoint-ORIG-GUID: H1-RS1n6Ac0L_jlVfJ8izXNTwAjA9TJe
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=683fd1d4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=ZLGELXoPAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Q7OW8kP0y2Iz0-KcJacA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=CFiPc5v16LZhaT-MVE1c:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_215550_971595_48BFC479 
X-CRM114-Status: GOOD (  17.42  )
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



On 2/20/2025 1:54 PM, Baochen Qiang wrote:
> We get report [1] that CPU is running in hot loop while requesting firmware stats,
> fix it in patch [1/6]. While at it, fix potential failures due to static variables
> in patch [2/6]. patch [3/6] fix potential issues in cases ath11k debugfs is not
> enabled. patch [4/6] fix lock symmetry issue. and the last two patches refactor
> firmware stats request helpers such that we can remove some redundant code.
> 
> [1] https://lore.kernel.org/all/7324ac7a-8b7a-42a5-aa19-de52138ff638@app.fastmail.com
> 
> v2:
>   - rebased on ToT
>   - use completion mechanism in patch "wifi: ath11k: avoid burning CPU in
>     ath11k_debugfs_fw_stats_request()"
>   - add new patch: "wifi: ath11k: don't wait when there is no vdev started"
>   - update copyright where applicable
> 	
> Link to v1:
> 	https://lore.kernel.org/linux-wireless/20241113015631.3105-1-quic_bqiang@quicinc.com/
> 
> Baochen Qiang (7):
>    wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
>    wifi: ath11k: don't use static variables in
>      ath11k_debugfs_fw_stats_process()
>    wifi: ath11k: don't wait when there is no vdev started
>    wifi: ath11k: move some firmware stats related functions outside of
>      debugfs
>    wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
>    wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
>    wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
> 
>   drivers/net/wireless/ath/ath11k/core.c    |   1 +
>   drivers/net/wireless/ath/ath11k/core.h    |   4 +-
>   drivers/net/wireless/ath/ath11k/debugfs.c | 148 ++--------------------
>   drivers/net/wireless/ath/ath11k/debugfs.h |  10 +-
>   drivers/net/wireless/ath/ath11k/mac.c     | 127 ++++++++++++-------
>   drivers/net/wireless/ath/ath11k/mac.h     |   4 +-
>   drivers/net/wireless/ath/ath11k/wmi.c     |  49 ++++++-
>   7 files changed, 147 insertions(+), 196 deletions(-)
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

