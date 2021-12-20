Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC42C433F5
	for <ath11k@archiver.kernel.org>; Mon, 20 Dec 2021 18:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSq2M8bbJQkfFfQfMJmkkznR8R1GZ0kBUOJLqGkZ6JU=; b=jHYg8/QwWfRUbr
	Hs/ej2Elm+v0m1abzS+G1pQ2wrTrtghgqMbhDqOyUBcrJgVmmcvIbDXpCA2kWtro6Qvrs2Ih/K9M5
	5MTGT3almDi5ty9TDvs6z7E3dgsgbMui//vM3ylcFhagQbeeB8PCe7WrELSVh5+U7onJmRLt7rX/7
	VUgtFisai1fsBcxubkjVJrxzr4TP4wogX8xow394/ruhRoGJZsKvCrW5ohjd9v5DMEC0S53VkPMIE
	rp8GiR0qgm0JNNQC4vbjGL9ckP9qV55t1H3EYTJMsXq9iXvHFzU7Dx6ETRmIBkvmkejs2PsJ27AoE
	DnoWDUg5qgLTePfcAayw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzNOB-003nI2-3H; Mon, 20 Dec 2021 18:27:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNO8-003nHU-VB
 for ath11k@lists.infradead.org; Mon, 20 Dec 2021 18:27:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74D19611D6;
 Mon, 20 Dec 2021 18:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA88C36AEA;
 Mon, 20 Dec 2021 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640024875;
 bh=hwb3NURyYDAFkSj9nnc3dDcEz6HDSVFn+Qk6tNueHHM=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=XtxcwiYvIdJ7ogb8ReDm1S5c5Fie9K9nPSKUBqJbVdTMWyETRd+UupS3zrNtamk7I
 lZeECba+bQ49V40Blls9Jfd3tM64xHMAn3cxZUyxdw9wmdlhGlaCiTU09xjrkgkW8J
 RpO103wlzAPLxyfcyJMjypjGh8mkJZNJ8DOkX4htKjwPAh89o+o285md5nfx/COcdW
 eAUYYLjVeJTEsCiHFxUBLPdEKuUWo9TniiBwB3ePdPwavznMcm93VmQ2S7JegrZ75v
 H+DIJ5SJhI/4ZtjlTOH0vFz04NYhmDuEn+za3krfoIxUxuNINaNtJkxPs4Hb8K+yS9
 OGEkS7un+kIoA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>
Subject: Re: [PATCH v2] ath11k: add signal report to mac80211 for QCA6390 and
 WCN6855
References: <20211216070535.31732-1-quic_wgong@quicinc.com>
 <34610fb9-d9ec-0cb8-f58f-fe82fe96002c@quicinc.com>
Date: Mon, 20 Dec 2021 20:27:51 +0200
In-Reply-To: <34610fb9-d9ec-0cb8-f58f-fe82fe96002c@quicinc.com> (Jeff
 Johnson's message of "Thu, 16 Dec 2021 15:32:31 -0800")
Message-ID: <87r1a79lnc.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_102757_071456_0F154C59 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 12/15/2021 11:05 PM, Wen Gong wrote:
>> IEEE80211_HW_USES_RSS is set in ath11k, then the device uses RSS and
>> thus requires parallel RX which implies using per-CPU station statistics
>> in sta_get_last_rx_stats() of mac80211. Currently signal is only set in
>> ath11k_mgmt_rx_event(), and not set for RX data packet, then it show
>> signal as 0 for iw command easily.
>>
>> Change to get signal from firmware and report to mac80211.
>>
>> For QCA6390 and WCN6855, the rssi value is already in dbm unit, so
>> don't need to convert it again.
>>
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
>>
>> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

>> @@ -7843,9 +7846,22 @@ static void ath11k_mac_op_sta_statistics(struct ieee80211_hw *hw,
>>   		ath11k_mac_put_chain_rssi(sinfo, arsta, "fw stats", true);
>>   	}
>>   -	/* TODO: Use real NF instead of default one. */
>> -	sinfo->signal = arsta->rssi_comb + ATH11K_DEFAULT_NOISE_FLOOR;
>> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
>> +	signal = arsta->rssi_comb;
>> +	if (!signal &&
>> +	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
>> +	    ar->ab->hw_params.supports_rssi_stats &&
>> +	    !(ath11k_debugfs_get_fw_stats(ar, ar->pdev->pdev_id, 0,
>> +					WMI_REQUEST_VDEV_STAT)))
>
> what happens when CONFIG_ATH11K_DEBUGFS is not enabled?

I suspect it won't work.

> should the logic to get the stats be decoupled from DebugFS support?

Yes, I think it should be. But better to do it in a separate patch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
