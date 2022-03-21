Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11C4C433F5
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvjeN1v06JMG7SnePR/vxdjwyStW5d2VmL8a1eEM/qU=; b=TBudZ2zo2rRMhc
	7RJ6BaGGHoqu4afwKUkwr34SjiSGRK7Mp/GSOKGA0qPQtssf0pQMxw5pBTot9L/2dTzuaPJDfuWhp
	cGJwH1yxCh14dYvRADfbsGMp2LLbfzha9BBQtky7JVtv+MYyEZ7t6swX8DR2lGR7BGX9VSXuzgkeC
	uDWjOgCOmj0wFZHghN4gXusxoTMWAMDttpKIK6lO6/yQK9Dqboftbpaf5XU0nIzEr/oZaoDhf6+Hh
	owDRH0WmM5upNmYcVBYGPR9xKtFIoYd+WIMaJBqAI370ne1V/iBtpYPY4Jk42Si+AYWTUm27ObRwN
	MuVNgoYpRkDNFBmM8N6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWFyV-007Qu0-Ho; Mon, 21 Mar 2022 11:13:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWFyT-007QtJ-AP
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 11:13:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DC6276097C;
 Mon, 21 Mar 2022 11:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C377C340E8;
 Mon, 21 Mar 2022 11:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647861200;
 bh=37HumeelAmj+a06ozPKOjEhe/rB5AW/qq4uImdHyqvg=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=cC+io+UwGcOs7TEL75cKfjk0/lfmZcSzdQfWaGJkYYXmN8frE9usrd5HMe0qAnmoD
 pYtdnOIMDQ+iH26QTTsnfHV2tXupHnKjysnCcCAmzQl2X7qYvF64A+tDgQ+sOQ+aid
 z0ZQm+hxHRrMDFjgxJB/QeuVlXjLMJT16RLPSAzv16Yos+SnOGC1x9HnFm/qZ/xZXq
 uBkTR+18coUpSUE8lGOQLIdCrov04WctaKoNso4ALEAaHowNXwTJAbHj29PmbyQYLk
 gi76yduy9oxOaJKD552y9u5uO146E5fC6jchVkM/UVfzovPFX52pYDXby48kQirZow
 oe69kDTONvRYA==
From: Kalle Valo <kvalo@kernel.org>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/3] ath11k: add support muti-type regdb data for WCN6855
References: <20220319023543.14288-1-quic_wgong@quicinc.com>
Date: Mon, 21 Mar 2022 13:13:14 +0200
In-Reply-To: <20220319023543.14288-1-quic_wgong@quicinc.com> (Wen Gong's
 message of "Fri, 18 Mar 2022 22:35:40 -0400")
Message-ID: <87v8w7mud1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_041321_426166_E87E3AF7 
X-CRM114-Status: UNSURE (   9.59  )
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

Wen Gong <quic_wgong@quicinc.com> writes:

> Add enum value ATH11K_BD_IE_REGDB and enum type ath11k_bd_ie_regdb_type
> for regdb data, the board-2.bin will include both board data and regdb
> files.

In the pending branch this conflicted with your varian changes:

<<<<<<< current
		ath11k_dbg(ab, ATH11K_DBG_BOOT,
			   "failed to fetch board data for %s from %s\n",
=======
		ath11k_err(ab,
			   "failed to fetch %s for %s from %s\n",
			   ath11k_bd_ie_type_str(ie_id_match),
>>>>>>> patched

I used ath11k_err() for now, but I suspect I need to change it to
ath11k_dbg(). Will no better after some testing and review.

--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -954,7 +954,10 @@ int ath11k_core_fetch_bdf(struct ath11k_base *ab, struct ath11k_board_data *bd)
                return ret;
        }
 
-       ret = ath11k_core_fetch_board_data_api_n(ab, bd, fallback_boardname);
+       ret = ath11k_core_fetch_board_data_api_n(ab, bd, fallback_boardname,
+                                                ATH11K_BD_IE_BOARD,
+                                                ATH11K_BD_IE_BOARD_NAME,
+                                                ATH11K_BD_IE_BOARD_DATA);
        if (!ret)
                goto success;

This was an easy compilation fix.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
