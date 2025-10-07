Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD835CCA470
	for <ath11k@archiver.kernel.org>; Tue,  7 Oct 2025 14:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i15v0MWuPu/05mOek3M80W24v7ARsRO5z1xG7TxMnfE=; b=RZelKE3h5mOHQMm4ekurJBp5+4
	oX4yDYQ0XDPZE+J6g5D/b6WMQxvKumIYRMS8VAaqfRTYLKNo5M6NgXGDf5U9+oCRzSqE7J+nxMD+B
	+79uO5n7MbN7eND13cf2ZIdADSt5JCi++zE+ZwrhGizmgEhnbsm8qiPl3JZF2FJj+viSka6+NVapX
	TQ7ak7LNXfaWfFUow6GhVbJsn01ybjvz2O7552vdoqpZeexZU/QyoH70BCXBAxn3HXT0dZir2ep3X
	nfRUOI3ov8A2HbRDWbTga8lR5QA8n5q78s2fyUS3FP8dhuagmsUQyQSfbChrxA7MyEuhbQ1Q3SPIQ
	hZtW16UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68gj-00000002BRq-1cl9;
	Tue, 07 Oct 2025 14:29:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68gg-00000002BQz-1fuY
	for ath11k@lists.infradead.org;
	Tue, 07 Oct 2025 14:29:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET8xS020398
	for <ath11k@lists.infradead.org>; Tue, 7 Oct 2025 14:29:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i15v0MWuPu/05mOek3M80W24v7ARsRO5z1xG7TxMnfE=; b=ji/NlOU/ACDQ58Xw
	G4XTlIfuWWOjpTAwaZCacbqS23w/McDW5rgFJl7YPFohjyuJohxzHeWejRNhSts/
	v2JjXDL6itJRNeF/efgOT2vy3o82FxYFZKuoKkkxX1QaZniMtXASriEmgudlBJ8j
	j/MJqkaCmh34GFQPdoF7dagvB69QjiYQQLGBYnXE5KmPa+OpXCm0hrglt54066DJ
	s0JU46SidhvgCyKynUhiF8o/aMWMCicgl7ocyTZ/R+wBJNu1TmyOcwAWAE5pXdsq
	vzJwTZFI7IfCJfLOYFKBLIjVNIU81zS+pkmfZsHlAGMXnpkSGyfI9jl+yq/KkDaf
	LS4CoA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dyn44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 07 Oct 2025 14:29:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28eb14e3cafso54342805ad.1
        for <ath11k@lists.infradead.org>; Tue, 07 Oct 2025 07:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759847348; x=1760452148;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i15v0MWuPu/05mOek3M80W24v7ARsRO5z1xG7TxMnfE=;
        b=RT4NbhWvlgFnEMUCtKE9/eeHm6L6mlKOJeWnLTlXc+IvUoIB/wDve7K+4cOfMKMkWf
         cqcsZj29WDYPeyjmyPa7mzYnCRhIJNDP+PlESGBsrKyGXX7pjTQNn4Z8vaL7GuvrJm07
         ijgvk6cVDFKlk7jJGm5w69VWWbLDzsWOINO1y9ynUX49YX+DImBcORCTnWfVE/T0upag
         9lawrYvdgbEjwbvlyc1O0dezypr1HFwgvRcAJD9ksYHE0/AGPnF/5/qtT2FGYIyBXC+l
         yekLFKfB2qbN8jQc+26niBSLA1997CldzX3u9SXjuGjBM4gSzcv2vLUOScmMWpxVLobM
         8Adg==
X-Forwarded-Encrypted: i=1; AJvYcCXnAofuMqdxiFSkEHtxuk8ZAorb9BFPvqOxxSnmtrgdeXfFsZsR4nzh2mRt4aYhe/UvvQ85tjI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyI++teAL/YRRYyWL/DfIOh8H3aSdOYCB+wUoSIaaPDEtMvbHAo
	3TQjTU031t5DN7BVoEBPcn/g50Vf+YRWHLqj8+u2ktGRCyC1gkGDvZfQvNlQcD5RdAQ/q8gGBeh
	meaHdDb0ni1iTw+bmLF9anMRwvMP+ti6Pf87LNHSkXH2gqlqa0Xhs7QP3Enb5JR5l
X-Gm-Gg: ASbGncv5/+v1Dw9RmGmkrhk9pmtCY09vXlewdmbUbRU47F8mMqkPm9cn9P6foLBT/ZY
	f8pjxE0pcp2WvSQ/4Oyyh/aVMo5/raBW/2FxtnnsIyRItCXPNFQtPdS/0JkPfvou2qwcVAEJY1x
	AHBzNP7reb6rqVmKyxvj49+EVX7k/K+NVjiSgNnxmIKNffy504UhJTUqCYg3fCFvzwV778HHcMx
	vJfMfFCmdWavqWW2sIue0biCaTg73cFU4S3lDQWJ+bEB0VMLdkX9WiRW2PAs/mBvnQJ8cFjlfBe
	+IWBVHGepfNr/61G6ftoKTpJFTq9y4gDL9eGju52agtiNHm2NQ1h6C+3+UlenM4tP4hR9wEhFOZ
	+aKwQtniJVzs5K3cSZm0TacpvdEUk9Hr/SVBp7fKmvg==
X-Received: by 2002:a17:903:2404:b0:28e:7567:3c4b with SMTP id d9443c01a7336-28e9a58ff08mr155376345ad.16.1759847348079;
        Tue, 07 Oct 2025 07:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGs0+TWsXuUvTzAz5dQmRGsuU94EuL/oTLXvIRyJFFJl2oxGIM6M7R0ris5ccZO7NqxHE0/dg==
X-Received: by 2002:a17:903:2404:b0:28e:7567:3c4b with SMTP id d9443c01a7336-28e9a58ff08mr155375955ad.16.1759847347468;
        Tue, 07 Oct 2025 07:29:07 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e4fsm167381275ad.73.2025.10.07.07.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:29:07 -0700 (PDT)
Message-ID: <29a30250-137e-429f-91fb-1f509a55746f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 07:29:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ath11k: add ath11k_mac_op_flush_sta to properly flush
 pending packets
To: Florian Maurer <f.maurer@outlook.de>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <GV1P250MB14333A5BF24623C4753A10E1E8E0A@GV1P250MB1433.EURP250.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e523b5 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=stkexhm8AAAA:8
 a=xfCdrJMBT71qAiTnbiAA:9 a=QEXdDO2ut3YA:10 a=D0TqAXdIGyEA:10
 a=xa8LZTUigIcA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=pIW3pCRaVxJDc-hWtpF8:22
X-Proofpoint-GUID: V017ta0QCqm736rakfZmTZzdwh-KMGqz
X-Proofpoint-ORIG-GUID: V017ta0QCqm736rakfZmTZzdwh-KMGqz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX4VR636OMxcnP
 teK/IGF2nwxh+Vl4vQNzDH2AgRnBnmD2ifb8W0bmTX1MpWUiFz3CCrSDdre159bJ71WJYfpcVPP
 R/mxOuOaY7UjBKBZjcU+iHw3o+rDmudAu/oKbkRIFkGmHJ4BSkkPjwQxoWM6QYDMlXy2svujfx3
 lmWDDdJK12ZccTv3n6khUIMUFHfRPVqE9CpNieCg6l6DtG0APuCXqhPPuq/0qA03tCQZFjme+zC
 6i5kX8bZQW1STZ8iu2pSynfauBOPZDsV5BR9ZICHJEPExUMFx52opjTQqdEVty5f1QWcpig1WhW
 TMnHTgcZ/UD1ZBltlqmERWLpWawLB0WO9oLW13ugF/G7lYfnwT1JRUBUsm5yxGmMm524TSAg8Jv
 at69kHShgPSfjfy2qEzSJJ0my/FqvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_072910_451287_1BACC884 
X-CRM114-Status: GOOD (  30.37  )
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

On 10/7/2025 1:11 AM, Florian Maurer wrote:
> When a STA is marked as no longer authorized, if the driver doesn't
> implement flush_sta(), mac80211 calls ieee80211_flush_queues() to
> flush hardware queues to avoid sending unencrypted frames.
> 
> This has became a problem for ath11k because ieee80211_flush_queues()
> will stop all traffic and call ath11k_flush, which waits until the
> whole HW queue is empty. In a busy environment this will trigger a
> timeout warning and stalls other STAs.
> 
> Fix this by implementing flush_sta method using WMI command to flush
> frames of a specific STA.
> Flushed frames will be marked as discard in tx complete indication.
> 
> warning print "ath11k c000000.wifi: failed to flush transmit queue 0"
> was observed on various openwrt devices, and is fixed through this patch.
> 
> Signed-off-by: Florian Maurer <f.maurer@outlook.de>

Your SOB should be the last tag in the list of tags since you need to sign off
on the other tags you have added

> Tested-by: Florian Maurer  <f.maurer@outlook.de>
> Co-authored-by: Benjamin Berg <benjamin@sipsolutions.net>

This is not an upstream kernel tag. Perhaps you meant:
Co-developed-by:

https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

Note that a Signed-off-by: tag is needed for all contributors

> Tested-by: Flole <flole@flole.de>
> ---
> We tested this patch and it solved the problem of flushing the transmit
> queues taking too long when the AP is busy.
> We did not confirm if this flush is implemented to guarantee that no
> unencrypted frames are sent out on station removal.
> Could someone with more knowledge about the firmware behavior check
> wether this approach is feasible or if a different approach should be
> taken.
> It is not clear to me if the approach taken in "wifi: ath10k: Flush
> only requested txq in ath10k_flush()" might be better.
> https://lore.kernel.org/linux-wireless/01d859e8e574a1f5d0b916333fe0b5cda859af9b.1732293922.git.repk@triplefau.lt/
> 
> Regards
> Florian
> 
>  drivers/net/wireless/ath/ath11k/mac.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/ath/ath11k/mac.c
> index 106e2530b64e..a94649edd4ed 100644
> --- a/drivers/net/wireless/ath/ath11k/mac.c
> +++ b/drivers/net/wireless/ath/ath11k/mac.c
> @@ -8330,6 +8330,24 @@ static void ath11k_mac_op_flush(struct ieee80211_hw *hw, struct ieee80211_vif *v
>  	ath11k_mac_flush_tx_complete(ar);
>  }
>  
> +static void ath11k_mac_op_flush_sta(struct ieee80211_hw *hw,
> +							struct ieee80211_vif *vif,

CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis

> +			    			struct ieee80211_sta *sta)

ERROR:CODE_INDENT: code indent should use tabs where possible
WARNING:SPACE_BEFORE_TAB: please, no space before tabs

> +{
> +	struct ath11k_vif *arvif = (void *)vif->drv_priv;

use = ath11k_vif_to_arvif(vif)

> +	struct ath11k *ar = hw->priv;
> +	struct peer_flush_params params = {
> +		.peer_tid_bitmap = 0xFF,
> +		.vdev_id = arvif->vdev_id,
> +	};
> +	int ret = 0;

unnecessary initializer that is always overwritten

> +
> +	ret = ath11k_wmi_send_peer_flush_tids_cmd(ar, sta->addr, &params);
> +	if (ret)
> +		ath11k_warn(ar->ab, "failed to flush sta (sta %pM)\n",

avoid unnecessary parenthesis, and include the error code, i.e.:
"failed to flush sta %pM: %d", sta->addr, ret

> +			    sta->addr);
> +}
> +
>  static bool
>  ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
>  				  enum nl80211_band band,
> @@ -9920,6 +9938,7 @@ static const struct ieee80211_ops ath11k_ops = {
>  	.set_bitrate_mask		= ath11k_mac_op_set_bitrate_mask,
>  	.get_survey			= ath11k_mac_op_get_survey,
>  	.flush				= ath11k_mac_op_flush,
> +	.flush_sta			= ath11k_mac_op_flush_sta,
>  	.sta_statistics			= ath11k_mac_op_sta_statistics,
>  	CFG80211_TESTMODE_CMD(ath11k_tm_cmd)
>  
These are just cosmetic comments. I've asked both the infrastructure and the
mobile teams to validate this proposal for technical correctness.

/jeff

