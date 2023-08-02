Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1C4C001E0
	for <ath11k@archiver.kernel.org>; Wed,  2 Aug 2023 11:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yys2Y1lsaqkiz6r1RkgDBRGO6vg4TqmQTXUknlML2FI=; b=X8CSJWYkreIqsy
	4OtY2FcAgkTikVPVfq6A+czyMs3YG8Y1kK5mFlDb37xieP2RzfjgmXK292TioqMM7PtoFbKwHtnbG
	HvtstNNK8j3sF+XMZ8R6NE/oOXML2/MZEhl+odrw1r1BsMw8P2dFKuULzBW/5WOcbphEHntYDl2K4
	J3/DOjyRJJwLMaNq/J8vEwsOXrArFBaRYNSbr6pXT59MP+b4gVtO2fPMuIX2DfTcSVut1VXc707Up
	MItWZkElU5nNEJtw1xSgSL/1ntAiyDn9pHT1Qmo7qwZW+v0Zi7Hc6gM5VRgkMA7M0qOzbe79AKkvs
	xeobdnmLpVEpzGFKn3Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAA3-004oVO-2n;
	Wed, 02 Aug 2023 11:37:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRAA1-004oUg-1W
	for ath11k@lists.infradead.org;
	Wed, 02 Aug 2023 11:37:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF2F16192C;
	Wed,  2 Aug 2023 11:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67F44C433CC;
	Wed,  2 Aug 2023 11:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690976220;
	bh=bQYnWsfeRljqk1mmtmVRAyq5XZ7VtvuLqFh9lbdjcrM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=fE/iYIAjau3g+EFehzi2StLIisw1EDqMKbk6mimm41dNcrrqCtwOV7OSgt7qSEFxq
	 H8l95ylXJuimSKNrr5+/QajPHCtbOKVZMazfhmodgNiCG9azn4VN6o++BmcYo7IU53
	 jOf5Mv0LjMyptEcgjept68R9YB4XocdyTgyxCn3jROG1JtHFFdHHERtJ72N2MgUcyz
	 YSZN1AMyo2ySmkwyb3iaodOFW21nc8vtw76fD1gDGSeEqToGafWYhBe7x2AewwWmFs
	 j4Obv/vgdvFem8neYo9RxfFDbNdxeVL+Ft9wkh1DD8o+c40agICoDfkeaSg81ipPK9
	 r/bX6BuUDHJ/A==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 2/5] wifi: ath11k: store cur_regulatory_info for each
 radio
References: <20230607094810.26707-1-quic_wgong@quicinc.com>
	<20230607094810.26707-3-quic_wgong@quicinc.com>
Date: Wed, 02 Aug 2023 14:36:57 +0300
In-Reply-To: <20230607094810.26707-3-quic_wgong@quicinc.com> (Wen Gong's
	message of "Wed, 7 Jun 2023 05:48:07 -0400")
Message-ID: <874jlhwu92.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_043701_549691_58EF1D1A 
X-CRM114-Status: GOOD (  10.90  )
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

> The regulatory info of WMI_REG_CHAN_LIST_CC_EXT_EVENTID is not saved
> in ath11k now, the info should be saved in ath11k. Save the info for
> each radio and support switch regulatory rules dynamically.
>
> Tested-on: WCN6855 hw2.0 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> +	ret = ath11k_reg_handle_chan_list(ab, reg_info, IEEE80211_REG_UNSET_AP);
> +	if (ret) {
> +		ath11k_dbg(ab, ATH11K_DBG_WMI,
> +			   "failed to process regulatory info from received event\n");
> +		goto mem_free;
>  	}

Why the warning message is using ath11k_dbg()? I think it should be
ath11k_warn() and also print ret value.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
