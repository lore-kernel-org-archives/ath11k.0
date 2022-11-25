Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DE6C4332F
	for <ath11k@archiver.kernel.org>; Fri, 25 Nov 2022 11:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hU6khm+4Zj0Fn0+JCpbGkFnvV6hA0/hVj0xXFOfEjUI=; b=hJIGusMVX21Xi2
	gMy5W8nBKznrTk6EIUKcHGqeGTPyqW7hND8mzLctV1/jsuXIFvYJzRTzZyI7v98/5oYfzjAwgo8Xh
	VpiSjfjvOsG++tTLAw4ZhMLuazBJCnnjkTJdnIJXBt3DCauXrR+Rg6VkRNcBMG8vn2U5CCffod3ml
	+6l7d0MDsXTp+qMqvsN8BSKg+ohftS45HdvwBSTZEC8md5UmT22As+5idUYzj+sPdLBHXOZbUL76H
	5be4vEz0t0/Sc6w35hY7hvJuMQQDSbv+6IvyK1KzbdA7yLCtrwe+QB8lOUKWgMxlO8KPM4APTeFPt
	R06rZikB9+UHSix5ztOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3T-00GCJ5-Nl; Fri, 25 Nov 2022 11:39:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyX3O-00GCFz-Ad
	for ath11k@lists.infradead.org; Fri, 25 Nov 2022 11:39:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D32476239D;
	Fri, 25 Nov 2022 11:39:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2476FC433D7;
	Fri, 25 Nov 2022 11:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669376373;
	bh=HnT47jn1b2f+jUwOPSH3bufQf+SsU7lXvXnNQX6JnKI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=DvWP+8b8z0LEiP/d6XX9TUZQ7hHGOo92/Kkg+Aipe4leCohLdBr8d0Gw1XftL6XQT
	 1U72hZPo9ECr0R/GdIGeUqQlg5BcMEgyXHCSg8NFYxSMQZphH9fEgavtR7zEUtukxJ
	 gT4Q/S2QmeDhm3SfLadEXn/2Yjd/R3I9o1B7uEiiaN9in+3VRVwECeWUQ0MlWa5X7C
	 ToAMDKXc6IlI+AXOWU9bCd8xIrKUVkZQQxVtX/xXfNJvp6d+IC8BMqe/8mTiu/0wKa
	 1S0NYrR5npYBhZtJ4V0gC6mI1pT9B5ToJpVttNeBXRsZQa+yZ1mlBhcd8A/bA4RXMF
	 4CaBIkiJHr0Dg==
MIME-Version: 1.0
Subject: Re: [PATCHv2 4/8] wifi: ath11k: remap ce register space for IPQ5018
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221122132152.17771-5-quic_kathirve@quicinc.com>
References: <20221122132152.17771-5-quic_kathirve@quicinc.com>
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sriram R <quic_srirrama@quicinc.com>,
 Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166937636895.32083.4258390402302531375.kvalo@kernel.org>
Date: Fri, 25 Nov 2022 11:39:31 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_033934_451463_EBF4DFB2 
X-CRM114-Status: UNSURE (   9.41  )
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

Karthikeyan Kathirvel <quic_kathirve@quicinc.com> wrote:

> In IPQ5018 ce register space is moved out of wcss unlike
> ipq8074 or ipq6018 and the space is not contiguous,
> hence remap the CE registers to a new space to access them.
> 
> Register read/write is modified to check if the register to be written
> falls in the CE register space and corresponding register is written.
> Also adjust the interrupt register address to ce irq enable/disable.
> 
> Tested-on : IPQ5018 hw1.0 AHB WLAN.HK.2.6.0.1-00861-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Co-developed-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This patch added a new checkpatch warning:

drivers/net/wireless/ath/ath11k/ahb.c:287: Alignment should match open parenthesis

I fixed that in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221122132152.17771-5-quic_kathirve@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
