Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5DAC04E69
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 11:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2tEMfA9VVb1dGiC3A5OlpQb8m3f8QH2aiNlhkbfSmYY=; b=sVlCGyFwHP22TY
	t+bN2hEMWR+bklCrO/1eCwfdAkNxNlu6hTyVPCINahVNhPzo2rQ6PjWqsA7cH2yIU9xwLwcyS3OZz
	qZkYmwkjwDL9hOEH0R9coJqiHKqOlhd7VhPbxs8c21NLGmldYk+yPTE0cb/YZGKNCVJK1vFuqv8m4
	2+LGHUZe8gMYdiv4t5kk6lHyg5wTeyApJu4XQzoooTLBSRstCEnHlNYGqRfCYTiox9VIrTXDtz1kE
	nyYIHFq1pPFHvwvvorcxVSUzBCDbiMh/xzhBT2IQVK9MIY6aQlbX1GqNRWbAHdik/tkVQxtaQZMw5
	kHMsOTbi1mfjh6eqWqVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAHO-004pYi-2T;
	Wed, 02 Aug 2023 11:44:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAHL-004pX1-1P
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 11:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B970F61934;
	Wed,  2 Aug 2023 11:44:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA57C433C8;
	Wed,  2 Aug 2023 11:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690976674;
	bh=gCzHrGsl2mzOFtgFir6MlbRDFwpswOAJQ2dRzzMSFkQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VXp9XxDowNRdyq0bcXm5SET3I5X50WQl4W3PZExnvUrRb9sVY6s32N8Hc8TC3CB2I
	 q/A+jkwLwfUtvF8UaSBHheaeKXvjd2VRTMW/DOJz6OYOxRlbjyFUDomL5m7fUMwLlz
	 bz4iBpUGEneSGrABXTs3ICUZFp3T/Jt2AY2dJTFlJ1uYx3xI/EVqsXC40ggNzIvwwR
	 0Cs3tBcjLa5Z7mpeNXhTuJf2yho/Cpt0E4Vn5BNz2ocCoo4UAdyeoro8j+k11NRDM+
	 333r9X/BS6ZzdaSiKt4xZcqO27MdGj/od6bhDrGi4TjFBkPF/pz8WUQFJGt8jpCxyd
	 9U0Rd3pDch+oQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 4/5] wifi: ath11k: update regulatory rules when
 interface added
References: <20230607094810.26707-1-quic_wgong@quicinc.com>
	<20230607094810.26707-5-quic_wgong@quicinc.com>
Date: Wed, 02 Aug 2023 14:44:31 +0300
In-Reply-To: <20230607094810.26707-5-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 7 Jun 2023 05:48:09 -0400")
Message-ID: <87zg39vfc0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_044435_515235_EF1DBC82 
X-CRM114-Status: GOOD (  13.18  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> When wlan boot up, WMI_REG_CHAN_LIST_CC_EXT_EVENTID is sent from
> firmware at an early stage, the interface mode is not decided at
> this point, then ath11k select reg rules of AP mode as default.
>
> After interface is created, it is exactly decided AP/station mode,
> then ath11k need to update reg rules to the exact one.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/hw.c
> +++ b/drivers/net/wireless/ath/ath11k/hw.c
> @@ -897,6 +897,12 @@ static u32 ath11k_hw_wcn6750_get_tcl_ring_selector(struct sk_buff *skb)
>  	return skb_get_hash(skb);
>  }
>  
> +bool ath11k_hw_supports_6g_cc_ext(struct ath11k *ar)
> +{
> +	return (test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT,
> +			 ar->ab->wmi_ab.svc_map)) && ar->supports_6ghz;
> +}

This is more like a firmware feature, maybe move to mac.c?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
