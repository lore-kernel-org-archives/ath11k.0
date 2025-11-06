Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6392DCCF9F8
	for <ath11k@archiver.kernel.org>; Thu,  6 Nov 2025 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzv1yTzt2RufxPXCysYd/nddVUqtY3l4eZc0BE4yJU0=; b=TmwJRbbwQvQQgA2LbQ9Mp2230J
	YEWKeyEc+PmdkITKPSa5/MxvcOmnlb8CdAeWBLIq2QFe96SVqgwRBRMyIBOY5EsqrFCKG9d1ReWM0
	VtQid3gn0fdOou++zPwSAuqatkC4JhuaL9ADhmirCR0zLN8twUn9dhk4uEwg5TMXD/PjPf2RA0ufv
	naeU6dvrvzymmCmrgDtiIn9Xac3TXwrNglQKqSRRx5J9Lnuxm6EyaG5pcBp6IXBUNU+6n4XzBRMjs
	CLbE7tY8/FMp2BP/N3nXoirNflqZ0r/DVGD+wwhcghUS1FT3W64Zu8/QnnJSM/1HUivoqUcs/Jphw
	zEQ/Nvvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvhY-0000000F5KS-2bq8;
	Thu, 06 Nov 2025 08:50:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGvhW-0000000F5K1-0Rhb
	for ath11k@lists.infradead.org;
	Thu, 06 Nov 2025 08:50:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A68jkSW3383553
	for <ath11k@lists.infradead.org>; Thu, 6 Nov 2025 08:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jzv1yTzt2RufxPXCysYd/nddVUqtY3l4eZc0BE4yJU0=; b=K4jEMhK0ebWBshQy
	pZBFpZDAIk/RKKd33BpRIi6ZgkStwJMuCJtG7GnCss++wpf/ac6bEIu88OVWZdTI
	3IhgyrjFU288bKdeE7S/wE9FyZR8xAEBGCJ6hdXTsyT0DSxC1XOvQGpjOACAcezs
	+EE0o1jQj8u47jlgPERUqaGnoEn8jCuj27tXytJCg0yWx7oFRE1tBpN+xoK9/S9G
	W5wbtReFqiuaqRjiDQU6Q//Dpu5WvEJih3CGa8FXSB+j83gwTgZ2ed4DRRxccCaS
	ikZjxKM//XV4tNqHpXh9dIGKu5fW38LSydKIOCAwqFZVFlYdaW12S47zd1GKIJFs
	aoBLtA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8reur0f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 06 Nov 2025 08:50:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3407734d98bso1158686a91.3
        for <ath11k@lists.infradead.org>; Thu, 06 Nov 2025 00:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762419035; x=1763023835; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jzv1yTzt2RufxPXCysYd/nddVUqtY3l4eZc0BE4yJU0=;
        b=iLXDl3ID2W/IN302DyxatJ/9QnM9Bv9hGt60ul5D6urIFsF6p3NFlQmiuPaBab5V++
         9bGdkzRc4kzo6j9GCc78BTyGmoR2xsdMrKU+sRVuFd7ELLWk8LJv0YzNuSHi78nDdu2p
         yuYJsosyRzU+J5XkZFIZKB8RQtZ5kXlKTLOOxl2YpBZaaPkkxvH97vEr9leT/HCLF/cf
         k6Tr8nR1/pWzxCM9H3eT9NhJqDox9tZYn/6uSJOthcnWJhBQawIJLZ5RX3JvN0C0qztQ
         DGE8NShtjmlB4fC/6M1rWbzBGshNZ/Ko5B2lMQruDqYGq5DKCTjk3zEJuybf/kved3ge
         6iZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762419035; x=1763023835;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzv1yTzt2RufxPXCysYd/nddVUqtY3l4eZc0BE4yJU0=;
        b=YrdGgkholkq57a0cWtG3J5TaljU5Q1jCkTKLDIYpxm7R+0u36yTGepMe1UsSNdd4eD
         KQn1A/iEbYdOaSmvGh2FAyYUJbMcYf8lTliGcwnU1v6DsPrG3vy2L73MzaXOO121NJmr
         m3xuPNW67x0G4TAEc4Aaen1dDcqCcIxeK68zeA9jopTU1yxgtcxCzvlMn26qrde43J84
         E0DdQEDhADeDm3uHJd1thSgyVcngJQdNoW4PE/Nx3265KbVWysMDcOpxZkidybUfDTGD
         cDkj4bAC2ohiuomzesPHkvgU9AyPzpCSg6gJ11f/uz/lvaWJQA1lVR638lycy/9LoMHq
         58tg==
X-Forwarded-Encrypted: i=1; AJvYcCWmM/cJriOgDljYhIcLzmZEiHOlojHYShE6CtzT1HlScsj9kBxHjW2BkFv7jMz1J2NMm7Al6Ls=@lists.infradead.org
X-Gm-Message-State: AOJu0YywJj/gLYcq9uosqMdgQ8ZF+XeOvfxDHAgRqrLyTamMRLQBjtUK
	nB8aiAZ788VIA7zNhuUWBhkOaA6h7M3RJmSG+0ttm4+kUf0Ocyxr4mheh82BT+NKzr5EM3hn3jk
	5UxpR6xYOLnztgDwTsKBw9HCt6xB/K80CvjycxpmSg7Q9Jf5+Xx1Ujiwl+g5ZGbPB
X-Gm-Gg: ASbGncsa1z6u2Sk7JNLcY7HENqEn4H8lwg4O9bpjuCZ9uYbBhSjmtlaeM4JGVPi+y/G
	THvWDWk7SAlXVT+Uot1JQhuSGKVoVAIeOubzw9huFXDAXHtEs92r7lIz3qKqvZ+zJIOJd8hg4B5
	EPZkXXdXzgMZkjKwnQbVVHKMTKZWa9qfbpUwCj0zI6cOscZuEY6qQgvCbLfS0RsZfIhK3T4D1QF
	3GvA40RmxNX5dDHCKOB+tQgvDQKqm0wO0dfdVV9r5cYUb6B9rcVOQ7WkdKO7h9WW7JGWlPffAc0
	LftwwSZoVFpDjSwBoc6E0UMLfYPW5zArX9zUnWCixDIUM5Tso2dR47ilCd0BE7G4KI5b0cMhChl
	P3UFhGBs68fi+keOfcEwexTyQXz+dKNYIqs6Ie50IOvyUfc6EOInu3cofshCpSOnRwHPsHmhD
X-Received: by 2002:a05:6a20:2589:b0:340:c6cd:545b with SMTP id adf61e73a8af0-34f8601d2dbmr8310897637.44.1762419035255;
        Thu, 06 Nov 2025 00:50:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9WA8Q9OBOvy+W03mWMWpuJqtsAQ6hbgML/ovXeLVnmjdSHkr68hNbqJUMCMAf7GNeaTowtg==
X-Received: by 2002:a05:6a20:2589:b0:340:c6cd:545b with SMTP id adf61e73a8af0-34f8601d2dbmr8310866637.44.1762419034647;
        Thu, 06 Nov 2025 00:50:34 -0800 (PST)
Received: from [10.133.33.172] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8f9ed21desm1841412a12.11.2025.11.06.00.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 00:50:34 -0800 (PST)
Message-ID: <2cc29c2e-a066-4c49-99dd-872cc2f5f326@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 16:50:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 0/6] wifi: ath11k: Add single shot/periodic
 CFR capture support
To: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>, jjohnson@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org
References: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251105172226.3182968-1-yu.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA3MCBTYWx0ZWRfX56q28mhShZYu
 sQhxzM4xloaQbfM6q9CaIPDECF6eTM2p11Mv+r4GhSF100RXYZUITT8TLoPSNEB0PhFHxytErJb
 wBJbvPNazjoKaMoAvsp57E7wPsMxsdMiUoRqwtRMmh/BPiWp69jXlTFznZai2CYNu8iOKftYoOM
 IesPWURU5+K3GGPCavEaL43IiGZNHUtMNju8SnDluLg3tLmAOuOTwjnSCY/HwgcR3ONRERkRx9g
 5ETs0gFGfuMcllZPeUxyzrMP+MUVcH2HJ3cW9RHeaGxmY3JogTL4NOINQz0/kq/QGpl4pjgFB7L
 Dxa2tENU0/RGV1ZS6BBrkcSoGoO9XhtnHnHbkTQ7XTxUZEOrv2KDRQvfbI4eaimMFdro3Ci4NkK
 gScnlqHQFskmjR4MzGcmZdXBy8Ajwg==
X-Proofpoint-ORIG-GUID: uw12Wys06cUUtZrOJyMmP-F-lM5xOvnu
X-Authority-Analysis: v=2.4 cv=RrDI7SmK c=1 sm=1 tr=0 ts=690c615c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=W4cqpq0YkI6qXs7jkP8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uw12Wys06cUUtZrOJyMmP-F-lM5xOvnu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_005038_272609_8741FBF3 
X-CRM114-Status: GOOD (  14.47  )
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



On 11/6/2025 1:22 AM, Yu Zhang(Yuriy) wrote:
> To enable/disable cfr feature use command,
> 
> echo <val> > /sys/kernel/debug/ieee80211/phyX/ath11k/enable_cfr
> 
> where, val: 0 to disable CFR and 1 to enable CFR.
> 
> To enable CFR capture for associated peers,
> 
> echo "<val> <bw> <periodicity> <method>"
>  >
> /sys/kernel/debug/ieee80211/phyX/netdev\:wlanx/stations/<mac>/cfr_capture
> 
> val: 0 - stop CFR capture
>      1 - start CFR capture
> bw: CFR capture bandwidth
>      0 - 20MHZ
>      1 - 40MHZ
>      2 - 80MHZ
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> method: Method used by hardware to collect the CFR dump.
>      0 - from the ACKs of QOS NULL packets.
> 
> To enable CFR capture for unassociated clients,
> 
> echo “<mac address> <val> <periodicity>”
>  > /sys/kernel/debug/ieee80211/phyX/ath11k/cfr_unassoc
> 
> Mac address: mac address of the client.
> Val: 0 - start CFR capture
>      1 – stop CFR capture
> Periodicity: Periodicity at which hardware is expceted to collect CFR
> dump.
>      0 - single shot capture.
>      non zero - for Periodic captures (value should be multiple of 10
> ms)
> 
> To collect the cfr dump,
> cat /sys/kernel/debug/ieee80211/phy0/ath11k/cfr_capture0 > /tmp/cfr.bin
> 
> Previous link:
> https://lore.kernel.org/all/1645005922-7252-1-git-send-email-quic_vnaralas@quicinc.com/
> 
> Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
> 
> ---
> Changes in v3:
>  - Update related comments. 
> Changes in v2:
>  - Update related comments. 
> ---
> 
> Venkateswara Naralasetty (6):
>   wifi: ath11k: Add initialization and deinitialization sequence for CFR
>     module
>   wifi: ath11k: Register debugfs for CFR configuration
>   wifi: ath11k: Add support unassociated client CFR
>   wifi: ath11k: Register relayfs entries for CFR dump
>   wifi: ath11k: Register DBR event handler for CFR data
>   wifi: ath11k: Register handler for CFR capture event
> 
>  drivers/net/wireless/ath/ath11k/Kconfig       |   11 +
>  drivers/net/wireless/ath/ath11k/Makefile      |    1 +
>  drivers/net/wireless/ath/ath11k/cfr.c         | 1007 +++++++++++++++++
>  drivers/net/wireless/ath/ath11k/cfr.h         |  302 +++++
>  drivers/net/wireless/ath/ath11k/core.c        |   41 +-
>  drivers/net/wireless/ath/ath11k/core.h        |   19 +-
>  drivers/net/wireless/ath/ath11k/dbring.c      |   50 +-
>  drivers/net/wireless/ath/ath11k/dbring.h      |    8 +-
>  drivers/net/wireless/ath/ath11k/debug.h       |    8 +-
>  drivers/net/wireless/ath/ath11k/debugfs_sta.c |  143 ++-
>  drivers/net/wireless/ath/ath11k/hal.c         |    3 +-
>  drivers/net/wireless/ath/ath11k/hw.h          |    5 +-
>  drivers/net/wireless/ath/ath11k/mac.c         |   17 +-
>  drivers/net/wireless/ath/ath11k/wmi.c         |  147 ++-
>  drivers/net/wireless/ath/ath11k/wmi.h         |   97 +-
>  15 files changed, 1833 insertions(+), 26 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.c
>  create mode 100644 drivers/net/wireless/ath/ath11k/cfr.h
> 
> 
> base-commit: 059ca8fd692b67a77fb89e9d4e8f57cf08e32b08

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


