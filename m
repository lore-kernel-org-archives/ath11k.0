Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B15C433EF
	for <ath11k@archiver.kernel.org>; Thu, 10 Feb 2022 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubl+Zy0oCcwCEZynfjOfsHpiX5CSTL/JnC5/W0TRtTM=; b=4Qfe0oNYrkIBhX
	Xy3XHKcTx3Tw8EV3L60LUNurks0q2noDVz4zHGtsW1uJaAKSc87VSU4gDxKqi3vYODeT/rjSJvAXN
	cpiB+TXdo1hMjSKMGNLDbIeAwMXkPI1Q2+F3+bGhbU1Jefy6rxjt35qXNYAbyPU/tCMrHVsAL8zdN
	wns6bgr+6YiyYeisaFGAcjOIIp1L+s6aMcqxAsLJAaT4feJeM3dx/7BjvhkvnPbpBz/LJht8x0USs
	A/ChskuA0Ir7rNwN/5G+5hgwSG9o3krgk0kYPmLUGZz3rpBg0oU7wiMXtHJ6Ijh/MTVWob+G6B/jm
	bXWHLJAsLbeUG4VO0rYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI7nU-003dMB-E1; Thu, 10 Feb 2022 11:39:36 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI7nI-003dHB-Id
 for ath11k@lists.infradead.org; Thu, 10 Feb 2022 11:39:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F1BC9CE22F9;
 Thu, 10 Feb 2022 11:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A75CCC004E1;
 Thu, 10 Feb 2022 11:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644493161;
 bh=EeIa8X3/BEq9686ub9eq26xWgWXw4Ny1RcXApBLAiHE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=PiFnVzQtpdt9/FNq5RtABJiN+4VdbE6ZJBGMNo9AOxZyxeweHjWoX9R0/i2S0GHq/
 AbJvHjkAtPmkSTHdX9svLV1qkESEZaL66e/GuB0ab2SNBYweSXp55Y/WYm9cyfnmVW
 3+NETiSEgdgtFLW61lboblgzCSHzJACZtOr3CUkV1aU7sKwsuYi1LVOSx5YjZOidWZ
 nO6i/Y82UU1lWJwbkm8BpLGcBDB/OvKVKPR5CMWDMNRhh2VL+K2fY/TSY5vyrIzNiu
 ytmKKGWtawwTg4tNi+aXidF14rHDXBx8XarfySJLptFsij71CErG+x/b9NPckDgnbR
 NA4Q8zk2LTmzw==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] ath11k: Add basic WoW functionalities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
References: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164449315590.9031.11345020274622525440.kvalo@kernel.org>
Date: Thu, 10 Feb 2022 11:39:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_033924_832633_017248AE 
X-CRM114-Status: UNSURE (   9.16  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> Implement basic WoW functionalities such as magic-packet, disconnect
> and pattern. The logic is very similar to ath10k.
> 
> When WoW is configured, ath11k_core_suspend and ath11k_core_resume
> are skipped as WoW configuration and hif suspend/resume are done in
> ath11k_wow_op_suspend() and ath11k_wow_op_resume().
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch failed to compile:

drivers/net/wireless/ath/ath11k/mac.c:7242:5: error: no previous prototype for 'ath11k_mac_flush_tx_complete' [-Werror=missing-prototypes]

Fixed in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
