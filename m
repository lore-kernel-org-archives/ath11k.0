Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379CDCA9ED1
	for <ath11k@archiver.kernel.org>; Mon, 12 Oct 2026 13:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=; b=k7/Yu1iyPsHGZKiSGghHtR5b36
	PGnwpvBWKgEtdN3mHVzeoV58yJdnbKZNtJSZcxO1PUsLy158ToDMDr37myqRf6BW8KV+HArM/XPhC
	WdIEkDJ8M9oCnB72LXElb16Edu4lbvbqk/QLaisNFwaCuvutbCq8b6EVftwHdRBMMoDVGIVwoaq6o
	aTxPTnCXetLzdulnQ5v9AgkuaZHqFz7DbLZi2LzvFoujMQCec04er40chbgmQtO3giApMnLC0xaPx
	vUhilVS3OBcJ8O0Q1VdBY2cmFGRWIQSThnccq/RKgFUGCd5tp8UOFD4d0ui1QM/S+nCnp73wz7OuW
	7prWZ5Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG7D-0000000AZqH-2StO;
	Mon, 12 Oct 2026 13:30:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGG75-0000000AZm1-2xLJ
	for ath11k@lists.infradead.org;
	Mon, 12 Oct 2026 13:30:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC03U22786771
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 13:30:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=; b=VR2ouf4cUZVIQt51
	rQ0Gk3U7np8d4hWDD9HCz81ABtp9bj6+iNzJY9G719oy62dxzwFuvWaPKuzktJbh
	8i36bQ2v2uwvFp3ydMT43bSnS3yA13MrvYlvV8VWjUp4clORHe6w2+bHFQ6KzDVJ
	1m3G904t0QMMd+5OLM3pexrr/xAndtKCxyoDMimRpRPktYgadljnVsCFT7l7iAEe
	ZNVk5GQxEOnfjpOGdqjo577p2vKhhg0Fnk+2sSDAxx26RYdYVX+xKRneN8FvoCV4
	XHEsHgKeyxsWnpVpBeMlZM/Al108UV77sLS3vo4fUn4KtNNZQ3wTtLCX5q/p+ZZC
	1a1ndg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wffgvxp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 13:30:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so5645562eec.1
        for <ath11k@lists.infradead.org>; Mon, 12 Oct 2026 06:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811846; x=1792416646; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=egqs0wSt7eFn4X68bEEj3g0b3+viA4W94pm87muPvDMHfVk9Zu7HrYi4qF/MJWfN6y
         dElnefw2BMJxaj2g7uxTVlLSmz8Sqm7Z6KyP1WOJDWK+AtaZtzZwrLUScHvfO1viRf9S
         94MAvEsYQfLpVq2+wJSKQvcIZMVtG4ARy2O3r9Cqgr6lx1sOjzOMQyzsmg0E8CSfJMa2
         MMm3LErpX7ibSizxGvBRBQXNSvBMgO55Xwvxi5EkQTyBO3G9uaz3YLUYF+lA77fectIq
         JvOGGFutW7dgmHtB7KNJLm39Dn0qLyYWG53S7PG0FBnlXstRuNx8XZA83J6IPMzsJMb6
         BAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811846; x=1792416646;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vOV14bDhvBuotOkbBoK+dGZoQ3QXXV9MIM12bAdQJsc=;
        b=YQxPjJIKO+Qv5HkYvcvL4yRtaRbOSFdd5a9NsCcixGIjvKNoADt9dJlGNwtUgsbdNO
         x1eO3cJPvVRnVDEgAajFwabl83uSQRD3M20L2KkJn3KykmLamiDBilyKJqwv2qKxP6VS
         ygu7QZO3kESTaG6ozeuZMLt9a0wcl5HiVApzXCxozZ5zJphfG6QVTGZJb9IhJrv5cwTt
         merUAFIk4to/Y3R3Dp8TFvfhMXnacdOJsTaOJQnfffuXxTTq++crXLQuGdgynug60QY/
         6etSlXWzLhOM6LO9WANhry521FlruCdlqD1TeApzMgLixvbnOsPk3x6PbXFabORLJYwf
         QRHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwNDccAlfi9ZM8EkAkGaD20bR5VainJW5nFJM1+gNJP8nHMehGAq3RzPYuFKWRseUoWuCXxv6Q=@lists.infradead.org
X-Gm-Message-State: AFq9FYIcn6IlL8Gs8Wsjms1igceU/cEHG3xTa0EsL/VTOrXaZYN/nqYi
	P7zXIIRcufaBmA06y2qP4s44ABzaI1jXa/V9LzJIEoI8gK2sjtPb7qtT8l682MyeQedowG5v7WL
	S72Pc6KFJbiP4dDwb9xx8bkygXxP8CDsW32ZXNr5WDuvrhAqKZIF40lf0JXDimZQm
X-Gm-Gg: AYBFou1r8Tz8ywMGzWx5eLN5v4vvs5NJGITFvxMmMFVmtKMRF0FLfN2XQPjyagMVjv0
	0OX8FBRS41jgS0xQsCKKYv7INXVKRuxlT/Okp1DBt1kHroFY+4SLJdLT5WHP4/MZUNB6f9IAjbE
	MzhUDGFi/Mp+t3zCWHVOKLa/7NP3mw3jXgfZ78pw0IBQHqFB2uWrTWRKL4SMv6HKDti+iPXD6Xf
	UXYO76q4ZRYordpZGJw9kqQoYed+/kX1KhxRdgKfvXIfoF43PSV3jOA/V2IoRYcOhdyV3b5npJt
	h1cCzKC4GJ3bnLFuB9UGAj2XA/FbxBc+BM+4bOx82kWfKv0Oqdd0pQ/EFhMHEN/yu/V++XMZtVW
	FHUNuXOmuHLo4VxPaYg0V/nOm9qfDL4NHZWu1qCTfJkg7I0MZ/SFhLTHBcmZu
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590164eec.33.1791811845468;
        Mon, 12 Oct 2026 06:30:45 -0700 (PDT)
X-Received: by 2002:a05:693c:80db:b0:353:5d25:1de7 with SMTP id 5a478bee46e88-3537e0abb18mr15590058eec.33.1791811844129;
        Mon, 12 Oct 2026 06:30:44 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44711556eec.9.2026.10.12.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:30:43 -0700 (PDT)
Message-ID: <92649385-8437-4391-a233-bdb59cc600c6@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 06:30:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Kalle Valo <kvalo@qca.qualcomm.com>,
        Michal Kazior
 <michal.kazior@tieto.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        Bhagavathi Perumal S <bperumal@codeaurora.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>,
        Carl Huang <quic_cjhuang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Wen Gong <quic_wgong@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
 <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <3c6a641e-9695-4e48-a5f2-4911d0ba8048@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXxeJE8ocghB/7
 YvpOZ+V/xlOBtgE73na7Qrd0eT48YrZduSVUucQ95HyjYPJEI2Hc8KiNUajbH0EPGmXPUcqqTVn
 ipNdxuOSrbVLbW6Z2DNtVMihWBbgNNbfaQgM2RBTPl40kPsczRP/2u5TMnKMzOQd/B19IzYAYqj
 gc9dozabYQYGM2EX1ynHKL0BaQT2S+6wJg0GvQGJE0OTLnFG7aSTp7k8p7FG1MbdhJbqbNd+fHP
 WF1qYWX1IaZkwZa59jKA66YvDDQh3qVWrY2pQtENbC+Y7NcJFi9LCFBNPHVtl3S/ulHpLlEVXML
 4OKQsyHQCoTIJm5Z/BCTtP/K5llhRIz0Iw2JXd5sEFC67om9UYSc3FUs/ut6ioWchL5/o98IiCW
 YN1E1xphZF9Egsu62JQ6kxOApV11erXWtCF/WtjAcUp5MYFjg5k3+MBrzyhR3ICOEPoJ+18UXVr
 PvYuyH9VwVRAl2GEqdg==
X-Proofpoint-GUID: mn0eVcs6BRXrGgwB7dNrvdWKzubEh9U0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX7RZihCZi9vi3
 Q/elaxqn46VBby9yV1kmDmVK0QVAT8G0H65+KQePQAFXhZ7s1tFyGBjps6Se2qAWZsVscDGNftS
 ZeTzrjmScBGTswg2YPFF5Fk3R//gP6k=
X-Authority-Analysis: v=2.4 cv=ZcWIpcVA c=1 sm=1 tr=0 ts=6acce106 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=b8Ip5u2rk5lctkbpsk0A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: mn0eVcs6BRXrGgwB7dNrvdWKzubEh9U0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_063048_621621_A140BFB5 
X-CRM114-Status: GOOD (  14.90  )
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

On 10/11/2026 10:52 PM, Baochen Qiang wrote:
> 
> 
> On 10/3/2026 5:20 PM, Jiale Yao wrote:
>> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
>> the current entry. idr_for_each() retains radix-tree iterator state across
>> the callback, so that removal can invalidate the walk.
>>
>> Use idr_for_each_entry() in each cleanup path. It performs a fresh
>> idr_get_next() lookup for every iteration, allowing the current entry to
>> be removed safely before its skb is released. Keeping the existing locked
>> removal helpers also ensures that a concurrent TX completion cannot find
>> an IDR entry which points to an already freed skb.
>>
>> Changes in v2:
>> - Rework the ath11k and ath12k pending management TX cleanup patches to
>>   remove each IDR entry before freeing its skb, as pointed out by
>>   Rameshkumar and Jeff.
>> - Use idr_for_each_entry() for the pending cleanup callers instead of
>>   leaving freed skb pointers in the IDR until idr_destroy().
>>
>> Jiale Yao (5):
>>   wifi: ath10k: avoid IDR mutation during TX cleanup
>>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
>>
>>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>>  7 files changed, 44 insertions(+), 39 deletions(-)
>>
> 
> if you want to go with current state, leaving the UAF risk in patches 2/5 and 3/5 in a
> separate future fix:
> 
> Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

Since the UAF potential is pre-existing, let's fix that separately.
So this series fixes the IDR mutation and another fixes the possible skb UAF.

/jeff

