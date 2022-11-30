Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF751C433FE
	for <ath11k@archiver.kernel.org>; Wed, 30 Nov 2022 12:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NCxckxXYiW3LEPwjae9FDaYoluIZ7poiIpb+/cL1MU4=; b=NRW9l0OKTjVAuH
	o23qD4P9WuC/rlhsDJYBxtXrlKQpLMAkHy1GNaZTeUk7xgQHuK291/Or/TuV3uiAZWoaSCeO3vsB6
	J3Rfobfa+ezbrGM1jft0lP53fn/qezyhQj/QmLk2ZkipB7jtUOWGw32FJrDQzZhwBerf+lUYphrbH
	a882/MuGip3Wkol7eNLBmTQz0p835e7y5E4QfQ+3d/mAU4seaWU/4dNIpsskGWe+/Ls2K6xZhShEW
	yhPf/iGrCMlj5sLpg1kUOXm1pBTHoa2Xp4PVZYDUalZDPW8t3isrU0IYIdJmGsfXVIqqc1FZq71sp
	ToISz3a7gFwxosFiwpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MZw-00GHrp-L4; Wed, 30 Nov 2022 12:52:44 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0MZt-00GHpr-Rh
	for ath11k@lists.infradead.org; Wed, 30 Nov 2022 12:52:43 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 98B1168AFE; Wed, 30 Nov 2022 13:52:36 +0100 (CET)
Date: Wed, 30 Nov 2022 13:52:36 +0100
From: Christoph Hellwig <hch@lst.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, ath11k@lists.infradead.org
Subject: Re: ath11k vs ar_qrtr?
Message-ID: <20221130125236.GA865@lst.de>
References: <20221130122807.GA31720@lst.de> <87o7so4nr2.fsf@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87o7so4nr2.fsf@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_045242_055440_34A24A29 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, Nov 30, 2022 at 02:42:41PM +0200, Kalle Valo wrote:
> Sorry, not following you here. Are you saying that "select QRTR" is not
> enough and we should add something more?

Yes, there is no runtime dependency right now.  Something like
using MODULE_SOFTDEP should solve this.  Untested for now, but I can
send a formal one after I make it past the initial installation:

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index b99180bc81723b..72d043fc6b7c2c 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1945,3 +1945,5 @@ EXPORT_SYMBOL(ath11k_core_alloc);
 
 MODULE_DESCRIPTION("Core module for Qualcomm Atheros 802.11ax wireless LAN cards.");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_SOFTDEP("pre: qrtr");
+MODULE_SOFTDEP("pre: qrtr-mhi");

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
