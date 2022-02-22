Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A079BC433EF
	for <ath11k@archiver.kernel.org>; Tue, 22 Feb 2022 12:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7B60Y0xrDiJk7ty4mchE9urmF7m8DmxVPKKDBhiN+w=; b=SXHKHZs8ZyxF2v
	/vJIu7JeOa0Gugry2tE+D2Eutbw1A99cEU6S23K7NwLmEDRegn1rE3XWrYkstInRF59lxNrFHHQCk
	Tm46pvd4RFu2wYGwQX+G+UMScR18iIHsx/z/0ag5+M4pHIrRidMLWlRMMT9w0L1HUHdtMvc523am/
	fYeuZ2Ea0r19f9EnLb1v/8mVkm711kH3Ms57jkpUO8lMEb6V9Y27NMfjL8EjjYjXp9NP1N8K8pgdB
	pjQZLNJ8AjG20zWTbspWK1qL51RVcxkRoQH6nIR/kApafd89OH+nfRQwB8JJWozqxPEdBKQdiD35c
	bz8usyFjyzGf6xf0lC2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMUgJ-009bJr-GU; Tue, 22 Feb 2022 12:54:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMUgF-009bHs-Dg
 for ath11k@lists.infradead.org; Tue, 22 Feb 2022 12:54:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 428AFB81998;
 Tue, 22 Feb 2022 12:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D136C340E8;
 Tue, 22 Feb 2022 12:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645534447;
 bh=dXqjlHx6NRP390GNabsxU/VYrxNeR5w2ee/4YEFhFXg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=X524N/88RQi3c52hfEdysK4op/XXXW091N4iSZvD/2Opjp5f7J+lFwZm+dJesTHxt
 GKhH+cbAlirv07Thaj/ZSXxTHuG2V332Io1FG/KscLO5IIfJ+6HTZ40HHAMHysTyh7
 bUf0iiLN3qqX+xkYvCXk4OyWL63RH7H3rassHQSuWwCFU35wxfE2cL8SuR0XLpNUHo
 1Zg6Mu7nhEiOzy0t+w4dSnSSHqiitNHyBDDxQzSBVBs+xlSagFktW1JXh9tpjxFylF
 WHttAhiC3aqn97h740D14jZSgSAjc1SD2Xgi3qV4NPrbhb+4X/GHL7Ixjvbit6SjTT
 Y4qhhHpLBzxbw==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/6] ath11k: Add basic WoW functionalities
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
References: <1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164553444424.23898.1586617399462118980.kvalo@kernel.org>
Date: Tue, 22 Feb 2022 12:54:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_045412_133100_BF1FA961 
X-CRM114-Status: UNSURE (   8.95  )
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

This patchset adds new warnings:

drivers/net/wireless/ath/ath11k/mac.c:7284:5: warning: no previous prototype for 'ath11k_mac_flush_tx_complete' [-Wmissing-prototypes]
drivers/net/wireless/ath/ath11k/mac.c:7284:5: warning: symbol 'ath11k_mac_flush_tx_complete' was not declared. Should it be static?
drivers/net/wireless/ath/ath11k/mac.c:8218:34: warning: cast to restricted __be64
drivers/net/wireless/ath/ath11k/wow.c:409: line length of 98 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wow.c:527: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath11k/wow.c:528: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/mac.c:8111: line length of 96 exceeds 90 columns
drivers/net/wireless/ath/ath11k/mac.c:8168: line length of 92 exceeds 90 columns
drivers/net/wireless/ath/ath11k/mac.c:8188: line length of 92 exceeds 90 columns

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1644308006-22784-2-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
