Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28004C54F54
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=; b=Vie9+2269rRXjMxHLmmde8eg0D
	+V8oy2ss65UQccrMUGlEcym+uUZFFtPkv7X/2/Fo+YhhtRHtrJ/ktIybqUxumvXSZ4zo1Eudk8trz
	zf1Sol1PzCxnsPah5ZkCrwavnW1cD5iv25GMmJUdcMYQk4PPulHJxwKOAWabVbd19zByk8QqPEgpz
	DL5Z67loTNy2hGLNBA9tWEBIAF6iWXyEx7xkdj7JOcT+gLpsu4LaulWc7S4vv2U1140zguvfClBpB
	Gig3XlBOMVbQb/8yA5n9ngVciZRlDHJXaAThI16MzVQe7+0T2rCHM/4RD2v0UUGOuWe+b4tQOeKvk
	E/xxxYgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiCr-0000000C0b3-2cdp;
	Fri, 31 Jul 2026 08:03:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiCp-0000000C0aS-1CL9
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:03:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V7vMR33261119
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=; b=GohOw9VZOtV2RV75
	JXiptDZ8Vgo1ykZ9OGSdjdAymeEvnmNyTXLvBQHuJekzA5VOVpuXZA934DqtveJR
	Gj+ni2LqbEdEnjyODEuFB61qnB/sTAG/eOlYMLwDcY+KRd78rRGkTxBwlhdN6VsP
	+Apv3InqZcUjxoJQHhYuoaLEL6XxCFxD4Hp/3gLG6VjTxByd2Nns+jpQIHBd0FYF
	TcmlNGt3gJ+jhHYwlM+fB6rGmgcvB7r13E7+3nsgzg3mAhpvh4oWwqUZPrNQlMij
	Xirp/+BjQV0uxAzzP+q4Ssqxyrb8y7eUSgb6EuAS6tGahGoEFEOyzoXOHxE4yP32
	22YsoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frqajr40m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:02:58 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so1124987a91.3
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785484977; x=1786089777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=;
        b=BG0sXDj4BO38iUJ9oykvBFJK42pz+cjt+tzMUkAR6wZupVa/OnEkHFc9/9kFz9C1Vz
         0kv5vvBB0t24BieDoHUiqhCKV/vzPuIkZ+KuTK+bSzY3FrTDp/VrJPO2Fu7aGakdCQfP
         ym1yTQlx7iC1njlIqnKmzLHvZ7+Md6qfeZZBAAREbqBdkgOW6Y9TeFIP8sA/x7zruvsK
         a5eBjvn6Gdr0xiIfp4u2pU2e2f+zzg3OTQ/ajQrvegcaubBAuTPinjYkpTWQyCZaA2Yg
         MPqAZOUQT+9RJ2rmEUt0u+a5HrjxUHapD6nSWS6s4Y+unNYIp9ojXU/EFwPhZo6adITd
         5eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785484977; x=1786089777;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j71HTHFsicwBuXZTYdByExT5ln5C9xVWv9Y1JZNj1l8=;
        b=Zn+ZSHtdga+wu2QbBiUhJOTUfxSuro/ucS8u9TRy5ISG24E/2rjs5ty4WT3ilEl/hw
         rjGzDOV46cklHJj5bUfuImehIqBwGBrzFcM/0wP3qB1qnLYFSO/QrJlzhAGNEPkYoEyC
         COUbxolQk3kVevH29LeS8mUIKAmnjrdweyVJ9M0LmnNedHBPusMmG55v5rDqXD1hcGGv
         8ClkjbFjR64ENEZIi2HGZKBK3t8+Yg9j6UfcGzuBZYqIrWjAEYonDrlqRK+JNI+dec+r
         WcLw5wClpKKw5bRcCIYyM+ehgUDcAq5jRQpbyDE+932Jp5O7Gv/WQbDWLGWeW0tCKXwl
         QmAg==
X-Gm-Message-State: AOJu0Yz0eXEZIEAwqFrv5CxQzr6etCIRPWik+8aAWVCJ2lBhMVdD9fp/
	YsCP+FsmaygWyAfVIIR9B0Sv5GMl8q51JmtPllrTqhS+0UmAdNZNxJhU+TRGooau1jZ8TXu9vcP
	j4Ua7uo731rDnzX2gH2tB1bDNbJJnbNjmlqULMI8bPu32l80nrGRTNOrjqaWPHApk
X-Gm-Gg: AR+sD10G75TPUNDkCgj+5BsOrNqoNSfkZdPOJ1E4v0oTL+pE7+gKJ82ctuqXOf8dQ6d
	/4ON5ol2GRaU2F6In5XNRSqPmhv/B7eKZcuVLiKumCAXh+2JDclqjHlIxHFfQ18NCvJUick+Djj
	7rnGHX1zzp37D1RoAF76NyqosTpC+IVYk7P29fnpkZ0z9EoX563ZN9ytWb/beFDxVtTlUg6znU4
	4iZItyMYQkYbjL9r8ZjfsgL+sRs4POzPNOaDR6GKjLuHJGUfw0MQfETiRWVrfY7vKqksw4wALrQ
	fJICHa2v+0m4lWSaCxalqXj74DWTxlqDBL5zX3GKLcwo5Y4JHQsw/6AJ+yzLs9ldfyPjHpBgFro
	FONABrn4QTsEAAYiq9mcF62GDmhYoaY60mTZ+Wse+AkyLUrBWa/d0USFk3GKkXlPtZ/L4rOk/6w
	==
X-Received: by 2002:a05:6a20:4324:b0:3c6:3c5b:fe55 with SMTP id adf61e73a8af0-3c91b362e6dmr931129637.52.1785484977219;
        Fri, 31 Jul 2026 01:02:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:4324:b0:3c6:3c5b:fe55 with SMTP id adf61e73a8af0-3c91b362e6dmr931087637.52.1785484976644;
        Fri, 31 Jul 2026 01:02:56 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3963daa7sm257353a12.5.2026.07.31.01.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:02:56 -0700 (PDT)
Message-ID: <f7e90024-df8e-4fad-ad42-864c092a56d2@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:02:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] wifi: ath12k: fix MLO dp_peer ID desync with firmware
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-4-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-4-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kXcg5YKmZScYgjjjJo3ZqU9oUdz92VkZ
X-Proofpoint-GUID: kXcg5YKmZScYgjjjJo3ZqU9oUdz92VkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA1NyBTYWx0ZWRfXzIHjQ7tyQ+3F
 fWUw1A/bksr1FA1DyDwWUw7j7t8YpdPOtgJvNY5m8vopPje59OoPariZtQwOiZrokBxIMAUZ8Gj
 NcwzRH9Iz4QQA49Pk9Q85EaD5nCMpqguDU+bXFLCNX4FXY/be/HrH0BazAQbJGGQdL0DOcfjBlL
 CyZDZyDCNTOZSshp9bFqT3BwkeBWS6HqHkVJeTje/hAuZGWX9+m7WhjqPyeKthHkc9ghF95SJhY
 rsZobauIroyL8FRjUng8efBxP0A/U2ocoPxxIUKgDNCfnwMq111rK2pNR1z5mZ01h13OrCa+jIT
 kSNRPrSicbL6CaY31JCFqeun9MGERljmHnuNmsH9MICKIFdFRH4b4w6J4Mw+oQsyqQCDApmZIxq
 7+C1BXNG52zXJsjECNGHWXYlfLUSWR1N12h9ipog7Zgx5JNPwVUFxTDDNiEz30SIh45YCKE7tdh
 hSL4ag0NdVSKnN25aRQ==
X-Authority-Analysis: v=2.4 cv=e7I2j6p/ c=1 sm=1 tr=0 ts=6a6c56b2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZiB7qzRtAR3mgBQmdTAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA1NyBTYWx0ZWRfX9oAHxJZSB/OJ
 u9iDwQsi+JMaQ+zMFPUOTR9akF4nsvPiiFF2EuVqMSrdReeupibQD65TX5VKMPmXS2Dr3Ze6hZs
 tWYBKO6pvZyvLPosiAOf07Cspq5ps98=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_010259_432712_96C5A575 
X-CRM114-Status: GOOD (  16.41  )
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



On 7/28/2026 12:27 AM, Jose Ignacio Tornos Martinez wrote:
> TX completions fail with:
>   "dp_tx: failed to find the peer with peer_id <N>"
> 
> where <N> is an ML peer_id (host-assigned ml_peer_id OR'd with
> ATH12K_PEER_ML_ID_VALID, BIT(13) = 0x2000). This happens because
> the firmware uses an internal monotonic counter for ML peer IDs that
> does not necessarily match the host-assigned ml_peer_id. The desync
> has been observed in normal MLO operation and is particularly
> reproducible after firmware crash recovery, where the
> create-delete-create cycle guarantees the firmware increments its
> internal counter.
> 
> Currently, ath12k_dp_peer_create() stores the host-assigned
> ml_peer_id (with ATH12K_PEER_ML_ID_VALID OR'd in) as dp_peer->peer_id
> and immediately populates the dp_peers[] RCU lookup table at that
> index. When the firmware later uses a different peer_id in its data
> path descriptors, ath12k_dp_peer_find_by_peerid() looks up the wrong
> index and returns NULL, causing the "failed to find peer" error on
> every TX completion.
> 
> Fix this by initializing dp_peer->peer_id to ATH12K_DP_PEER_ID_INVALID
> for MLO peers at creation time, deferring the dp_peers[] RCU table
> population. When ath12k_dp_peer_find_by_peerid() encounters a lookup
> miss for an ML peer_id (one with ATH12K_PEER_ML_ID_VALID set), it
> walks dp_peers_list for an MLO peer whose peer_id is still INVALID,
> syncs peer_id from the firmware's actual value, and populates the
> dp_peers[] table. This lazy sync approach ensures the host always uses
> the firmware's real ML peer_id regardless of any internal firmware
> counter behavior.
> 
> Guard the dp_peers[] RCU table clear in ath12k_dp_peer_delete() and
> ath12k_mac_dp_peer_cleanup() against ATH12K_DP_PEER_ID_INVALID to
> avoid clearing uninitialized slots. Replace per-peer clear_bit() with
> bitmap_zero() in ath12k_mac_dp_peer_cleanup() to avoid out-of-bounds
> access when peer_id has not been synced yet.
> 

this is a known issue and has been fixed by [1], and that fix has landed in ath.git [2], please try.

[1] https://lore.kernel.org/ath12k/20260720-ath12k-fw-allocated-ml-peer-id-v2-0-630632758a80@oss.qualcomm.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/


