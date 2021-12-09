Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEAFC433F5
	for <ath11k@archiver.kernel.org>; Thu,  9 Dec 2021 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8bkRHizB2wBv10e92KrJdrFr+YpqhQzNLJAMWTgdo8=; b=MwJ8ARvPkMcuX8
	aZI47yuPiXIPoTx32MkyiuC7fhBWJeaGkUtHg1YsQJBieRy90koZOFCCestzxbinpcmLGWEH4RMcG
	iwSsoht9y6eSu8HFGwRMcC7e/46XayRl7YUvUmISxrY1hM1XI4Yyzqvt4BQj1xeBq9WvoHIJAZcHU
	qxEbW4ZOTnbcGhi4OHRs0SY4QgDbsujGd0KmN/OCyCPV6Vthagm1clZrna+ai6voer4DpHBj0OFbI
	V5pq5SCWjV/r4SZJfZvgeiwqzEkwPPXMfphOc+ZRbuC32J0nGR0a6HvZ/YRM8MU6rpbKDQN36Whh6
	99cXsw9oHaDTohAqUwWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNdi-00H5GC-PC; Thu, 09 Dec 2021 17:55:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNS8-00H2AI-9b
 for ath11k@lists.infradead.org; Thu, 09 Dec 2021 17:43:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 890ECCE278D;
 Thu,  9 Dec 2021 17:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8602AC004DD;
 Thu,  9 Dec 2021 17:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639071808;
 bh=I83CQb/ibuEVnt+IEDLl9+ht7ZHvXZrH38RcSDi0N8w=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=KtjC5r0qS1hCnAcu0F5AjrPlCTBjL3BL9BKDPJwqX4QxAQkCZvRxsr99YII/bKMcX
 UFwFAbgBK/IYE+mJhoZ62IJwrLnENBl0uVx9T05D7becAnFYiUtelxwVzUIr/uwzON
 egECooQ5urHyEq16bZK2YasAj21p34u9KUbNR5wlTFF9ewDUFiNuVNh8tYt+4PvMrC
 Sd3epUCtUbvo1fmsUUnusNqi8McXQ0WuYelQ0ntu4lT0iffPCWL41k5uYQJGdNBEm8
 tbxr7QhAQkCAZ/FBpsK+RiE62QSeVqCWy7wQw3VlC5g7K/o+GwfNFYw+UZqwVMCFcN
 WFPTGTHZbAeWQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 00/15] ath11k: add support for 6 GHz station for various
 modes : LPI, SP and VLP
References: <20211026111913.7346-1-quic_wgong@quicinc.com>
Date: Thu, 09 Dec 2021 19:43:24 +0200
In-Reply-To: <20211026111913.7346-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Tue, 26 Oct 2021 07:18:58 -0400")
Message-ID: <87lf0tvflv.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094332_758531_B297FB07 
X-CRM114-Status: GOOD (  14.50  )
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

> It introduced some new concept:
> power type of AP(STANDARD_POWER_AP, INDOOR_AP, VERY_LOW_POWER_AP)
> power type of STATION(DEFAULT_CLIENT, SUBORDINATE_CLIENT)
> power spectral density(psd)
>
> This patchset is to implement the new rules for 6 GHz band in
> ath11k.
>
> ath11k parsed the reg rules from new wmi event
> WMI_REG_CHAN_LIST_CC_EXT_EVENTID and parse the
> transmit power envelope element in beacon of AP
> and then set new wmi cmd WMI_VDEV_SET_TPC_POWER_CMDID
> to firmware when connect to 6G AP, also support backward
> compatibility with firmware which not support new wmi
> cmd WMI_VDEV_SET_TPC_POWER_CMDID.

Looked good to me, had only minor nitpicks.

> It depends on the patches of mac80211/ieee80211/cfg80211
> ad below links:
>
> ieee80211: add definition of regulatory info in 6 GHz operation information
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a1ef61825469b874920f4afb889e1a92353680ff
>
> ieee80211: add definition for transmit power envelope element
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ad31393b98e4addbc5f1ccc484bfbb8d07c92056
>
> mac80211: parse transmit power envelope element
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b0345850ad770c5164bf6d4a0aa0c40ef2419cb0
>
> mac80211: use ieee802_11_parse_elems() in ieee80211_prep_channel()
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=37123c3baaee4d6a189ad4abad804770d4a607e8
>
> ieee80211: add power type definition for 6 GHz
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=405fca8a946168e71c04b82cc80727c3ea686e08
>
> mac80211: add parse regulatory info in 6 GHz operation information
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=cb751b7a57e50d356ec8fc7712c245a05515e787
>
> mac80211: save transmit power envelope element and power constraint
> https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git/commit/?id=63214f02cff9ebd57be00e143de12107c66f5394
>
> [v5] cfg80211: save power spectral density(psd) of regulatory rule
> https://patchwork.kernel.org/project/linux-wireless/patch/20210928085211.26186-1-wgong@codeaurora.org/

To reduce number of conflicts I recommend submitting the next version
only after all the dependencies have landed to ath-next. And remember to
--base, it makes it easier for me to apply patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
