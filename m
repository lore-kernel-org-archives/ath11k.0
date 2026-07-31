Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7663DC5516D
	for <ath11k@archiver.kernel.org>; Fri, 31 Jul 2026 08:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i8F2L1rEXRMkWHvZppRIKIF/IIlCRy69zAZcBD+vS5s=; b=myWcOjSLT5stxwMuYhyGuOppzj
	jBAPxe3zzut9iIVR7FwqIbVL0O+QvrvbD2X2i703ccQXFhi0fJAMxpQScBCciXCu44VRULVYDOYWo
	rWGywCHEB70TlkA8oUmzd77TDYtpLhvUJqOnb0ZHNlanLtKxrcaVpd0wNWMa0LDHvN8rK/dZx3a5Z
	NtxyWCgQwwF/ph2iRAhitcc5pSupKXW6E2qyOBnue8/tWQEQw7StwsanqylNbefsT0WoyAsyQO1DF
	kpqdW4RQPedEHsP4WUX1Qzcwd0GUx4pvRhAbuhLi3AoAsgA0Dkmd44ncOYBoQx5O5vpA6PXvPiwck
	3ARIVxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpius-0000000C6Um-1swq;
	Fri, 31 Jul 2026 08:48:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpiun-0000000C6T2-1PsJ
	for ath11k@lists.infradead.org;
	Fri, 31 Jul 2026 08:48:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8Zrgq3675606
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i8F2L1rEXRMkWHvZppRIKIF/IIlCRy69zAZcBD+vS5s=; b=hCLjy0LnIkvPUl/i
	UxQTVhe07Mio9UD+M42cCqnhzvuviKU88XIMEe65+QqLkldu8ipXP8993kgB4K1W
	pQFD1b8LbjhfF+a5CUNLMn3OayP+TcVTgDnPxk2bGkuuTVnDD8IuQRHiQebOnAUe
	es/MaYeZF2pmVbOC1t4mssg4D88b4taB3AZ4PIIEiN8kWjygj9YJX8D+sv2WdTFe
	N/Nsy1P/3Hbf7tkZY0caMrwxGWlAgjJ8sB7HOuYFUYr5Ry3G9S8DRXOWjXugZ3M9
	vw89LQoOC0GpIuwzZ2BnmfrQ4nZ9lSfBkMTqTss/2GbLWFFilrdkLUNJu/k/6lYB
	LN5iYA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrb781m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 08:48:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b9fb055so2284362b3a.0
        for <ath11k@lists.infradead.org>; Fri, 31 Jul 2026 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785487704; x=1786092504; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8F2L1rEXRMkWHvZppRIKIF/IIlCRy69zAZcBD+vS5s=;
        b=Ly1h0vsBY6fxPny0GU1oe1+6ACrAK/o7BkrnZ2/VqJop9VKubfPWYoHkWRymK/Qte8
         USifXO7q25LIPtK5vY2w/IzK82rKAVE/bGAyo/PvigFB6+h048j9Fqimm/cgg1h99kRu
         qMlWPe2+Im/Guem678aVh4Jpnmb1rdmMu5rlqk2iRRhXMXvQk69+Vf5OjtrML9/atG1u
         p5nARfB8Br/kedCxbPkDH2CmtG7pKgerNTtm2rSMbV0xph/K7BHAcclQidP4hxc82Gpv
         p7LQLZpugCYx9IlOas/DTGCKGV/nZnR9WcxtOTeMiF/F0HxdGZSrrGe+l8Dopzoyln7Y
         Sspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785487704; x=1786092504;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8F2L1rEXRMkWHvZppRIKIF/IIlCRy69zAZcBD+vS5s=;
        b=JpM/i2CdqLIpymy5Lmyh4iOlix77sMoPBWyDe7FYpj8JvVrbc8dbjobvGmawv0mN22
         U+pFUAUkK5DRk2fY/9Y4dNQZayO54zyMlYM68ihEX9/rgeWoFJSXS+Nm+bc09kBlVTwh
         N138OwR9rdTggDEkZfRhExjs4NxxgkK8HCJrIqjMFcqee0DaVJVIyUTiAyaJ41obFgIr
         jNcjGW+Ji4jx+LdJ63zG5WVwa14mLrs5mc/VYJIqaD9Hi+lFXCerSR74Q5lbMdursCTf
         uCeUIaCPzw9hhIncc6hCBo87nScDK8i3zO2ojUNCJqZ/nWP9fitFbzfX6ZKE+VaA7hFS
         RlQg==
X-Gm-Message-State: AOJu0YzBBvZe0h63zVXQlFpyqeGRQDx5A++/5utrc3QFL0WOY5nnHGxZ
	/xQyxsWOet9R5Zh5/6oYjsL3xxsGfYaj6prvGNDrynv8/XRZeElNzr5ZXMjcZlBfycIqvnLHnE7
	1Zn2RtIbvrXN18aFaTppMEaG/mrVMo8SU4wns85Sop90noSVSAvexBo2J9GxTo13j
X-Gm-Gg: AR+sD12bF+9jYBGwqsk1UYK+/k8jJ/chkQAXinr8bgvEmVeVfDtrQSqmjen3aHJv8l5
	72G9MFGBAaj+/0icTdRR3xaX1PNUEU7w8V28kWm0CEZdBG5fKcI0bNGv8VSToMz0hblpZ8vp3Aa
	e2FBOaDPewTf8LEq/nH+nnEyZWt+n9lbreWYrgOa2RFrUgWg0s5zAz4JgmdcWdc0CUfqlt1SMma
	DVdSv7ayjPxhbON/iqvXiwjXYbRdMHObFr6oWhOYAZeMCoFdu9smyttpX4OEQcJwdFYuIOx7Ixy
	o1euEHN3GETORf7SchswX7VYEqu5TzZX3hnKTsJJc9gmEA0wv53EGleEtrvyMNuNW2eKEAGBOl4
	YUW2F7ilETvdKpHI4b/VpHhqdiw8N3nTELBrmktl9cLSsII8hsPaW1FZHVgKm5fP90CQj7V96QA
	==
X-Received: by 2002:a05:6a00:17a5:b0:848:3119:941e with SMTP id d2e1a72fcca58-84ed6edacf2mr1134365b3a.47.1785487703914;
        Fri, 31 Jul 2026 01:48:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:17a5:b0:848:3119:941e with SMTP id d2e1a72fcca58-84ed6edacf2mr1134343b3a.47.1785487703393;
        Fri, 31 Jul 2026 01:48:23 -0700 (PDT)
Received: from [10.133.33.123] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc51cac8sm156250b3a.56.2026.07.31.01.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 01:48:23 -0700 (PDT)
Message-ID: <0ed1f684-1b3b-411b-87fa-929dc0f8f7e9@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:48:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] wifi: ath12k: fix MLO station firmware crash recovery
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727162748.963275-1-jtornosm@redhat.com>
 <20260727162748.963275-2-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727162748.963275-2-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I7hVgtgg c=1 sm=1 tr=0 ts=6a6c6158 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=20KFwNOVAAAA:8 a=f2E5mhgNlWdv1eDQvuYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX1p/Oa+OUpVp3
 dsUP76dRHxYYYieS4nM5MPPxOXpNS61AEGby3MTgGCs28lwBVt+q1EIxad7T5TrtF7rZCmusaaA
 cFmv1C2EdUqGjpjwE4FDvDQ8KPGzE8HeNSUPk0FOg3P5QXoJ1LWOx4BUO4ZBo9dXi6sVajV8hY0
 yCVfanCXPQ+R+PCVI8wx5N/Sro4oQsijQEcHzACe51P7qDiJ1gqIzvAtGZ078b6RCacJom6CwnY
 5j+05kGmFf7+9MLMVAoKCfYAUlfutccnzuIlEe+f2/LGBIxPtCR89v+uH2DlEk66lHJKDIsCoGb
 NSoqrYTty4BUiMqW0HC853v7vxAHqB41/Io6wH46L/mGgYRIMyC9T6uEarQN3c5AdWSg2z5Xf1R
 bzfnxqP6QmMo1IGpzQqa1WzcWf7ZNz4eFKGO280F6qmDF9Xf/lnqFcCqU/64AswYbnTMCr5Tn4r
 Lcn/7j27l6fRqeWBEeQ==
X-Proofpoint-GUID: nBCkWSuPK7wEBDOCKKyuJ8OiRukd-nnt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX6dA+oFa3UwHF
 ngljU3QmIl824ZsJIKorlzth/JN7mJuGPkl7A17XMyUFzG8rtdWtuarySg9YoQvl+e+ZNA9cJmd
 me8VnmEY3hGdSFb5LEYtPzwANn895NU=
X-Proofpoint-ORIG-GUID: nBCkWSuPK7wEBDOCKKyuJ8OiRukd-nnt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_014825_387342_F7441B1D 
X-CRM114-Status: GOOD (  35.73  )
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
> ATH12K_FLAG_RECOVERY is cleared too early in
> ath12k_core_reconfigure_on_crash(), before mac80211 runs
> ieee80211_reconfig(). By the time mac80211 calls back into the driver
> (sta_state, change_vif_links, set_key), the RECOVERY flag is already false,
> so the driver treats recovery callbacks as normal operations.
> 
> This causes several problems during MLO recovery:
> 
> - ath12k_mac_op_sta_state() tries to activate MLO links during the
>   AUTH->ASSOC transition, calling ieee80211_set_active_links()
>   recursively, which triggers a WARNING at net/mac80211/link.c.
> 
> - ath12k_mac_op_change_vif_links() processes link removal during
>   reconfig, causing inconsistent state.
> 
> - ath12k_mac_set_key() fails with "cannot install key for non-existent
>   peer" because peers do not exist yet during reconfig. Keys will be
>   re-established during normal reconnection after
>   ieee80211_hw_restart_disconnect() triggers a fresh association.
> 
> - ath12k_mac_flush() waits for pending TX to complete, but after a
>   firmware crash the TX will never complete, causing a 20 second timeout.
> 
> - ath12k_mac_station_remove() calls ath12k_bss_disassoc() and
>   ath12k_mac_vdev_stop() which send WMI commands to dead firmware,
>   causing timeouts that delay recovery.
> 
> - ath12k_clear_peer_keys() tries to look up and clear peer keys, but
>   peers are already gone after firmware crash.
> 
> - ath12k_dp_rx_ampdu_stop() dereferences per-link station state that
>   may not be valid during crash teardown.
> 
> - ath12k_peer_mlo_link_peers_delete() sends WMI peer delete commands
>   for each MLO link peer. With dead firmware these time out and can
>   trigger cascading resets.
> 
> - HAL srng source ring operations (ath12k_hal_srng_src_num_free,
>   ath12k_hal_srng_src_get_next_entry, ath12k_hal_srng_access_end)
>   may attempt MMIO access to hardware that is no longer responsive
>   if TX paths race with the crash. Guard these to prevent potential
>   hard lockups on unresponsive hardware.
> 
> These issues were observed during sporadic firmware crashes in MLO
> operation. To allow systematic testing and reproduction, the debugfs
> simulate_fw_crash interface was used to trigger controlled firmware
> crashes during active MLO connections with traffic.
> 
> Fix by moving clear_bit(ATH12K_FLAG_RECOVERY) from
> ath12k_core_reconfigure_on_crash() to ath12k_mac_op_reconfig_complete(),
> so the flag stays set through the entire mac80211 reconfig phase. Add
> ATH12K_FLAG_RECOVERY checks in change_vif_links, set_key, and sta_state
> to skip operations that are invalid during recovery. Add
> ATH12K_FLAG_CRASH_FLUSH checks in mac_flush, station_remove,
> clear_peer_keys, dp_rx_ampdu_stop, peer_mlo_link_peers_delete, and the
> HAL srng source ring helpers to return immediately when the firmware is
> dead.
> 
> Tested on WCN7850 with MLO (Wi-Fi 7).
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c  |  2 --
>  drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +++
>  drivers/net/wireless/ath/ath12k/hal.c   | 10 ++++++++++
>  drivers/net/wireless/ath/ath12k/mac.c   | 19 +++++++++++++++++--
>  drivers/net/wireless/ath/ath12k/peer.c  |  6 ++++++
>  5 files changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..5c3883b19da1 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -1410,8 +1410,6 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
>  	if (ret)
>  		goto err_hal_srng_deinit;
>  
> -	clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
> -
>  	return 0;
>  
>  err_hal_srng_deinit:
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 8fa0e90b4531..473855ded8a7 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -751,6 +751,9 @@ int ath12k_dp_rx_ampdu_stop(struct ath12k *ar,
>  
>  	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  
> +	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
> +		return 0;
> +
>  	arsta = wiphy_dereference(ath12k_ar_to_hw(ar)->wiphy,
>  				  ahsta->link[link_id]);
>  	if (!arsta)
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index 071cb5d30931..6d3f4bca46a3 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -376,6 +376,9 @@ int ath12k_hal_srng_src_num_free(struct ath12k_base *ab, struct hal_srng *srng,
>  
>  	lockdep_assert_held(&srng->lock);
>  
> +	if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))

ath12k_hal_srng_src_num_free(), ath12k_hal_srng_src_get_next_entry(), and
ath12k_hal_srng_access_end() sit on the per-packet TX/RX hot path. Adding an
ATH12K_FLAG_CRASH_FLUSH test in the lowest HAL layer overloads a global flag onto all srng
operations and is a layering violation — the HAL should not know about device-crash semantics.

> +		return 0;
> +
>  	hp = srng->u.src_ring.hp;
>  
>  	if (sync_hw_ptr) {
> @@ -419,6 +422,9 @@ void *ath12k_hal_srng_src_get_next_entry(struct ath12k_base *ab,
>  
>  	lockdep_assert_held(&srng->lock);
>  
> +	if (unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
> +		return NULL;
> +
>  	/* TODO: Using % is expensive, but we have to do this since size of some
>  	 * SRNG rings is not power of 2 (due to descriptor sizes). Need to see
>  	 * if separate function is defined for rings having power of 2 ring size
> @@ -524,6 +530,10 @@ void ath12k_hal_srng_access_end(struct ath12k_base *ab, struct hal_srng *srng)
>  {
>  	lockdep_assert_held(&srng->lock);
>  
> +	if (srng->ring_dir == HAL_SRNG_DIR_SRC &&
> +	    unlikely(test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags)))
> +		return;
> +
>  	if (srng->flags & HAL_SRNG_FLAGS_LMAC_RING) {
>  		/* For LMAC rings, ring pointer updates are done through FW and
>  		 * hence written to a shared memory location that is read by FW
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 51c4df32e716..c559ced9e524 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -4278,6 +4278,9 @@ ath12k_mac_op_change_vif_links(struct ieee80211_hw *hw,
>  
>  	lockdep_assert_wiphy(hw->wiphy);
>  
> +	if (old_links && test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags))

why it is limited to the first radio?

> +		return -EINVAL;
> +
>  	ath12k_generic_dbg(ATH12K_DBG_MAC,
>  			   "mac vif link changed for MLD %pM old_links 0x%x new_links 0x%x\n",
>  			   vif->addr, old_links, new_links);
> @@ -5956,6 +5959,9 @@ static int ath12k_clear_peer_keys(struct ath12k_link_vif *arvif,
>  
>  	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
>  
> +	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ab->dev_flags))
> +		return 0;
> +
>  	spin_lock_bh(&dp->dp_lock);
>  	peer = ath12k_dp_link_peer_find_by_vdev_and_addr(dp, arvif->vdev_id, addr);
>  	if (!peer || !peer->dp_peer) {
> @@ -6031,6 +6037,8 @@ static int ath12k_mac_set_key(struct ath12k *ar, enum set_key_cmd cmd,
>  		spin_unlock_bh(&dp->dp_lock);
>  
>  		if (cmd == SET_KEY) {
> +			if (test_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags))
> +				return 0;
>  			ath12k_warn(ab, "cannot install key for non-existent peer %pM\n",
>  				    peer_addr);
>  			return -EOPNOTSUPP;
> @@ -7045,7 +7053,8 @@ static int ath12k_mac_station_remove(struct ath12k *ar,
>  
>  	wiphy_work_cancel(ar->ah->hw->wiphy, &arsta->update_wk);
>  
> -	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
> +	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA &&
> +	    !test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags)) {
>  		ath12k_bss_disassoc(ar, arvif);
>  		ret = ath12k_mac_vdev_stop(arvif);
>  		if (ret)
> @@ -7795,7 +7804,8 @@ int ath12k_mac_op_sta_state(struct ieee80211_hw *hw,
>  	 * about to move to the associated state.
>  	 */
>  	if (ieee80211_vif_is_mld(vif) && vif->type == NL80211_IFTYPE_STATION &&
> -	    old_state == IEEE80211_STA_AUTH && new_state == IEEE80211_STA_ASSOC) {
> +	    old_state == IEEE80211_STA_AUTH && new_state == IEEE80211_STA_ASSOC &&
> +	    !test_bit(ATH12K_FLAG_RECOVERY, &ah->radio[0].ab->dev_flags)) {
>  		/* TODO: for now only do link selection for single device
>  		 * MLO case. Other cases would be handled in the future.
>  		 */
> @@ -12596,6 +12606,9 @@ static int ath12k_mac_flush(struct ath12k *ar)
>  	long time_left;
>  	int ret = 0;
>  
> +	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
> +		return -ESHUTDOWN;
> +
>  	time_left = wait_event_timeout(ar->dp.tx_empty_waitq,
>  				       (atomic_read(&ar->dp.num_tx_pending) == 0),
>  				       ATH12K_FLUSH_TIMEOUT);
> @@ -13494,6 +13507,8 @@ ath12k_mac_op_reconfig_complete(struct ieee80211_hw *hw,
>  	for_each_ar(ah, ar, i) {
>  		ab = ar->ab;
>  
> +		clear_bit(ATH12K_FLAG_RECOVERY, &ab->dev_flags);
> +
>  		ath12k_warn(ar->ab, "pdev %d successfully recovered\n",
>  			    ar->pdev->pdev_id);
>  
> diff --git a/drivers/net/wireless/ath/ath12k/peer.c b/drivers/net/wireless/ath/ath12k/peer.c
> index 2681a047d4d5..e96eb78bbc0c 100644
> --- a/drivers/net/wireless/ath/ath12k/peer.c
> +++ b/drivers/net/wireless/ath/ath12k/peer.c
> @@ -297,6 +297,12 @@ int ath12k_peer_mlo_link_peers_delete(struct ath12k_vif *ahvif, struct ath12k_st
>  	if (!sta->mlo)
>  		return -EINVAL;
>  
> +	/* During firmware crash, peers are already gone. Skip WMI peer delete
> +	 * to avoid timeouts that delay recovery and can trigger cascading resets.
> +	 */
> +	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ah->radio[0].ab->dev_flags))
> +		return 0;
> +
>  	/* FW expects delete of all link peers at once before waiting for reception
>  	 * of peer unmap or delete responses
>  	 */


