Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B9EC6FA90
	for <ath11k@archiver.kernel.org>; Thu, 22 Sep 2022 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+GqmYWRx9xIWh9KL0Iqtagj/y0kCGGCYXHHcqnatDI=; b=QQRD3k4mcbR7yJ
	2bJsmynlOiFW6vLBWheXJ4GUSHA8MeZvWkXR0UPPlxzz19enJ29mR0wFgbtrdViL24VNGkvuxW8LQ
	qlND9CDys1I+gSAa+xtuh05D8+pKw9yo1H1go1/pPADIABaWwjSg/1O/p6NcOAMffRyhAmu8XAYFe
	ZFIt5mZXbOfz8t4D21+uTO6df9ngHu8y6zkc9C6UOCJSXqY3Zvbaj9f86N5LL3xbWhJzF9Oei8uGX
	WL0QytCOOsy2hUpvSYN/odXlg3udUyZpFsEmCvjn1FgHPd0uGDxYwtvPaohnMFCJ3Gfq5Ux6t92hC
	wUoFuM+OkOImGx0OxcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGdV-00DqAb-A4; Thu, 22 Sep 2022 07:28:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGdR-00Dq8o-7j
	for ath11k@lists.infradead.org; Thu, 22 Sep 2022 07:28:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A4B9663422;
	Thu, 22 Sep 2022 07:28:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68048C433D7;
	Thu, 22 Sep 2022 07:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663831716;
	bh=OETM/LB+WTZFmvT1tGIOQMPKrF6tiG2SAGz/f2wY4ng=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WkOYrqt4UXyzt6Iqtnh2Em8oqX2+LgbOYjgjZgBx4TrxznmZgzzBV3FZkuDIxjF7O
	 cDGobuzax9iEOs5GmM8pwth5tZS22M+1MdH6MRFby2jq2RbofhVMKG8qarfro3kqoM
	 2+Lvs+kSSIeRG9wQeYQI6kGAOHHOtLXeMuAeI9Q3BUh2/vyUkVb8YFFeL1rc/nGOgO
	 AVjn/8pe8F6TyrgaD0yQN3+5ffPGO6LUKP5QVTWAN9mkyGNm+PwGuciW3aoVG5btRC
	 X9kKkUmE1icB8Q/IHwLXCuZ3U51X3QB3PhjMf3d3hxdPtIVUFGAPLZSERmS3Jfc3KJ
	 oCz5rOIZ4A5ZA==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] ath11k: move firmware stats out of debugfs
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220603082814.31466-2-quic_adisi@quicinc.com>
References: <20220603082814.31466-2-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166383171041.28267.6068680325009994115.kvalo@kernel.org>
Date: Thu, 22 Sep 2022 07:28:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_002837_399173_AAE5647A 
X-CRM114-Status: UNSURE (   8.93  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently, firmware stats, comprising pdev, vdev and beacon stats are
> part of debugfs. In firmware pdev stats, firmware reports the final
> Tx power used to transmit each packet. If driver wants to know the
> final Tx power being used at firmware level, it can leverage from
> firmware pdev stats.
> 
> Move firmware stats out of debugfs context in order to leverage
> the final Tx power reported in it even when debugfs is disabled.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

ec8918f922b8 wifi: ath11k: move firmware stats out of debugfs
9a2aa68afe3d wifi: ath11k: add get_txpower mac ops

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220603082814.31466-2-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
