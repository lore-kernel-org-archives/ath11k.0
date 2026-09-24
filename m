Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3777C98310
	for <ath11k@archiver.kernel.org>; Thu, 24 Sep 2026 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=; b=lnMw14r9cN0IXl0nORR9KBHnPu
	nJxb1nG5ffEjLZmt6mwUnlHUErXjp6IosSUq3nF7COT478+DVIYBZTKIQapSruDMS29GT0A+SDNbd
	h7QPTFoh8EHetPi6TNXcGl3+TiPrfn7kY2XX+zICMezaD652B/G4oZA1h++HoRRRmUOQ0XdfAyLsQ
	8i0Vum76+PZnOqDpN6kcY1VkSzMtQbjd16yywihAKOFpuafs+Kifgn6GYAP13CULnNWqPQz320eRz
	oiKv8k057JJ1j3tUdGLtgjd3n/Dma6TDEmJM4kENMyryJkj+yb8KVLVy3UZHbg59sNrMqIIHqoG9K
	fnRq9PYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dty-0000000AIEV-3Hzb;
	Thu, 24 Sep 2026 07:29:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dtv-0000000AIDq-2lVU
	for ath11k@lists.infradead.org;
	Thu, 24 Sep 2026 07:29:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eB1Q4147331
	for <ath11k@lists.infradead.org>; Thu, 24 Sep 2026 07:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=; b=cFmHdydCAZ9ftuWs
	fMiYEI6fLM/zJ7VOGtX5zHCBlh1ZAwk1nQxZpzkyhNont0eYdJxRkx2nT6DsWnmU
	RuyJOlZKqmEKxA7XLxQYTXIeHn+B4PMjgFje/pf6VgIiughPK4wjgFbeYjqLxRgK
	XL9R2RTV6g8cDi7rgf4t+ufD5G4y5lm9jmtdDtIXWKf6hQQACQ3vCKuVsWSIvenE
	EScptT3qdT/e/zvhyUu2bhf8kM9Z6LroXXrwAH57gWUEUtJh9LhHWSb2iWZ3DkBu
	RKWilnUgB+0M/H5cgmC3Gm+nvJvIRTkPd3oxcnRWZChaw2dv/H7kzq5XWNvRWH3g
	c/uVog==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjv3v32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 24 Sep 2026 07:29:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39512608fb1so2741010a91.1
        for <ath11k@lists.infradead.org>; Thu, 24 Sep 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790234990; x=1790839790; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=;
        b=OreX7NXG1gmQ/VJaF+VnEldf/1V7e+sbyt1tFaSuVa90MhROCMC6a4IIJehIDkpuqO
         HLpAkBy0QMUAx9HVh6UCaAmKUqYPrUE44QMqdOWWeqo7C4tJPuPmrG00j8Z6chfhNDRh
         AK3QmEXxPDG5uYDVLWWYp6+J6U+Wsfxv1ZaY5gsueFKqJzB6c60Q9TNJapEv5vYBCOeA
         s+Y6pLQoLwFwJI436ViABJbghpbgZGHV4gVxB63olqjI+ysFyEl5mx/ZmWvdgvKy3tVw
         Dc8bG/1hq/9EBbcZD6lFUbQE4wVQIh1eiUKi7dF99pibZej8Pl1vbp0bfDkIsQMINIRY
         SiWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790234990; x=1790839790;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZpJd58Xrea1rr2Xd+B0/MS6diNyFofiT/eXYkhyMs8=;
        b=MUtT30ECR6YxHXOeD/nIuhOefRftYVxmnDloYIZCT9OJofxTx5zk1To5Fqg5pIcINv
         zTQ3G+MH/b3uzwnXLXl4EjZE4MnTG8WJQs03gMgM/7+9ybbJNPGu+b2hx8YEpTsqYOZR
         zAf2kY4Q15DdpYCORcjX6KQbnl8ePFp7KhLa+kOdu9+tZ5QqGnH3hVbpWvMCe56IgB3d
         q05nnz8SDIwzols9G9561cCrLy5g5jteQN/2+fmJIoFuyUEJX2cZ66pQyQ8qa35e74cC
         fITFfdYtk+m6+RykvMo0/HsqsSF5V+sutZd1dYZi+1V21q67wVWIFV0QLLt9W64bGCdk
         2dWA==
X-Forwarded-Encrypted: i=1; AKwUvBwSmbW90GscxsKNSUkmrMxnQDVXPfZY1Iy7Hg5q81T//ktGmrKp10Iyj1WJ01m70N8XijIY3fc=@lists.infradead.org
X-Gm-Message-State: AFuF++k2OP+1vqM6cW7i3l+kL6R0Fz/3ZFwMPY94dtaOBU3cYu0ZSV0r
	FURKhO7Bl/hVsnAAiEgp6S3lXbVz/VS5gwDMq9OEkoYFwoc/gU5H8Lc/8RnPC819R/LCsXglyNQ
	zlSVjnVnPZdBjfkQhGj/blB2luWoIXV40r6u6RVhOuyo+nQ/Ny1GqDY8oI9e0CQ9Z
X-Gm-Gg: AYBFou2vzoPm1XtUCHfqhZIXQOdREq/fHhsNNLK8Aq+Gv+VVQMydmggymZnCgaZqD/Z
	ij5SdGKi9yZ1eJsYZEDdeqLWKVznE4QQfE3D+fD8jlh/sWIbWzaGyIi9KseC85MugJ/UbjYHfXY
	d07C4/zd9Qawo3Oj0h4Au7lGuRvwMI8lSwPVVdyoRbDDPUbXJgUWGE8REegcp49uFdk9HJPX5/A
	1IWPDWVXh1GT6yZd0ZhGzhuXfnPFr48LG31j6jn5F85eCfAlyJ6F9pVyMEFEHMYtZbyshkSrbh1
	fYPjrmutu3iC35CUMciSunkWB9FMqysqSb8PIRBDPxTHKGpJljp4qmJ0SXORjFAC91AL1zqeORY
	RNBYhuQGNHicYy4sd67hs4HIqEGytj0Asy3W+UrEc5R4Bae2TO+haoOXNk5WMSW1W8c/uxZFN
X-Received: by 2002:a17:90a:1090:b0:3a0:9c23:4d67 with SMTP id 98e67ed59e1d1-3a09c23506bmr802198a91.66.1790234990314;
        Thu, 24 Sep 2026 00:29:50 -0700 (PDT)
X-Received: by 2002:a17:90a:1090:b0:3a0:9c23:4d67 with SMTP id 98e67ed59e1d1-3a09c23506bmr802191a91.66.1790234989718;
        Thu, 24 Sep 2026 00:29:49 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5c4sm3137575a91.5.2026.09.24.00.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 00:29:49 -0700 (PDT)
Message-ID: <9d8307ee-e9bd-4538-92f8-b33410caecae@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:29:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: release peer accounting on peer delete
 timeout
To: Michael Pfeifroth <micpf@westermo.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfX0JJEeFTAjMYy
 LXqGsJImNzUbEiBEsCF1cyQQR/EiTZfOR+kFrc1bcC9NwWJ9kRgUsT5Y+MZMqPQ1D3xjXXSH+nj
 wuHy5fZ83LHzVBEJZjeVSqpGAY0WDZ2wRmYRdAH+WuChYRxs5aEloQV+V1UuhJ7P8GqGXJhu7ut
 ChioQLfSFX+vOsqzsMvISDcoYltXbKJt1i8aPoM3e3XGV6T7u3AtBGU9n2vBp4D1QIEctDMOiL0
 BoORDO13yXuBbMtvPSgq6xxrUYPM/bKt6FNLGDA+O4dY4j7Kae4efw6WYqPfB8N+ZrkgzUR4Al5
 z9bZVgCDoPVb5xI0mfyAwV7/t6VlogtH6crfVPoefwhF22Eh6LnUxVDTsT4fRPjINp4EJNiVanM
 yKMF7/5OvDqhWBocQlndRK34IliZdbC8n+TTY9nEwttV6LIYylUEXMtz7VfdUGwbOBy29DQWHnk
 HoqGYpybDiSu3HUHhXw==
X-Authority-Analysis: v=2.4 cv=aIxlOr9m c=1 sm=1 tr=0 ts=6ab4d16f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=oZ_nePzMtAqFXnzSB4YA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: OI6oLPPg3C0ivVVUsc0bHLQ7eMPMJDxW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzMSBTYWx0ZWRfXwh1qwCCD7VyZ
 96mjLMpM1z0mgALPJSI77vVhD7/RhqZZ1YW0b+5HEE21yTlAACQQXu5CwMf5KCBMHvJ5MT6zU9V
 ktaJ1qMzemo3u2XelC5ghO5uuH6PNJ4=
X-Proofpoint-ORIG-GUID: OI6oLPPg3C0ivVVUsc0bHLQ7eMPMJDxW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_002951_706933_2AB47FCB 
X-CRM114-Status: GOOD (  29.43  )
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



On 9/22/2026 8:25 PM, Michael Pfeifroth wrote:
> On some deployments access points intermittently stop accepting new
> station associations after several hours of uptime with frequent
> roaming/reconnects. The kernel logs
> 
>   ath11k_pci ....: failed to create peer due to insufficient peer entry resource in firmware
> 
> and hostapd reports "Could not add STA to kernel driver". A "wifi
> down/up" (radio restart) on the affected radio restores service.
> 
> Despite the message text, this is not a firmware peer-table exhaustion.
> The message is emitted by the driver-side gate in ath11k_peer_create():
> 
> 	if (ar->num_peers > (ar->max_num_peers - 1))
> 
> i.e. the driver's own ar->num_peers accounting has leaked and reached
> the ceiling. It is always preceded by a peer-delete that timed out:
> 
>   ath11k_pci ....: invalid vdev id in peer delete resp ev 1
>   ath11k_pci ....: Timeout in receiving peer delete response
>   ath11k_pci ....: failed to delete peer vdev_id .. addr .. ret -110
> 
> On such a timeout __ath11k_peer_delete() returns early without removing
> the local peer object, and ath11k_peer_delete() consequently skips the
> ar->num_peers-- decrement (it only runs on the success path). The normal
> free happens asynchronously in ath11k_peer_unmap_event(), which never

Hmm, I don't think so. host waits for peer unmap event in ath11k_wait_for_peer_deleted(),
before waiting for peer delete response. Since there is no "failed wait for peer deleted"
log, unmap event is good and ath11k_peer_unmap_event() runs.

> runs when the delete response is lost or misrouted (e.g. because the

what does 'misrouted' mean?

> vdev is already gone by the time the response is processed, hence the

I have never seen it, but yeas it can happen theoretically.

> "invalid vdev id in peer delete resp ev" warning). Each timed-out delete
> therefore leaks one ar->num_peers slot until max_num_peers is reached
> and all further ath11k_peer_create() calls fail.
> 
> Free the local peer on the timeout path and return success so that
> ath11k_peer_delete() releases the num_peers slot. The peer has already
> been removed from the rhash earlier in __ath11k_peer_delete(), so only
> the list removal and free remain, mirroring ath11k_peer_unmap_event().
> A late unmap event will then simply fail to find the peer id and log a
> harmless warning instead of touching freed memory.

As stated above peer unmap is good hence peer is already freed there. The code here frees
peer only when it indeed not freed.

> 
> The problem was reproduced deterministically with a fault-injection

curious what the patch does? does it modify ath11k codebase?

> patch that forces the peer-delete wait to time out: after max_num_peers
> such deletes the AP permanently rejects new stations, and with this
> change it keeps accepting them.
> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Cc: stable@vger.kernel.org
> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>
> ---
>  drivers/net/wireless/ath/ath11k/peer.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b30a906..ed2d7d8 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -341,8 +341,20 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  	}
>  
>  	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		/* The firmware delete confirmation was lost; free the local

ath11k now follows networking subsystem comment style and it prefers a '/*' by itself on
the first line.

> +		 * peer here (already removed from the rhash above) so that
> +		 * ath11k_peer_delete() releases the ar->num_peers slot instead
> +		 * of leaking it.

the comment needs rephrase to reflect that peer delete needed only when it not freed yet.
> +		 */
> +		spin_lock_bh(&ab->base_lock);
> +		peer = ath11k_peer_find(ab, vdev_id, addr);
> +		if (peer) {
> +			list_del(&peer->list);
> +			kfree(peer);
> +		}
> +		spin_unlock_bh(&ab->base_lock);
> +	}
>  
>  	return 0;
>  }


