Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301FBC433F5
	for <ath11k@archiver.kernel.org>; Fri, 18 Mar 2022 15:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmwSTcfjuoqUIosD54F9Da324Mu9NgGNtZR2NS7EHAk=; b=R8VAXztZy64uis
	Uj0deAQJkjf3R+1Cd8olMmSQZDBaiPUYvK9ShpCJyPsQW7XLDZGy9EGwzX98/2Fhq+0BUJmnCyzaV
	VC6giqBPHVGobKyqxOEmKRuO082M3ym4aWDhh+dkwVKFCRdMMXNL2OoqFodhsCCgZdrsr4BSt1N5U
	Odsqh7Gp+wGrAc4iBXBUz/cuVSOMqYZaexBLnuwq+bR3jtJY3fqXQMESMMHIq/wKhXBwo1sotqA9P
	pYqyAkYmYPd8I9I4A8U6haST2T/0gmN55vDfFCnu+BewqWrNqzhP/5g/W6vsKQD4UuEB/J5EzjVln
	BJeDrV4M5Ig9O3D1jTCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVEfP-002INr-Er; Fri, 18 Mar 2022 15:37:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVEfN-002INZ-1C
 for ath11k@lists.infradead.org; Fri, 18 Mar 2022 15:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 867A4B82456;
 Fri, 18 Mar 2022 15:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DB6C340E8;
 Fri, 18 Mar 2022 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647617841;
 bh=yG6GKN0QjG+NaDFavP6liDr4c6Co2c817z3BufnzAu0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=hQjEbL5jn4+4a7ZfA4/O4plDIYrr4+JgPAxWELCt1UYNegyWIzXghgKKdvqvQqSnP
 uLncILr7F2JZ5VDXLU+azFMUbi2mWL/Kj6ALG3hu/UW+l/cjLBf+TsznOXY4tPPfbk
 E6C9FV2sHAd2xBTNDSEyE3icLMppHC/+xXHzHqxbHBMU9KyKwu9FgyoM7H2pOn3PiJ
 wlGclaf8/a5+tggnYmRbanJpaMGSncl/+N4ttMEXZi9zxABJrAKU+RJbCTAe2f351V
 pbNo4tjaRCVisiWSGez/cbfQNcM/lW3Ib33ZSjIv/sBzhUK1XO3XpkULkFXh6IOEeG
 sVKeszvHXKRjw==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] ath11k: Add basic WoW functionalities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
References: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164761783674.655.6579747484395583481.kvalo@kernel.org>
Date: Fri, 18 Mar 2022 15:37:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_083725_284228_AAEEBCCB 
X-CRM114-Status: UNSURE (   8.07  )
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

6 patches applied to ath-next branch of ath.git, thanks.

ba9177fcef21 ath11k: Add basic WoW functionalities
fec4b898f369 ath11k: Add WoW net-detect functionality
c417b247ba04 ath11k: implement hardware data filter
90bf5c8d0f7e ath11k: purge rx pktlog when entering WoW
c3c36bfe998b ath11k: support ARP and NS offload
a16d9b50cfba ath11k: support GTK rekey offload

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
