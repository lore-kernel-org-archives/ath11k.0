Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C1BC54EE9
	for <ath11k@archiver.kernel.org>; Fri,  2 Sep 2022 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TS2qDby90LFzF7KNWmv91qsg7yLiGuRydypP0j5SL9I=; b=F2sc7r2IcJmwZL
	4a5Y21GMHthrAtOeMVxsMXhTXVDARU3+SyvRKTXUYrdBuER/cU89Ve/FxIR32XtIhl5igdcgJawAp
	f3ze2U+MgB3ojVFR5iPalWpBCkJeRwUkTqvfhyNNLmmZiiN8E1hTtoecz1eKyBfKpQoiWuKOeTgyE
	CeoTdlEQybJr8YAZR98b0cOxkBcdaYT1d5En9QF4xyTV7SikJdgPOmmTcNeb/72+FCTbUTMuseW+1
	6W3uzXZcGWM++atuz3M49ixsizGKbHeJTryz3KjFQOOuYiXSjKxeSCgojdypv9Lnx0dXuxZdR/J8g
	/Z88kJyF1SB8lBaEoNcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5vA-004arw-OZ; Fri, 02 Sep 2022 12:37:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU5v8-004ap8-BX
	for ath11k@lists.infradead.org; Fri, 02 Sep 2022 12:37:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EFC89B82ACD;
	Fri,  2 Sep 2022 12:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0558C433B5;
	Fri,  2 Sep 2022 12:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662122231;
	bh=9Op9odOExBlAnpTT0YXqKzP+UiRsRxe3E3JcNy37xdY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Fprsi1qWCKCGcQmDnpbV2aneriA9QuL1RSFFRCrB7/IRYWWaMXpePNS0d/D2bqoKg
	 0Or0O5CqeJ9WDP6g5qKuEWqjDX3QihY4IlKv9d6Gq9MaF/XUKFkVdiEIOD83WNhyGS
	 zayo2+YyzpmlNoDAvoo+RT6cvBey2kDbUEowumawtkgeUcaNhvctp1RgY7WGx0E+4R
	 HPH/JyXRGdvtYU6MeHPOH1xTt9foJ0BeevJ8v4I0GaVksjU3qNhoJW4sMfBdgR5IMR
	 puhEwZwXw23V91EEeezsAMk2s6BojwKKfYbI0j4nsDl7pvXHxkcVPFFCyz00XcYAxw
	 HOE/gW2yMTOmw==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Enable threaded NAPI on WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220720135113.15755-2-quic_mpubbise@quicinc.com>
References: <20220720135113.15755-2-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166212222808.10242.13626602156198198987.kvalo@kernel.org>
Date: Fri,  2 Sep 2022 12:37:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_053714_578556_34930D31 
X-CRM114-Status: UNSURE (   9.96  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Enable threaded NAPI on WCN6750. Unlike traditional NAPI poll which
> runs in softirq context and on the core which scheduled the NAPI,
> threaded NAPI makes use of kernel threads which are under direct
> control of the scheduler and helps in balancing the NAPI processing
> load across multiple CPUs thereby improving throughput.
> 
> In the case of WCN6750, enabling threaded NAPI has improved
> 160 MHz RX throughput by nearly 400 Mbps. This should give similar
> gains for other ath11k devices as well, therefore enable threaded
> NAPI on all other devices.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Fails to apply and no base commit provided, so please rebase.

error: patch failed: drivers/net/wireless/ath/ath11k/core.c:111
error: drivers/net/wireless/ath/ath11k/core.c: patch does not apply
error: patch failed: drivers/net/wireless/ath/ath11k/hw.h:205
error: drivers/net/wireless/ath/ath11k/hw.h: patch does not apply
stg import: Diff does not apply cleanly

3 patches set to Changes Requested.

12924009 [1/3] ath11k: Enable threaded NAPI on WCN6750
12924011 [2/3] ath11k: Add multi TX ring support for WCN6750
12924010 [3/3] ath11k: Increase TCL data ring size for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220720135113.15755-2-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
