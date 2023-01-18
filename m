Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24D4C32793
	for <ath11k@archiver.kernel.org>; Wed, 18 Jan 2023 06:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UiuE+Z3XhO4XfE297Y5/dRrtsqApJu3RCwr/lmPJJ8=; b=Baq+LkLNQyV78j
	p/AS9l1+2CbViWVbQXqNaMQIm9s+sbEf1+GnL9vCYyfvbVO4W2EBbmGFnBQJYc2aGgzlZ+dvj4ZX6
	BHLX2dNXNBuz4RQcKCKhgZriBXNnbT3kKXeaR9l/Eysq5/NSWs+zNgicVc8t0r58q1WzurA56El8k
	RAVmFQvgzWVUuSP6DQwADEmzwzsIJLyZz6nH/yWyIkeRbmQfzRKyS53DNmwitZdAqGvggNakcORe4
	ei3DgsrUD3Qd/EmGsLGQyuFex5PZAH9T+OP1sUJiSsw1oBOU1v9REeorP5VM7zYmWyQ1/jqv2l/s0
	LrbwBS1AiX42wd8i+e5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI20i-00H6hP-AW; Wed, 18 Jan 2023 06:33:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI20f-00H6gj-F8
	for ath11k@lists.infradead.org; Wed, 18 Jan 2023 06:33:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D4DFDB81699;
	Wed, 18 Jan 2023 06:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DEAC433EF;
	Wed, 18 Jan 2023 06:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674023598;
	bh=RwxYuosURc59hD10m17FwTIIVzMWVJAUePzyWZQet/I=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=izLqVWSOTToFPMXZnCqI/Ofl4R0SLw3T8xaFmbi7F7/lk4ycfvPhHLfgHZSuAol6s
	 gebvr5/RaFAIXsRrgUFhzMHumlBwrkRQqh4z+kqL/m0ZvfTv02z39uN60JgQ1idw5a
	 jWEVekZl5xmwI4T6tXj44kQsicYjZcVKroImkdlj+fP77YhD1d/DprxV4m5k7PdMkS
	 tL0kowc2plnIxE1Nt20BLMoCVVpwsMRNuG+H3EWuBFsihy3Cs/RURKwAMwiKpEG+wm
	 vSbZTXRZqlBq05AD+ufSLWw/9SWXysvBBUslXecHWUHqFwmiZRu/qETMy0jx4wCK8k
	 QPosAAxhb3G+g==
From: Kalle Valo <kvalo@kernel.org>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: Add tx ack signal support for mgmt packets
References: <20221219053844.4084486-1-quic_mkenna@quicinc.com>
Date: Wed, 18 Jan 2023 08:33:14 +0200
In-Reply-To: <20221219053844.4084486-1-quic_mkenna@quicinc.com> (Maharaja
	Kennadyrajan's message of "Mon, 19 Dec 2022 11:08:44 +0530")
Message-ID: <87fsc8xsgl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_223321_665580_CC000FE4 
X-CRM114-Status: GOOD (  14.15  )
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

Maharaja Kennadyrajan <quic_mkenna@quicinc.com> writes:

> From: Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
>
> Add support to notify tx ack signal values for mgmt
> packets to userspace through NL interface.
>
> Advertise NL80211_EXT_FEATURE_ACK_SIGNAL_SUPPORT flag
> to enable this feature and it will be used for data
> packets as well.
>
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
> Signed-off-by: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/wmi.h
> +++ b/drivers/net/wireless/ath/ath11k/wmi.h
> @@ -2309,6 +2309,7 @@ struct wmi_init_cmd {
>  } __packed;
>  
>  #define WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 BIT(5)
> +#define WMI_RSRC_CFG_FLAG1_ACK_RSSI BIT(18)
>  
>  struct wmi_resource_config {
>  	u32 tlv_header;
> @@ -4541,6 +4542,8 @@ struct wmi_mgmt_tx_compl_event {
>  	u32 desc_id;
>  	u32 status;
>  	u32 pdev_id;
> +	u32 ppdu_id;
> +	u32 ack_rssi;
>  } __packed;

Adding these two fields increases the minimum length for
WMI_TAG_MGMT_TX_COMPL_EVENT:

	[WMI_TAG_MGMT_TX_COMPL_EVENT]
		= { .min_len = sizeof(struct wmi_mgmt_tx_compl_event) },

If we have a firmware version which doesn't include ppdu_id and ack_rssi
in WMI_TAG_MGMT_TX_COMPL_EVENT ath11k will drop those events. Not sure
what to do.

Is it certain that all ath11k firmware versions have ppdu_id and
ack_rssi? Or should handle so in ath11k that ppdu_id and ack_rssi can be
optional in the event?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
