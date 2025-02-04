Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F94C0218F
	for <ath11k@archiver.kernel.org>; Tue,  4 Feb 2025 04:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=; b=bwxAXRp3nHZZ9aLksPFj0zobTC
	5PD4Wr2kHpWvcqHaAkzg2OcWVoEOQjv++wIbjYlHKXMwsTJcAjqNOPl7++tkLeOo+Ar34NpVXHb/j
	Q6naXoYRvNoV+y/laVz93LMS8MLX1MyHwbYYMbyJ8jm90bOt2KmdUnswW/bDX9q6e0AXtiUFajGxF
	zJoURj7xPfY57maJV/7OcmaUh9zcEHeNS7mWKh2Y9Byy+pPfgZTd7qkQRxaAwAs6tDyzK0h0zFfoo
	Sd4Imo5M98k35oih9JXqgCDHZJfkHf3xk4+lZfHgQ0oFPQc/4eAhbC6E5/vviqb7uAdKixCJWbhNq
	cuZCuGTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAjk-0000000HFB8-0jXR;
	Tue, 04 Feb 2025 04:40:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfAjh-0000000HFAM-1BD6
	for ath11k@lists.infradead.org;
	Tue, 04 Feb 2025 04:40:34 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IplqE006109
	for <ath11k@lists.infradead.org>; Tue, 4 Feb 2025 04:40:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=; b=MxjKLJ/rI1V8AwV6
	cZ0eWVW64qKY+kL7/ttX4IV/wCT6Atnq/iedIg3KMvCU0mXSmv3zrBQo6qW9+i2Q
	/cS4mL1X5T/P93icMX/022lFx2cls8mVgGHMC45thg7mjICHnTpXX/z66c3cTEnE
	7x0TVPpjscWHH5rYKkmwpkx9O3JmFxCbQBqlLrH9B7TPRruIM1bKZAG4lZ12PqD1
	j0s2Cijk8i6ywzPtbbiZsDCb8XyWkT8A8zuWBBRsHqEdSBVWD8Jf6PROQnAQ8OFM
	NbBrXETsL0+SgN6qrcBv5o+CFwqBdRiWfCcvx4nlpZk2q5YLtV8l0tEeEMF6Y2Wf
	rk8Kew==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3ex11r6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 04 Feb 2025 04:40:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2f550d28f7dso9493328a91.3
        for <ath11k@lists.infradead.org>; Mon, 03 Feb 2025 20:40:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738644031; x=1739248831;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyEigm+d9Uorqg90VZ3oWzmIVHvWdBi3sutRRozdTgw=;
        b=C18UgkzfyHmQ6FCf/8TeYPrY3p28uHEJ2jX940ZfLHqW2V44U0ywOTq18HvDNG+y0T
         +AAvTQ1Otq4YEI5EYrRoYwxAXZAtXw1y4eQ6EILm1FzK0nidyopTXqWsrWTOq+F9Sd47
         TQjSIJZzkRGJ545unT9W9UbyHpgTJoWwXlkeoeinIwsfF0bBns7Md74mIspzyySfCC5H
         XuQchKoNh1KTjBG31UiWQcBA/yb0M/oRDQhQZFxvBSh3sEQxWOAWj6UQq/n1UOqsuFBz
         UQnTFlQVDth/3lQwNFzrTlbbrdzGGpwkfeBN2gG+PPsvjplKEu9FUV9ukU0M/dRLGoEb
         6ePg==
X-Forwarded-Encrypted: i=1; AJvYcCWZASG8AwTba9okW8jcaL6KEQ1Fw82RgOizMOTJQ13O09JPmEFVfqoPN9v19iUQLydiPVlUigw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDcT4AqldqIgmq2Ks6KmBq4yv/WNjaSJ1UaPjVW66b+s0K7p5Q
	D1w4OOZQcPvQaDr2uZFpEjvSC+kIOPXjH6D/6tqMxYypmkp5d3s4898ImoatElxy5uFwPbiTFG4
	2drMxilwFB6rilqYUkiskYiVTVqtQx+Mccq6e78+ZYaSK3VTSTIq3kmvtKNzq
X-Gm-Gg: ASbGncu68jB/YD9613I5FD9WsGhvSnQFVdiPPHxOGQ4GvAshWarFCpyR3QD7HwtoOjl
	1V1BMimxiPhULlu//YCtGHXzwBB7rodzZj6HF98wJVZ6jPUjhI9USdbDY9khNXSmpbLMqMlXHte
	mMvkP4KbRjJx4hqTwFN6wJlEJuEMpM2laIXto7tm7VgiIpZClVeYnQynCj9lVe462U96RjmkWh5
	DSuKFiopRNPd+AKplcLCqsfeGN+p3S2BMJMUaoeSSYRGkpSERj8kYS7fFrrBLJJETz+3FjegMxQ
	8zQ25BmWRlArw6gXzM/PD9fTGIH32VOAmb/az3s=
X-Received: by 2002:a05:6a00:2908:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72fd0c03db4mr34477865b3a.12.1738644030836;
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmjnxcTQy2/c6ZDU36visnorw1StO/iEunWwfk+QnXtFh2a47nGXWUIUstvIU2lC6Vh3r6Kw==
X-Received: by 2002:a05:6a00:2908:b0:726:64a5:5f67 with SMTP id d2e1a72fcca58-72fd0c03db4mr34477836b3a.12.1738644030406;
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebddbb1easm8951052a12.8.2025.02.03.20.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 20:40:30 -0800 (PST)
Message-ID: <ed23d3c1-7136-43b2-90ee-b46d43d27b2d@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 10:10:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] wifi: ath11k: refactor transmitted arvif retrieval
To: Aloka Dixit <aloka.dixit@oss.qualcomm.com>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <20250203214448.1978156-1-aloka.dixit@oss.qualcomm.com>
 <20250203214448.1978156-2-aloka.dixit@oss.qualcomm.com>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250203214448.1978156-2-aloka.dixit@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Kfq5bDPYU6fAhFtlYiwCJ0kc1g2H-3rH
X-Proofpoint-GUID: Kfq5bDPYU6fAhFtlYiwCJ0kc1g2H-3rH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 mlxlogscore=673
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502040035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204033_492875_023E6DBC 
X-CRM114-Status: GOOD (  12.00  )
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

On 2/4/25 03:14, Aloka Dixit wrote:
> Create a new function ath11k_mac_get_tx_arvif() to retrieve 'arvif'
> for the transmitted interface of the MBSSID set. This will help
> modifying the same code path to reflect mac80211 data structure
> changes to support MLO. This also fixes an issue in
> ath11k_mac_update_vif_chan() where tx_arvif is not reset to NULL
> inside for loop during each iteration.
> 

Is this tested? Perhaps you forgot to add "Tested-on:" tag?

> Signed-off-by: Aloka Dixit <aloka.dixit@oss.qualcomm.com>
> ---



-- 
Aditya

