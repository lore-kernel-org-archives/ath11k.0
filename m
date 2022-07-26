Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69AAC00140
	for <ath11k@archiver.kernel.org>; Tue, 26 Jul 2022 17:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBrRArMAcoa8xRP4VC2ZVtOoDIy33GSgRTnfiuhHYUs=; b=PEIFj/d8FGAJhm
	ks1UEgE/gKthCncZz73l/7HMv8qoawZs6cXYRleTMX0buFWsQFsU9bfzNfoNQSY9NyCSMbUHhIjlC
	qhFdpqZZNJquQ20U6zAxxrBAI9nQM+MahmgqJlz267qH1GrPHxsVH4fbc2XiPSv2c+DczK7Jn+Nkp
	HE4Z8DszYMakT7fejv2CnsAgGcnUnVIknrkQKQjBwBirw2KnzN2SCNJNi2ChWXtstNvhEiUyv2IOV
	DvaSDdNeOPqzHeAaZqhUW6G4/7i8yMU/ReijfkNoUAvcAOKSPvyCycGuI7cmV44zbZQXqiQ5RgJVp
	NTwxAie1xAgTXzv5NO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOkw-001pOF-3M; Tue, 26 Jul 2022 17:54:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOkt-001pLr-Dp
	for ath11k@lists.infradead.org; Tue, 26 Jul 2022 17:54:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E84D660DDC;
	Tue, 26 Jul 2022 17:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32FB8C433C1;
	Tue, 26 Jul 2022 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658858042;
	bh=MTd2fTAvNUmuqKVSjZqDvs/4KSGaAZDJjBUdCfoNxoE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AHu3lwB8caO18Cqx0Six5fBB537DDG5SgSwgYiwM0v6qFGFJhI71wp8keugPVtw4j
	 hTyDNOQHmw5yTDfki9yvxdV9S2shoC6gYPKRALh21LlChG6UEi4gwpmcqAHWT3plsb
	 hCAWJME/nUa9QvwvunQMQEKCrLMWwZWFzFdliUXhlqssALibwVqLw3TcOwI3yIbGDC
	 Dym5hs6AoIAFfvFJTCWcOCug7AuEDe+adoW8w0gcKllsofJEypQiujmeiKb3kLch0K
	 qKcTKyMvCdHAiOsxjRTY33nnDDlOnSLaPo105MHwqX4apmhHBm+2GxYSMH7hTEfSCR
	 GSBikSfYUdNuw==
From: Kalle Valo <kvalo@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>,  quic_hemantk@quicinc.com,  loic.poulain@linaro.org,  quic_jhugo@quicinc.com,  mhi@lists.linux.dev,  linux-arm-msm@vger.kernel.org,  linux-kernel@vger.kernel.org,  quic_cang@quicinc.com,  ath11k@lists.infradead.org
Subject: Re: [PATCH v3 1/1] bus: mhi: host: Fix up null pointer access in mhi_irq_handler
References: <1658459838-30802-1-git-send-email-quic_qianyu@quicinc.com>
	<20220726080636.GE5522@workstation>
Date: Tue, 26 Jul 2022 20:53:58 +0300
In-Reply-To: <20220726080636.GE5522@workstation> (Manivannan Sadhasivam's
	message of "Tue, 26 Jul 2022 13:36:36 +0530")
Message-ID: <87czdrrc95.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_105403_525336_4681AC05 
X-CRM114-Status: GOOD (  14.40  )
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

Manivannan Sadhasivam <mani@kernel.org> writes:

> +ath11k, Kalle
>
> On Fri, Jul 22, 2022 at 11:17:18AM +0800, Qiang Yu wrote:
>> The irq handler for a shared IRQ ought to be prepared for running
>> even now it's being freed. So let's check the pointer used by
>> mhi_irq_handler to avoid null pointer access since it is probably
>> released before freeing IRQ.
>> 
>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

This fixes the crash and my regression tests pass now, thanks. But
please see my question below.

Tested-by: Kalle Valo <kvalo@kernel.org>

>> +	/*
>> +	 * If CONFIG_DEBUG_SHIRQ is set, the IRQ handler will get invoked during __free_irq()
>> +	 * and by that time mhi_ctxt() would've freed. So check for the existence of mhi_ctxt
>> +	 * before handling the IRQs.
>> +	 */
>> +	if (!mhi_cntrl->mhi_ctxt) {
>> +		dev_dbg(&mhi_cntrl->mhi_dev->dev,
>> +			"mhi_ctxt has been freed\n");
>> +		return IRQ_HANDLED;
>> +	}

I don't see any protection accessing mhi_cntrl->mhi_ctxt, is this really
free of race conditions?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
