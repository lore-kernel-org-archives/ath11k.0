Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A85C71141
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=viK8nl5KW+CtX+XOBfKRGMxyFp
	TXc7X1aEoWSPo8OcL5zMIalO6u9DlEBuEqIikrdpqC41aetkxdx5tQW/818KtnH/CSae2PsqvGVF1
	q/fh7U56axh6vol2IgVmmTgDthqAVq2dF5LNAVzTItZQJYhyCp1TJe1qGvjJFI7USHa16BAGvxZfC
	Q+2sg2QvsUhh5kBBPmvir3XuMyEkIFJXMdCvPDUxz+3eELQGzVkbqqHJ8flrZBChaaiH/Antp1KQ0
	XMnTCJRmTEfXwhz+Ie6GRq7MDIegWAA9wFpo0pC+M2YoFb9GrlREOu3KrPb0sYPuaYGTuhJ3b8OOX
	GyAMN+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPkp-0000000AnpO-2XE7;
	Wed, 11 Jun 2025 18:00:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMFk-0000000A4hS-1GYi
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 14:16:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEdR027173
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=; b=D5rR6Lo4tH82NjFO
	zo93parf46fMAkn3Ef8nfSo4pkKB1jWec2eL2rAceQayQMoPmusaAAPCXOOVphka
	NO4HWsiBQkmWXKsttGjMsPl8s0y1NczDz3vGOWrFbLKGiFH5kBaPrPq+8rpaXPdh
	5pTLsLgNlZu3JxrkkKKLh/5YfS1zHwCuTE40BXqW+vt22TqKeatk4Uv4gjUrRRHC
	uCYpxNlh6QvhfkoSMf37xr7grzMuWsFp5WLtd+ka4h0g5buP/1ZNr6P1hb3qpVvg
	7ZM++kv1T8HFahGUXWlSolJTUycLX5LoHVc/7qTylJKFHCtLtU5DsmsT91S9UNzK
	qXAWSQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ccvd592-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 14:16:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-235dd77d11fso56665725ad.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 07:16:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749651390; x=1750256190;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BCiQlCAClBfUESlnnsuDq8Amr/xanXzE4AY+Htc7RGo=;
        b=YA4plOyQhfMqaj8uQ81rchUPqOIEQqKIEY2mtaRsS9sVckf2N9qspdcrSWx/lR+GW5
         JwLtrmPHchUDImQ9A1OIvvk1IqtFmfL4KC/RQ15smycM9qdzQ+1nAcVvgR5LXcbwsMhH
         bO0Q4JmsvM9Qic7wVUQRV/cMNmv/ncXtTPtz9Q1vpkJYiBRCwuzWdNNkGZhxmZmzuvF4
         0LpXQf8GTds/+S6vnAVHU+GL4TKzGF2VKQFAK9rZ0kxFwx3iEgOKl3lKeBvOL2cWuVVt
         s8rROC3BEq1ji7v6Z62EgfhSr9mpgoWeLQe2hJIbokOoA12MMyZ+HtPfiXO7WF9+l1bJ
         Z99w==
X-Forwarded-Encrypted: i=1; AJvYcCWlZ6So/u2kHYfcIdT7BhpsS3IsXWdCusO3p0mUyk/+ACut3CSb2Zm/ampjs9CUF0sKST5W+JI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxqfUjzCaNt1rplLcO3O3m9NBCKhjSntH6xHzYO3Jh55YzA2h63
	FOGQMwdFtbZr/Kno7YI76zZ+HIC42apvXJ4CQ55xjW/CS3zsYHtHfIP2BPtIXDijPytd7S3M/Zr
	Ng55Bt+4VeM3CWHgcu2y1ac+jxQRTGIc2ZfnCjsdq96JXs0dHkal0xNTXQO3E69a9
X-Gm-Gg: ASbGnctSq4aBP9ljAboox3NBajwRZ/42PCM9b25kJCaFTYKsQAaOtWDWabdf5v2UJ/P
	SQA6HQ/QwLhKzwp1NmJ8rg5ZRUnv4O2gGulIum29UVmCaYq/toDkSPfFMkcBqViwhtgTZEawFZO
	pTReXEK+62vUJno0jGE3WU6oO3kXX6FUQB8UY3+vp9iHqVy8iOu5BGaWMqJiQM+b57GGqVRrE3N
	CWY6qTUly+0bgLFcUeToktd2hFljsbScalJHkShABhBZH4wZ2v9u1it1FPwqWp/xCmdYhJx6cKe
	oy09X7nc67qjdaCrAF6b7lhgrXpPyK6WO9jxPGU5GWSAONzW2aYbgoIbKpPTVuKw0J/KT1b3Z6G
	ekg==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36093405ad.33.1749651389467;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2uDBQ8igKkYBTsTg0Ikh+u0ovDEWJVCVLhqrSErAiNGtYCfNi9+9t1iCO2ygTczxCDh5jCQ==
X-Received: by 2002:a17:902:d592:b0:234:c2e7:a103 with SMTP id d9443c01a7336-23642683e35mr36092995ad.33.1749651389013;
        Wed, 11 Jun 2025 07:16:29 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603410b4csm88301575ad.212.2025.06.11.07.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 07:16:28 -0700 (PDT)
Message-ID: <2ecbedb6-401e-4023-9eff-8123e2c90c45@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 07:16:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20250608
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <6574640b-a383-4c16-bbd2-710f362ed644@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U82NoeVytrSNJ8NDk2gog6Ob4lGvUnX9
X-Authority-Analysis: v=2.4 cv=TsLmhCXh c=1 sm=1 tr=0 ts=68498fbe cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=mf2Hrz4NSIj861Bm59oA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: U82NoeVytrSNJ8NDk2gog6Ob4lGvUnX9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDExOSBTYWx0ZWRfXzQrSxgqM+ovS
 lbw8/qXqMpod/Re6e5aSkGJts27X5vYex9plsFa7HeywGaxBejEnICm/or8xkUhb/apptlgxKU9
 6EzAezNLHl0FjjaOI6IjEBpagxNqWHVUxvtuMQgwSiSZs7N/UvwPw+qegRCcOC5Yzx5XW5hnjmx
 AKpAMVyvAILoSsoktJd8j4Lcksq+FOO5lM7a+pqMnRxfzg8YQsPOe5R1jMQEiUg9oD7aeBMUi8P
 c4OCLEV1bHKQfrPIqkfoXtmk51KKff8/pUm6MpNNXHeJP2e09zzves+ZZC8qUeSB+rPMNxliZQn
 G0emBopM+DHhULJlr+gmHltybbL1SrL5lhS1z2+df0AQAApwhZ7iGhoja2MVXsB3Q4kI2+FkLHY
 XNw739+TV93RQWpey6OiYXQD2NOp2BpSGRGoz2whYdoJfXz9RXSp0VGvXsbuf9MnNKAWcE9Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_071632_342030_864F9E4A 
X-CRM114-Status: GOOD (  16.00  )
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

On 6/8/2025 10:07 AM, Jeff Johnson wrote:
> The following changes since commit 1b98f357dadd6ea613a435fbaef1a5dd7b35fd21:
> 
>   Merge tag 'net-next-6.16' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next (2025-05-28 15:24:36 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20250608
> 
> for you to fetch changes up to f3fe49dbddd73f0155a8935af47cb63693069dbe:
> 
>   wifi: ath12k: fix uaf in ath12k_core_init() (2025-06-07 07:41:50 -0700)
> 
> ----------------------------------------------------------------
> ath.git updates for v6.16-rc2
> 
> Fix a handful of both build and stability issues across multiple drivers.
> 
> ----------------------------------------------------------------
> Baochen Qiang (8):
>       wifi: ath11k: avoid burning CPU in ath11k_debugfs_fw_stats_request()
>       wifi: ath11k: don't use static variables in ath11k_debugfs_fw_stats_process()
>       wifi: ath11k: don't wait when there is no vdev started
>       wifi: ath11k: move some firmware stats related functions outside of debugfs
>       wifi: ath11k: adjust unlock sequence in ath11k_update_stats_event()
>       wifi: ath11k: move locking outside of ath11k_mac_get_fw_stats()
>       wifi: ath11k: consistently use ath11k_mac_get_fw_stats()
>       wifi: ath12k: fix GCC_GCC_PCIE_HOT_RST definition for WCN7850
> 
> Caleb Connolly (1):
>       ath10k: snoc: fix unbalanced IRQ enable in crash recovery
> 
> Jeff Johnson (1):
>       wifi: ath12k: Fix hal_reo_cmd_status kernel-doc
> 
> Loic Poulain (1):
>       wifi: ath10k: Avoid vdev delete timeout when firmware is already down
> 
> Miaoqing Pan (1):
>       wifi: ath12k: fix uaf in ath12k_core_init()
> 
> Rodrigo Gobbi (1):
>       wifi: ath11k: validate ath11k_crypto_mode on top of ath11k_core_qmi_firmware_ready
> 
> Sebastian Gottschall (1):
>       wil6210: fix support for sparrow chipsets
> 
>  drivers/net/wireless/ath/ath10k/mac.c        |  33 ++++--
>  drivers/net/wireless/ath/ath10k/snoc.c       |   4 +-
>  drivers/net/wireless/ath/ath11k/core.c       |  29 +++---
>  drivers/net/wireless/ath/ath11k/core.h       |   4 +-
>  drivers/net/wireless/ath/ath11k/debugfs.c    | 148 +++------------------------
>  drivers/net/wireless/ath/ath11k/debugfs.h    |  10 +-
>  drivers/net/wireless/ath/ath11k/mac.c        | 127 +++++++++++++++--------
>  drivers/net/wireless/ath/ath11k/mac.h        |   4 +-
>  drivers/net/wireless/ath/ath11k/wmi.c        |  49 +++++++--
>  drivers/net/wireless/ath/ath12k/core.c       |  10 +-
>  drivers/net/wireless/ath/ath12k/hal.h        |   3 +-
>  drivers/net/wireless/ath/ath12k/hw.c         |   6 ++
>  drivers/net/wireless/ath/ath12k/hw.h         |   2 +
>  drivers/net/wireless/ath/ath12k/pci.c        |   6 +-
>  drivers/net/wireless/ath/ath12k/pci.h        |   4 +-
>  drivers/net/wireless/ath/wil6210/interrupt.c |  26 +++--
>  16 files changed, 228 insertions(+), 237 deletions(-)

Johannes,
I'm accumulating some more patches for "current". It would be nice to get this
first set pulled so that I can cleanly fast-forward and apply the next set.

Thanks!
/jeff

