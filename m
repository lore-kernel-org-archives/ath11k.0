Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E69AC47088
	for <ath11k@archiver.kernel.org>; Fri,  2 Dec 2022 19:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWhewcatrEVNAhIJ9DCzn4jpeYUh7WIMhT38aumxvIs=; b=l4M1OX+q/8rT8m
	FlTUE1gkpg1OVpRU6G/VZPVMR80wfAvVr+T13OZbf3BF/CY6RHaa+gS6mnWIZb2T2lviG/m4L4zxU
	X9mwc/NCj4GPTBoJepyxxInCFjmD3mHNiTf486pOajU2fpMweocR3OA/2Liru8yUZ3pqrUT1eygG1
	JAPt4h6rEJ9CiLq88fh6OXxAVA+VSf32CbpjZ3zaP/LL8nCVZGXvG9RJD0EK8Tl64BTIapocsT9dE
	Qp/8phi375YytPrw6xpXDQfFjwD3NFf/yPGzqXSj8A3ijKQp2llitGxEB8LkDB+D2WDbt9hE+cx7K
	zkt4aVDoKg96dSF5K8nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BxP-0016WZ-T6; Fri, 02 Dec 2022 19:44:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1BxM-0016W4-Ul
	for ath11k@lists.infradead.org; Fri, 02 Dec 2022 19:44:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF11162035;
	Fri,  2 Dec 2022 19:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1963AC433C1;
	Fri,  2 Dec 2022 19:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670010257;
	bh=z1mnKRXZKTS8eedlEdEeB0UUSYlcIX8Zc5mLsq2A76s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=GGeePiwEb6FSiXMFlkn/kJLqF/Vfv8CHKxvJ3O3ted72FFvLhbQfUqIZ/UBHYgOc+
	 xKBGuNyhflMLtszMXddms2zy6pXVez/ZWFyKFmGvgVv+gwPFavvGf+NTddRzpMOLJm
	 3Kw3w+AMv8RtujfTtfCOeCe21FWX5FFj002117j3Wo3o8UREopwT8rLy0Np7UTWt5g
	 dr7oNlv1Hrc/kCSmBoYjBOZ/cMP9fsosfc1nBnVCDEQ0KJFhjvR6e/rUjLVXVJN4cs
	 cVyx3qG+W6hdS5/tEgE5tIkyR1jvQLeKJ/yrb1fahef4aXs99lQfPP85WT+brc5ZRk
	 zMedDfllnLiew==
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
Message-ID: <167001025076.14016.10499660209048981214.kvalo@kernel.org>
Date: Fri,  2 Dec 2022 19:44:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_114421_063095_777EC829 
X-CRM114-Status: GOOD (  10.00  )
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

I cleaned up the commit log.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221124071104.22506-1-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
