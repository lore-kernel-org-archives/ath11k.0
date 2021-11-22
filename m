Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AF8C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 07:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNtvHDT2jscsG3oX3bLygZ8M7HmeftkS1QmjHTL2ubg=; b=cjX6eAMMRiRBz2
	wvR5wqTvLlUuEMiRSzmWWiPAb9qQj/QuioiAVzai38BBBTbPMqtREsBi9ixgpm0yHaijz/wZBGAf2
	zZgfBm1ISfdX4isBGpCNE15rPyjxqhLyTqgNNjNKKvgQq+2fA059ov4VJ/O46obu9lKnSUkShjxI5
	xNQZqlbH6CfHw/zrUSJeda3KDh2GCYAuRAc4LNxRV/PkxJLAwSZSo7FmaZqoc4M5phQQTAbC1r1lz
	CXzSVD8WE+iWv2cFrBrTPbgqDK2K5JiQfHiz/WT+CcZV2ZrYD2FCMa/+oyZTs0E4WtrYjkgPVQ35c
	ym01bCEKgHK2h6PFQXXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp4Dg-00FBkQ-UY; Mon, 22 Nov 2021 07:58:33 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp45W-00F8vp-Ud
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 07:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1637567403;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0gdg1FSFGyxW0lvWu+LflLbkR/UOZICZKnBsBMx7Ppo=;
 b=uWEtgS76KE/QI07Ra2SNxC/vxT/VL4ThaAe5RuLGXe2gg+NgATAq/pu9zrqANgZqiLh2kK
 EDTTvSIwpB07wI+zfiYg9aAmo1GAxHsA0aqqFMsFjz5L1DGKRh6Aw89F1fw/zfwWAhPeeN
 0j7Z1Ug5Ca0QpQvjEqpCD0KNF6HuX/A=
From: Sven Eckelmann <sven@narfation.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v4 2/2] ath11k: Use reserved host DDR addresses from DT
 for PCI devices
Date: Mon, 22 Nov 2021 08:50:00 +0100
Message-ID: <2802525.9g7TWp2vRq@ripper>
In-Reply-To: <a6f4fd77b1f8729368fee13a435fe652@codeaurora.org>
References: <1637504521-30997-1-git-send-email-akolli@codeaurora.org>
 <1724585.GBsqGgcNsD@sven-l14>
 <a6f4fd77b1f8729368fee13a435fe652@codeaurora.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211121_235007_209337_8F4B93D1 
X-CRM114-Status: UNSURE (   9.99  )
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

On Monday, 22 November 2021 07:12:27 CET Anilkumar Kolli wrote:
[...]
> >> +			start = reg[0] + reg[1];
> >> +			size = reg[2] + reg[3];
> > 
> > See my messages for v2 [1] and v3 [2]
> > 
> > 
> Thanks for the review,
> 
> Here addresses are always within 32-bit.
> so I will change the API to read only 2 integers and update start 
> addresss and size.

The size of address and size depends on the reserved-memory node - not the 
qcn9074 node. So please don't make such assumptions in your code.

Kind regards,
	Sven




-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
