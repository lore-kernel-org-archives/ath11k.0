Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76ACC5AD55
	for <ath11k@archiver.kernel.org>; Mon, 10 Aug 2026 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ElQOPq9Lyno9HZC6L2tTTKCPAbVkzXBSpJnNUmE3cU=; b=P8SUgsdoDNykU1Th8jPuIGDJYD
	zze0UxsY61ofiHSzS63MNIltGsTDRldFTHewjWPime8sGOdis2q8hza/xDCevscdMmy55YyOfYrZF
	dvPSvAsWeM+JbxjnGIFsaijScU1rm5/AHR0VSaOt4oDZ3c3P5RJMyeKp5yWsI3bEe4qXdNqJZLkOI
	B5HV/nXkZBd3wz9rwO7gavv55JN0ketTVpWHqIVxXBdIAwwCLmdoG7AArdhNYGj6XlfgSDjSb2umI
	iC7BCUh7qz0r3RihYwUSzKYShamJ7kE87J/12itGttiFOFRchTuNLLV8KcH0GWhKp/x0Yda0qnPv6
	MEKCodqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFnk-0000000Auzz-2R7B;
	Mon, 10 Aug 2026 02:31:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFnh-0000000AuzL-39CJ
	for ath11k@lists.infradead.org;
	Mon, 10 Aug 2026 02:31:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679LEnOp4106013
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:31:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ElQOPq9Lyno9HZC6L2tTTKCPAbVkzXBSpJnNUmE3cU=; b=BiAmYbKqYwnXEPuk
	IcleM0++CrHTMf+nx8gnsBhYsc4LjRj5j1gm25CIpHZHzIAFnhhbmd9Bx5aL4zHJ
	tWofUy7OT9Ykr0UBemG45pwxJBh1nhAJ82Pi9lBnMLzvgEq8HLoMjOQEVpJw8HzU
	5c41grZORtoDNemlNfgfYjm3K8zQHd604DHHuyyWganBd9uF9OY7+5SC8EmJFpO6
	cMqcdP/DYIpkfzui6OQrm/eXtgLdzvadlqTek6xJ+ePvSd0q5omfDQtyVbcdTgSJ
	TdO6mcIOLsLQwTEegkpbBwrNmwoPfQz4yMwEI/+z435ynnTHqRVySCjpvj3PPAos
	7OqMbA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xrgda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 10 Aug 2026 02:31:34 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso3004117b3a.3
        for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 19:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786329089; x=1786933889; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ElQOPq9Lyno9HZC6L2tTTKCPAbVkzXBSpJnNUmE3cU=;
        b=PScuoANcMAh9/eCq9WgWMxNZPvP9lmTYY7TZJmCpy3m+f0PLMYoXom7mP5ptKuA65w
         YohryxQp7KFcrq6Gxm7gGVPsUzAvEQrFqireYQTcBRa9aecB2zrVJ8r2m1OxD4VnOm84
         MuKosAwS4tD18SlbWUQcymHFl11ftFQT2AAcF8nAihXxxNIo9lQxv9wwA/1F/VgESzdH
         yB1vNYe5j/WspDmvS0NFzfi7HAkPdnSF6TgwOZsgk3Xqn5hzrXRLKJAoJ3uo4j2l5VjH
         705m38BuTtz2W+Rf6DB+VsI5X6Df/9HPQkb0ZrVvESivNRq7QqHBFhII6Y0c2SkrOLbR
         QNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329089; x=1786933889;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ElQOPq9Lyno9HZC6L2tTTKCPAbVkzXBSpJnNUmE3cU=;
        b=Ca3sfNBJZxO7eMOXrK887YAfQWxVHuYtYrMQ3OBCD7D5S+vdJCLvsw4Jto+mEmq3NQ
         CiC8i77HZYp9ePRGaeA51TD+8HQPoV8BBnQmlt1W69/o5DfRz2tX8m1x5p+h50R3u689
         SShoVT4v0FzolKQGR7aONKMqveERMyJsdtcslf6Xqy58yXN7I6u1S/lHGsdj3Yy0XcGX
         KfvVCU7KSatXI7iWnO2cYOhrwwpaHxeTAWQuH9qfxiKOjZv7ZgGsc8P3gC3SrTfW4XQc
         xENzCoeZ8s7vaeuDm8ukv570sUoQkhE5bto8TS3Xlj5KKoRv/VLegMnDjgLwqN22WFRC
         Sxqw==
X-Gm-Message-State: AOJu0Yy017PS3y9uY2Ha5haibxA5GsdA2HVDC9uG0GP4VluxWOfxPk8L
	SQFbMBEvVXLcPRDHZsHjJwvNriJFkByD0rD03LRWijdkqGhcq14g3X7r7duWP3CizpY/FufnsZh
	Tha7EQmw4TFiKS5B8zMt4LQXWSFMyKULn9w0QZvROQgU63wfRUSy72+JT7btb40Y2
X-Gm-Gg: AR+sD10CfqQV+ddL2tpYJyyZyllnBjmrwEUShOhgN2Rc76YWJBh+CcJ7QOs6txg1YHf
	2xMXYprxrhcj9iWSVe6rwN9Lyvg+POFA+LqLbYO5k2asyQuQOlOedOkKqOsF1JbRFX9Sbiiaz2P
	cIQ9zlkjJmd6kA1u4G52NDz1fFbUeet/PoPqvlSXuNMECWmRZZcm3dAAkF08BMpcGkZtpaGefqR
	VjghLrPxhc48udpZZDpimH6HmGGs3xXAwVrhom9rcdE0Amo8bDDOme94wVtoMnKb5drUbfdNplb
	R9FdkV11gLGzp/ywUZaDD2oAhm95ZoaV7ZitgznDH/9qm7yG4QAqWsJfhjxkYGl5aFdZ2ir58l/
	gd/z3cCVDE9ogvNQqGHyOCIujzuabImqxaWvtoS/Hk/fypb2d8DaEsg6Yd8+Wk/peCxJqiJzh
X-Received: by 2002:a05:6a00:f03:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-84f5df36ec9mr22848551b3a.4.1786329088872;
        Sun, 09 Aug 2026 19:31:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:f03:b0:848:56d4:3288 with SMTP id d2e1a72fcca58-84f5df36ec9mr22848505b3a.4.1786329088424;
        Sun, 09 Aug 2026 19:31:28 -0700 (PDT)
Received: from [10.133.33.47] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f372b5bsm3043615a12.25.2026.08.09.19.31.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 19:31:27 -0700 (PDT)
Message-ID: <52dbbae7-f399-4f59-81f5-5d920c0b5e47@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 10:31:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath11k: initialise the CE descriptor
 waitqueue once per device
To: Julius Bairaktaris <julius@bairaktaris.de>, jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
References: <20260805192129.61113-1-julius@bairaktaris.de>
 <20260805192129.61113-2-julius@bairaktaris.de>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260805192129.61113-2-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAyMCBTYWx0ZWRfX4Q56GUArE0Vv
 YGGUZ0j3+7/X7RwFyh8/OgzE8kL+qupYxetZPR3yo+1Zcas6pkAuoznCcl8tgKUFwzomEm8aEfM
 GoWRfE1FKs/ZqSj3EG7OflDkw0DR6+U=
X-Proofpoint-ORIG-GUID: TU-PXEVZSfKjJSAOAbTCstvMcyHT5EGO
X-Proofpoint-GUID: TU-PXEVZSfKjJSAOAbTCstvMcyHT5EGO
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a793806 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=jssK9KqoyDg6S70j6i0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAyMCBTYWx0ZWRfXx1IZD7mCXBz3
 g9QxcejzVRFbDdseYz2y9trWdDy3fgz422f78znOLoSA83FeBm8ujVKMUferXsx9Na+pax1/OJr
 s6vQjiaHEv+1z1oiC6DPXoyz9rfH8Dr4se/gA6c0MggSr5QXu8GiaweSFHypYL/4eqIoUE3u+Iv
 QbMEVO5DBd+iOPt42aFy/2e+b4ca9WY2e0ZCiselnNJUe41M6e1gC0GpkxENU5T4RxALGaXBTKZ
 IjG6OFK4UKasGpLFLw6/biir18SvV5yQqav1haAga71fzEIM+DxJZ5+/Dnz+jz+ejyturzez7eO
 hiFXGY6+6+s3lG4x6NezrBIYkNvJ6BDw2IPXC8qUfRg7ST9oSra7Fqpw6jsvSBiVqJdoilD/58G
 dJO9vJDS2ZsnVR0n+hZKQkTV26TQn0JP3SCuPi0foSc6Q3vkDG2UACX0A+N26cefNGs0cafSQb0
 lAfQhZsE+Ris+dsOH3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_193141_943531_A91D2566 
X-CRM114-Status: GOOD (  26.15  )
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



On 8/6/2026 3:21 AM, Julius Bairaktaris wrote:
> ath11k_wmi_pdev_attach() runs init_waitqueue_head() on the pdev's

did you mean ath11k_connect_pdev_htc_service() ?

> tx_ce_desc_wq. It is called from ath11k_wmi_attach() ->
> ath11k_core_start(), which firmware crash recovery re-runs through
> ath11k_core_qmi_firmware_ready(), so the head is reinitialised on every
> recovery - including while a task is still queued on it.
> 
> Parts with hw_params.credit_flow clear - ipq8074, ipq6018, ipq5018,
> wcn6750 - take the else branch of ath11k_wmi_cmd_send() and sleep there
> in wait_event_timeout() for up to WMI_SEND_TIMEOUT_HZ. That is longer
> than a recovery takes, so an ordinary WMI command issued from userspace
> just before the crash is still on the queue when the head is cleared
> under it, and finish_wait() then deletes the entry from a list head that
> no longer refers to it:
> 
>   WARNING: CPU: 1 PID: 1861 at lib/list_debug.c:62 __list_del_entry_valid_or_report+0x110/0x154
>   CPU: 0 UID: 101 Comm: hostapd
>   Call trace:
>    __list_del_entry_valid_or_report+0x110/0x154 (P)
>    finish_wait+0xcc/0xd0
>    ath11k_wmi_cmd_send+0x150/0x2f4 [ath11k]
>    ath11k_wmi_vdev_set_param_cmd+0x64/0xd8 [ath11k]
>    ath11k_mac_op_bss_info_changed+0xe8/0xf60 [ath11k]
>    drv_link_info_changed+0x118/0x160 [mac80211]
>    ieee80211_link_info_change_notify+0xe0/0x100 [mac80211]
>    ieee80211_change_bss+0x1c8/0x250 [mac80211]
>    nl80211_set_bss+0x1a0/0x330 [cfg80211]
> 
> Initialise it where its credit-flow sibling ab->wmi_ab.tx_credits_wq is
> already initialised, in ath11k_core_alloc(), which runs once per device.
> The array is fixed size, so all of it can be set up before any pdev is
> attached, and nothing on the recovery path touches the head again.
> 
> Reproduced on a Xiaomi AX3600 (IPQ8074 hw2.0) with a userspace loop
> pushing beacon updates while the firmware is asserted through the debugfs
> simulate_fw_crash 'assert' trigger, on a stock ath11k with no out-of-tree
> modules loaded: one warning per recovery, on all eleven recoveries
> observed across two builds, and none at all over six recoveries with this
> applied.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f951380a6022 ("ath11k: Disabling credit flow for WMI path")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  drivers/net/wireless/ath/ath11k/core.c | 5 +++++
>  drivers/net/wireless/ath/ath11k/wmi.c  | 1 -
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -2746,6 +2746,7 @@
>  				      enum ath11k_bus bus)
>  {
>  	struct ath11k_base *ab;
> +	int i;
>  
>  	ab = kzalloc(sizeof(*ab) + priv_size, GFP_KERNEL);
>  	if (!ab)
> @@ -2772,6 +2773,10 @@
>  	INIT_LIST_HEAD(&ab->peers);
>  	init_waitqueue_head(&ab->peer_mapping_wq);
>  	init_waitqueue_head(&ab->wmi_ab.tx_credits_wq);
> +
> +	for (i = 0; i < ARRAY_SIZE(ab->wmi_ab.wmi); i++)
> +		init_waitqueue_head(&ab->wmi_ab.wmi[i].tx_ce_desc_wq);
> +
>  	init_waitqueue_head(&ab->qmi.cold_boot_waitq);
>  	INIT_WORK(&ab->restart_work, ath11k_core_restart);
>  	INIT_WORK(&ab->update_11d_work, ath11k_update_11d);
> --- a/drivers/net/wireless/ath/ath11k/wmi.c
> +++ b/drivers/net/wireless/ath/ath11k/wmi.c
> @@ -9064,7 +9064,6 @@
>  	ab->wmi_ab.wmi_endpoint_id[pdev_idx] = conn_resp.eid;
>  	ab->wmi_ab.wmi[pdev_idx].eid = conn_resp.eid;
>  	ab->wmi_ab.max_msg_len[pdev_idx] = conn_resp.max_msg_len;
> -	init_waitqueue_head(&ab->wmi_ab.wmi[pdev_idx].tx_ce_desc_wq);
>  
>  	return 0;
>  }


