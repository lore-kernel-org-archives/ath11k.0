Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A01DC63797
	for <ath11k@archiver.kernel.org>; Tue, 17 Jan 2023 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cj8ShWaLW0Ou+LB5BDL96NGSVdiMHQaWy6dMIj1LXj8=; b=IVK9jZmqyc1Ebq
	6C61bcq+7NpeJNTXndSbEk8+Ljmh2tTUdcqanVCd6rC7c3BOEdpdyoP0Zcuc/aGDQBufGxdkq8Jrq
	dyNUo7tGpSk7PyIF1Q9xrx2MFg3vjcS/iIyQMQWHuw9fN3x+RNcSnGrasmrGeqjiDVXefFvGLshs2
	yZCRqG1Pja0M4a88e3LEfTPTrBeBra1lFA7lI4mO4CBgT/1/ByZMxRlJADIAxPSR0xSvYEP4HNlhk
	qd/amj/oxUH5+JLXdnvb+3Oheb6bqeC/bx2r/9KU8abSLSgT5G4EeyJe9z7iT/QzsF3mNa4Yow3LO
	xn9TW5gPHYeYz0wHKp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkaB-00E6Lq-PQ; Tue, 17 Jan 2023 11:56:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHka7-00E6L9-EG
	for ath11k@lists.infradead.org; Tue, 17 Jan 2023 11:56:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id E1561CE167D;
	Tue, 17 Jan 2023 11:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EB2C433EF;
	Tue, 17 Jan 2023 11:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673956601;
	bh=uMTwJm5FbyRiVc4apPUTenb7cdmMLbwyCZ3qBedQA3w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nWJuBV1B6Z5jln5Mf37s+/6xjouVnRNyYgGX0QDn0R3T+zUcN5fLp3KgZaPI9b29+
	 +0/SFK2QmoFVmoMEGnx/0vewwoipOXfyZgrKsEZq4FkeID2xsP/txzuIqG6Axhe6y5
	 R3+H8KSiW/iHeackZU7+igP8pdB23iXXVTy5QNJsBQ941FfCkxQ9NkQhbcu903gchN
	 1QJBlORemaeNu89RCKl9ssRPqEc1PhvL+Q1LRs2m7TwiEmQ4whk2SpWpBCwFA1Xlwa
	 FdTE4+N9C4HM4+qW3nwI1AsHobAQoS5KTLnSC2+He/X0KtQfsuUBYesXiTKpFQLDo2
	 OAFqqlH/Ye9rw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Add support to configure FTM responder role
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221220044435.10506-1-quic_rajkbhag@quicinc.com>
References: <20221220044435.10506-1-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167395659797.22891.14339771925238967315.kvalo@kernel.org>
Date: Tue, 17 Jan 2023 11:56:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_035647_717317_9A04228B 
X-CRM114-Status: UNSURE (   9.32  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> Fine Timing Measurement(FTM) support is used to measure round trip
> time between two nodes.
> 
> Enable FTM responder feature using hw_params on supported device.
> Since FTM functionality is offloaded to firmware, adding the
> interface allows user space to enable or disable FTM responder.
> Also add support for advertising the same in extended capabilities.
> 
> QCA6390, WCN6855 and WCN6750 do not support this feature.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a27c6a5853eb wifi: ath11k: Add support to configure FTM responder role

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221220044435.10506-1-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
