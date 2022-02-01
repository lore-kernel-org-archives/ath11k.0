Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E117C433EF
	for <ath11k@archiver.kernel.org>; Tue,  1 Feb 2022 11:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CxiYWK2yIYn38W8MIjSpYScVSvFcREciY823RQA3i7I=; b=LlRYDU1ydsq9QN
	STUCnctfc4PfWXa4ANh2Hbo2mNUm+uUMGf/gmxB2HXgoCNgfetyMwFH2i0Ry4Z1tYmC7fXtitOs6E
	+i7GJxzCTPl1/L4wPXCdDxiuyYG4G8qj6pwpFmMaX0tl3k6V2kQGXPZgLXNUPDvN+M55SwoWZtg+A
	F5BvuPLn3MjBXfrsiGTstWwDCcYYbaUPKoOuV+Fp6dQhFvw+x81gZHl4orDSYLvLU0K5vCdjDMxR/
	9fHCUWl1sSKtRmUsHpEYCN0VcW4FLOWWgp6YcIPTOUGS4WXN2wpFHWbAyWmRTvWoR9eZL/rUaOmax
	cPVFFRyYsui3HruszxeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEr3k-00BoK4-10; Tue, 01 Feb 2022 11:10:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEr3h-00BoId-IY
 for ath11k@lists.infradead.org; Tue, 01 Feb 2022 11:10:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D60B7B82D4D;
 Tue,  1 Feb 2022 11:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4E37C340EB;
 Tue,  1 Feb 2022 11:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643713846;
 bh=kd1PiIvWlrvMaOSL6ESELAiFm2KXwdfE6zpQTszXga4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=qnxY7TEsQJNngjIPEbrhY/6oSgPg2DJA3MOPzXilVO9VbspuScM07UL0TtkDvujQQ
 XztsoIl7uLXIsMY7L6dc+wsXta0iiCDRxs6qlfKtQKeJmV0LPDJdwF0/LCVw1jUOiH
 QBll2Z4/fNX2+j/Skzynh+RVuZ7/IccfQiVW/0sOqfHDXMj0FnhFreO9kBYCzLoIv6
 tMRJUKlZ0VCfxXZayj2iNEEb1CFbHunFtO3rzTbEeyDXlClDOQGIlb/7JdtvSZT/L3
 ZkrCCcZz03A4TK1n1+I9luKb7ZtdrZXb/cUR240E9Z44qU1iWOfPv2rMQ8J4BPe3uX
 aYlbGbcr3vTVQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/6] ath11k: Add basic WoW functionalities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1642673607-8896-2-git-send-email-quic_cjhuang@quicinc.com>
References: <1642673607-8896-2-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164371384161.32371.4031122545237409876.kvalo@kernel.org>
Date: Tue,  1 Feb 2022 11:10:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_031049_805517_1F9238BB 
X-CRM114-Status: UNSURE (   9.30  )
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

This didn't apply and as you didn't use --base switch it was impossible
for me to try to solve it. Please rebase.

6 patches set to Changes Requested.

12718491 [v2,1/6] ath11k: Add basic WoW functionalities
12718496 [v2,2/6] ath11k: Add WoW net-detect functionality
12718492 [v2,3/6] ath11k: implement hardware data filter
12718493 [v2,4/6] ath11k: purge rx pktlog when entering WoW
12718494 [v2,5/6] ath11k: support ARP and NS offload
12718495 [v2,6/6] ath11k: support GTK rekey offload

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1642673607-8896-2-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
