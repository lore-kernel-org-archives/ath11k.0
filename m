Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C83C47088
	for <ath11k@archiver.kernel.org>; Fri,  2 Dec 2022 19:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xqV3DR0vCbUOQPg5+Asp8Z8XXHjh8OJYPNZ699CpiTU=; b=py+gckLwd76RS2
	UDbRfGs/whVsRbPN0n1A4rbI3n0s13CXfjD/M39gZATKXIW/IJgTT/rNBXLorjL7AtbjcZDL6X5Lh
	+d+7H9WVbBgdtT80cXy5BaMJKBkIzowEHCkirPoiZ3GP8fdHGKLkmRYQzSVkjuHPbVrlb2BRU7yHD
	FvTszUwi6TsK23Yl3ju75M3UHqeDvHUTYKew3JK2DiqlQ8mokaIz7lnoqHEmZPC6etRk6tNxOV1si
	Lp+2timA1UhcSh6pkuRpB/f/Ifr+6llOuxrW7KAxdHRrkoH4YMxPzwOVAQJfv+mO+/90Bg9etL/QW
	8CJjrUmGD4PqM0qkDuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ByX-0016eH-UF; Fri, 02 Dec 2022 19:45:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1ByU-0016dQ-V1
	for ath11k@lists.infradead.org; Fri, 02 Dec 2022 19:45:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4EF56B82274;
	Fri,  2 Dec 2022 19:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF3AC433D6;
	Fri,  2 Dec 2022 19:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670010326;
	bh=+vuLtTA0VXJm+0+wd3FJqvgQoko7iiNr/V34abeWt+4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=AeMR5nZ1GsW19O1s90l2bgS//XMUCQfX7zk79BPSO7Hi13KQ4Nlm5asBzN9WmPmpG
	 Vpua0CmP3atR2KzhsvxOvOfjxWFn0qgspXhllfkAAE4ZucnEOkFo7L73aliLDLWOWW
	 sDHFxU0ZbDQdwQMvJexcSvQAXjt6OTY5LhcHSFRjGcxOvw1zwDye6+1BPf6bLU5uO7
	 G9ZoFNHGcBmhe/StsaFWPRlKnyZVyT8NW4G3ddL5X3zH3/Z/eCzSC6xbBcRvAL1yZg
	 1PgKqXkNSiMhZMNJiLY3BTF1qEGBk/Z28WO6H3ocoMeLlkuch0jIboAW0XmJ8FBNK7
	 /iGxe5RNgTkKA==
MIME-Version: 1.0
Subject: Re: [PATCHv2] wifi: ath11k: Fix race condition with
 htt_ppdu_stats_info
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221124071104.22506-1-quic_kathirve@quicinc.com>
References: <20221124071104.22506-1-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Govindaraj Saminathan <quic_gsaminat@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167001032276.14016.8815714083482597468.kvalo@kernel.org>
Date: Fri,  2 Dec 2022 19:45:24 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_114531_176743_7CE3E060 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> A crash happens when running the traffic with multiple clients:
> 
> Crash Signature : Unable to handle kernel paging request at
> virtual address ffffffd700970918 During the crash, PC points to
> "ieee80211_tx_rate_update+0x30/0x68 [mac80211]"
> LR points to "ath11k_dp_htt_htc_t2h_msg_handler+0x5a8/0x8a0 [ath11k]".
> 
> Struct ppdu_stats_info is allocated and accessed from event callback via copy
> engine tasklet, this has a problem when freeing it from ath11k_mac_op_stop().
> 
> Use data_lock during entire ath11k_dp_htt_get_ppdu_desc() call to protect
> struct htt_ppdu_stats_info access and to avoid race condition when accessing it
> from ath11k_mac_op_stop().
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e44de90453bb wifi: ath11k: Fix race condition with struct htt_ppdu_stats_info

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221124071104.22506-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
