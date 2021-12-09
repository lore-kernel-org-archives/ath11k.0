Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3949C433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4eXC4H3moVZkDO2km6tQi41x6KJohCWthkw9pMPZco=; b=Ocvzw1evnP0wvL
	a44c9yJePnqH1RYhcY/lzZI8Vu2Z7AENLJfF42X8bWCcVeTMdZXbZ7ssoCPQD2QgK0lLvTJPuwZOt
	iFn1rN7NhHdiKva3fNtP2KIR3Gx7QVW/omRt7FVB5Vq6NWyEGPQTG3hqt1cPg9CMYKmyFFP/LjoDs
	vT4jNAWTgvnhQWm+wW+Im9/aDwqar0uUSZmBBQQ8OHx0niCQrFKEdzK3pOg0a0Xp/ZTFtjf+sli+8
	R/SOl7EUxL46xSfvnKWjGpBumpVYSUl627y9XbMcb+Qo4EOxE310HSv4XOlNkBq3TLc4/s0PP5uEL
	PkBjDZT12RhgZYbru/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvN77-00GwMK-Tb; Thu, 09 Dec 2021 17:21:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvN6o-00GwHi-2k
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 59D19CE276E;
 Thu,  9 Dec 2021 17:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E04C004DD;
 Thu,  9 Dec 2021 17:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639070486;
 bh=yHZ3BWinJ0pAFz+/sk9jf+axKOu0yEghOAFBuX78R4A=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=nIvkR7yeOTEiN0/vFE/won6NhuwOo+MnpZaK++HBLw09zgu2cbgCrmjz1BQFzKGpm
 tUhErojDFchJ16eYLHhVX03C1ZkkFOYJUXI/17JqcQTeXhPCIVuVkkmTsA3ZzWy/PN
 nZ8Ib8vQ5sy9M5NNiALCLdMCc2uThSRNwx0Y0wGwchU833eDM8TXaSpKL93dydsvRl
 6MBYdVH7BqIhlVL4lmahZ23w3WlLAeXt8QJVQJavEb/NEyfLpETgP1uWXxCtsd80gX
 bclLceF12mPA61tDC5fbAo8TkVhHrFnApwm5TW1ebt/cDp4yZlMrsifGfG0kzWyqC/
 o4hD4pufmTl+g==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 02/15] ath11k: Add support to parse new wmi event for 6
 GHz regulatory
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
 <20211026111913.7346-3-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:21:20 +0200
In-Reply-To: <20211026111913.7346-3-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:19:00 -0400")
Message-ID: <87bl1pwv73.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_092130_538078_AEA738CE 
X-CRM114-Status: GOOD (  19.96  )
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

> In order to support different power levels of 6 GHz AP and client, new
> wmi event for regulatory was added in firmware(WMI_REG_CHAN_LIST_CC_EXT_EVENTID)
> to provide new parameters required for 6 GHz regulatory rules.
>
> firmware advertises its capability of handling new event in wmi service ready
> event. Based on that, host needs to set host_service_flags in wmi init
> command to indicate that host supports processing of new wmi event.
> Based on advertised host capability, firmware decides to send old event
> (WMI_REG_CHAN_LIST_CC_EVENTID) or new event(WMI_REG_CHAN_LIST_CC_EXT_EVENTID).
>
> Add support for parsing 2.4 GHz/5 GHz/6 GHz reg rules and other parameters from
> WMI_REG_CHAN_LIST_CC_EXT_EVENTID, to populate the channel lists.
> Since 6 GHz requires additional power value fields(PSD info), update
> reg rule parsing function.
>
> Signed-off-by: Lavanya Suresh <quic_lavaks@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>

[...]

> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -230,6 +230,7 @@ static const struct ath11k_hw_params ath11k_hw_params[] = {
>  		.supports_suspend = true,
>  		.hal_desc_sz = sizeof(struct hal_rx_desc_wcn6855),
>  		.fix_l1ss = false,
> +		.support_ext_cc = true,
>  	},
>  };

Please add all the false cases as well. I'm trying to keep all hardware
entries have all fields specified.

> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
> index 67b843a92344..a65f7d00eea2 100644
> --- a/drivers/net/wireless/ath/ath11k/core.h
> +++ b/drivers/net/wireless/ath/ath11k/core.h
> @@ -966,4 +966,10 @@ static inline const char *ath11k_bus_str(enum ath11k_bus bus)
>  	return "unknown";
>  }
>  
> +static inline bool ath11k_support_cc_ext(struct ath11k_base *ab)
> +{
> +	return ab->hw_params.support_ext_cc &&
> +	       test_bit(WMI_TLV_SERVICE_REG_CC_EXT_EVENT_SUPPORT, ab->wmi_ab.svc_map);
> +}

Add core:

ath11k_core_supports_cc_ext()

Or maybe it would be more intuitive to have this in hw.h?

ath11k_hw_supports_cc_ext()

> diff --git a/drivers/net/wireless/ath/ath11k/hw.h b/drivers/net/wireless/ath/ath11k/hw.h
> index b17c37e9eda7..86fd9dc82983 100644
> --- a/drivers/net/wireless/ath/ath11k/hw.h
> +++ b/drivers/net/wireless/ath/ath11k/hw.h
> @@ -164,6 +164,7 @@ struct ath11k_hw_params {
>  	bool supports_suspend;
>  	u32 hal_desc_sz;
>  	bool fix_l1ss;
> +	bool support_ext_cc;

supports_ext_cc

But in ath11k_core_supports_cc_ext() you cc before ext, maybe it should
be the same here as well? Something like:

supports_cc_ext

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
