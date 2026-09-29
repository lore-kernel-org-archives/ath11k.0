Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC3CCA5FA1
	for <ath11k@archiver.kernel.org>; Tue, 29 Sep 2026 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsfWSASI7pHCuHAaBzrLs2MOHQ5m4idxUR0nJeO1FRE=; b=rwDkz62aIiLsT0sq/T7aXlILyw
	O72yCEAH/kxL7t839HXveuy0SUM43DLqxmBuIx6D4SQpKlCu8tYVbkDgSYQ/YHLGsBTbtrACTOh4D
	JQTYCFN+caUZWzAXqfkITD3d3kR/c0JekWcc1fSndjrU18/yR2sUBUvAkdFR/zvMKmNTgyFDvDY/V
	hxHkzjMe3xGF2ac4pTow7kbNLikdEb22Ul5ZDnYJWv2/f/8lDDExCRV/HRhBzQktRAfo5xsrkYRqL
	VCh786duLvHmXahe/c4PB0NtrMJcDKBSKGbdxyoHaYU5E1mfJca2v6iP6udiwdOowNtBiQqFmFNzt
	nYdlDedg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRBE-00000002R73-48AG;
	Tue, 29 Sep 2026 06:19:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRBC-00000002R6i-2rZN
	for ath11k@lists.infradead.org;
	Tue, 29 Sep 2026 06:19:07 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Nvl3891450
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 06:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nsfWSASI7pHCuHAaBzrLs2MOHQ5m4idxUR0nJeO1FRE=; b=TzGXeELCp0T303qK
	jr0zkA7jjpxQGZgHUZ9IKu5RcPMIAI7LMU2+xhgvv+yx/vVmvC6fguDYrQEzyM5D
	Caxq211k6nuQDued1tnj5yDToB/fDireLDjfqxND9wJhG4KL3uHd5sCduXYjOvIc
	137sbECpggMv7i/WTUc/qjHHmBrv+SdiWEk+nVPDSYEc1Fcqz1jSwE+J4B5NxLkZ
	hZkYG9QW/eay2xT3PZOh8gxny72RbFwweWap/9dc0BKfdP6NVJSEVQOATG3JKNv1
	8s7ZPsNJvhJ6CkgnT6Roam9saSkBdNpmnY5kU/EDxqdJJ+3NAuYsGjE5LCyGWpgf
	cVNXxA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gynfkvfwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 29 Sep 2026 06:19:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2df5a65671eso6448925ad.1
        for <ath11k@lists.infradead.org>; Mon, 28 Sep 2026 23:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790662744; x=1791267544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nsfWSASI7pHCuHAaBzrLs2MOHQ5m4idxUR0nJeO1FRE=;
        b=OCpGDKC1CfNhzQA7oHSW+w8inE1OgBg24wNV2pYqJmzCjK25xVGd41jsymeznE+HJZ
         PvFDeo8OiMxAxINXbG5Ouhh+Zd4hIGO3F4JuyxQ3HqAkGOkMYAdM3wtUsbEzFgqprHHS
         R9e2bfMNzBwFU90W8hdi+4Xy2/3579I70knku15AR6R5PiAWXwgF59ZbIFt8x26EJvy+
         SiT1weupaeEgiaxk2R87+skWtPWYdGbL4J1V/Z0SOa7WrDtHR/6r6h6bNSixLEgOVp0F
         jqn1s6f1EGeMqNJ/uocreq2QV2pB+K7mV1u+m3mc+WaEw8fS62ypRTXkYxkT01pXPMLx
         UxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662744; x=1791267544;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nsfWSASI7pHCuHAaBzrLs2MOHQ5m4idxUR0nJeO1FRE=;
        b=RiGFZJCFGH5b8D7OvVYQo3KC2JzoIVhEyoePhzoPQvrTAoJ+hjb1IvX6YeXPj4QGot
         lPDUlvvEcChPsHx0Wo7NX+unjTJo7ATbq3HpU0PGQvmxCsej2p7fPJzypuKPJUELyKZd
         itPJpg8ovi25BUwzUk0+526FXZlx+ZJU3xyja1Icu8nn6ytq9bLRUYAbwYF/MdBTaI+6
         BHuaoLwdrFv8LmQ7CB+Sd/EnzU11Uirh5PBMQfLvTD8kvuKi9bOBp/9CRyykQbSdHRxA
         XhAjBIVaWC++RZPY78djGwij24wRnpbciVz1xoqHSpxvwihsbQUvDIzz8tjL0AYJHrNS
         Zqyg==
X-Forwarded-Encrypted: i=1; AKwUvBze3767Hu4BATs6jbH46ABgzVzKo11pYz2AHdDQgA8ulyt5lXniZJp+vcVuZaAAd7QIq7++s0w=@lists.infradead.org
X-Gm-Message-State: AFq9FYLoqvGaqXDLzC+8mARGUmRaOUJ1e49/2Oe2kjmkDadH2nCDAHya
	8SLoXT2IyVBNmXDqb4subcGGKFa+0eIoG6C2x6HVwiVyLuEmPqj135nCwZ3Wp5eKgeJ8/+0S/Q6
	nFK0Y80dokTMMU4hXil7ie0nCgCVw4kINY2goMHF8fT52P/xCh+BMsHK3i+btV1bF
X-Gm-Gg: AYBFou1ewml48nB74hkOD9WMDtUWFqu7g7CUK4tHFr/jPd43CXQUBiDrXqQSGeozRHY
	cwytEJI41p+ymkM81H9DXg6T/VDI4E6amgg2yBxgouAD4pfsdb7RctrGcsL4YjZTI919iooyXgs
	odpzJBuU5kQqTAxisDa5x0JFWLA7JcGdE3oTtcbLwJT2pVh5bXdgaNKJSeAWVPPpqUzILer0kX2
	Ib3IO4d2tAtKyrMuL83mzNsW9u4aIaGho864gLdHp9wdsNxXRbwvEy8lOyScsgQU5vVBgd5sURX
	7nscJe/RyzacpE9DVlzMOgUj1JVvfE36IZVnS0HFmsOzKpAPNKJQhE30gDS+a0t7VFAMPrQpt4X
	YJn5ehoEJ+qJdp16ynKu4NWoE3gdLzfmjp2bedxsxGBrov+fDgTGH41R4/oWnjZ0ZPCYD6jk=
X-Received: by 2002:a17:903:4b04:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2e2c497f98bmr9298705ad.24.1790662744350;
        Mon, 28 Sep 2026 23:19:04 -0700 (PDT)
X-Received: by 2002:a17:903:4b04:b0:2dd:ad7d:72e1 with SMTP id d9443c01a7336-2e2c497f98bmr9298555ad.24.1790662743790;
        Mon, 28 Sep 2026 23:19:03 -0700 (PDT)
Received: from [10.133.33.76] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9145b773sm51231545ad.69.2026.09.28.23.19.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:19:03 -0700 (PDT)
Message-ID: <8bc3eaa1-7233-48db-a41b-ce3f08fbdd15@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:19:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath11k: release peer accounting on peer delete
 timeout
To: Michael Pfeifroth <micpf@westermo.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <arJzxQcf4intXBqS@mpf-ESPRIMO-P9012>
 <9d8307ee-e9bd-4538-92f8-b33410caecae@oss.qualcomm.com>
 <arTp/9A0iMNpIhl2@mpf-ESPRIMO-P9012>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <arTp/9A0iMNpIhl2@mpf-ESPRIMO-P9012>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfX27UfJGiMzTNW
 9szTEpWGvrDjKaNHhdoVeZV77Rv/G8YzVG8/Z2fDmy8vVRJk1mERaqvS8MyDChWW3XgqWlr40BK
 wM+nz27SRD2aDCjXlndmAf+WD1nBfy2CLmNjtdxXC8a4nZrEuRguJbGu8uJnBCns8xNoG7VUhuo
 IuwWcDtq3Qp4RFbcCsOv+O/aDbH+KIXypbXjR+G+4Q6oEBd3YPR7niE83x9MOFsOho0e1UkkZpq
 hPzNsl6oV7rjDLGRE70z2HlnB3hJmYJPZCcy1iDKWGYQHEFrCXSk3W//OS14ScysQ9SDuFReR9W
 XFeNtvQmqvjLjby4/aG5apMC7RfpFA3m6LNfItBVDaBwcGktOW9WMAu0/E8qfLb90aMhlSTmCIA
 p9uR2kJYvSgWWqxvWSN4mLnrgpraodoxeCsG6OixxDEFTptA4+eI9Ru38gVOJJmOXK/nOIeWOwR
 UUXvTCH+TDWKJvlCPeQ==
X-Authority-Analysis: v=2.4 cv=e6aT2qp/ c=1 sm=1 tr=0 ts=6abb5859 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=N9GNhs4bAAAA:8 a=aScLlBn_rR9kq3WGfpkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-GUID: Aw0POs59YBnasZZQgNq5hYdEe2LibIOI
X-Proofpoint-ORIG-GUID: Aw0POs59YBnasZZQgNq5hYdEe2LibIOI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNSBTYWx0ZWRfXweJETKOV0Wjv
 U2NxS4iBni1Qj3E5Beiw/O3Sy/t7ZmByOE+T1qHf5NxqhATPuAmWGMG7LwwWPo/nuW9M12/3ESq
 piLevaXqkPx0DZb0OGXzZ2tR6cp7ERY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_231906_869520_678A5B5F 
X-CRM114-Status: GOOD (  40.88  )
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



On 9/24/2026 5:14 PM, Michael Pfeifroth wrote:
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
> ath11k_peer_delete() only decrements ar->num_peers when
> __ath11k_peer_delete() returns 0. On a delete timeout
> __ath11k_peer_delete() returns -ETIMEDOUT, so the decrement is skipped
> and one num_peers slot is leaked per event. After max_num_peers such
> timeouts ath11k_peer_create() rejects every new station until the radio
> is restarted.
> 
> In the observed case the peer-unmap event is received normally (there is
> no "failed wait for peer deleted" log), so ath11k_peer_unmap_event() has
> already removed the peer from ab->peers and freed it; only the num_peers
> counter is left wrong. The delete-response completion is missed because
> the response event is dropped in ath11k_peer_delete_resp_event() when
> ath11k_mac_get_ar_by_vdev_id() cannot resolve the vdev ("invalid vdev id
> in peer delete resp ev"), so ar->peer_delete_done is never signalled and
> the second wait in ath11k_wait_for_peer_delete_done() times out.
> 
> Return success from __ath11k_peer_delete() on the timeout path so that
> ath11k_peer_delete() releases the num_peers slot. As a safety net also
> drop the local peer if it is still on the list; that only happens in the
> other timeout case, where ath11k_wait_for_peer_deleted() itself timed out
> and no unmap event removed the peer. The peer has already been removed
> from the rhash earlier in __ath11k_peer_delete(), so only the list
> removal and free remain, mirroring ath11k_peer_unmap_event(). A late
> unmap event would then simply fail to find the peer id and log a harmless
> warning instead of touching freed memory.
> 
> The problem was reproduced deterministically with an out-of-tree debug
> patch that adds module parameters to force
> ath11k_wait_for_peer_delete_done() to return -ETIMEDOUT and to cap
> max_num_peers: after max_num_peers such deletes the AP permanently
> rejects new stations, and with this change it keeps accepting them.

though the last paragraph explicitly says the issue is artificial, most of the commit
message still reads like a real world bug ...

I think it would be better to rephrase as something like 'Theoretically, if peer unmap
event is good but peer delete fails ...'

> 
> Fixes: 690ace20ff79 ("ath11k: peer delete synchronization with firmware")
> Cc: stable@vger.kernel.org

I don't think it qualifies for stable backport since it is not a real world issue.

> Signed-off-by: Michael Pfeifroth <micpf@westermo.com>
> ---
> v2:
>  - Correct the root-cause description: the peer-unmap event is received
>    normally, so the peer is already freed; only the num_peers counter
>    leaks (Baochen Qiang).
>  - Explain that the missed delete-response completion is due to the event
>    being dropped on an unresolved vdev id, replacing the vague
>    "misrouted" wording.
>  - Rework the code comment and switch to netdev comment style.
>  drivers/net/wireless/ath/ath11k/peer.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/peer.c b/drivers/net/wireless/ath/ath11k/peer.c
> index b30a906..f93a8da 100644
> --- a/drivers/net/wireless/ath/ath11k/peer.c
> +++ b/drivers/net/wireless/ath/ath11k/peer.c
> @@ -341,8 +341,21 @@ static int __ath11k_peer_delete(struct ath11k *ar, u32 vdev_id, const u8 *addr)
>  	}
>  
>  	ret = ath11k_wait_for_peer_delete_done(ar, vdev_id, addr);
> -	if (ret)
> -		return ret;
> +	if (ret) {
> +		/*
> +		 * The delete timed out. The peer is normally already freed by
> +		 * the unmap event; drop it here only if it is still on the
> +		 * list. Either way return success so that ath11k_peer_delete()
> +		 * releases the num_peers slot instead of leaking it.
> +		 */
> +		spin_lock_bh(&ab->base_lock);
> +		peer = ath11k_peer_find(ab, vdev_id, addr);
> +		if (peer) {
> +			list_del(&peer->list);
> +			kfree(peer);
> +		}
> +		spin_unlock_bh(&ab->base_lock);

except for the firmware crash case, this is exactly what is done in
ath11k_wait_for_peer_deleted(), so if that function succeeds the peer is definitely
removed and freed already, so this is actually dead code.

as for the crash case, all peers are cleaned up in recovery path so we don't need to do
remove/free as well.

> +	}
>  
>  	return 0;
>  }


