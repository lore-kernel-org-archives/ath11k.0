Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B758C47258
	for <ath11k@archiver.kernel.org>; Thu, 25 Jan 2024 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3NyWN24gHWnqWKO8AFBYEP0ZJfPMTc47OSz+p0C894=; b=1u40t4idlWbdIuXz9e3VX1+kPU
	khwDas97QPn8J2fIyCvpL63lYuqCB1p2dX+sgDsqHF7/FFvy5u9uA6E0gAeXE1fAOrppUBbhy3n6b
	Txe48K42g5V0ngMJHfsrEivotv/MYJoxIfRu3+ODOB79pcL7mMa7HP4PgiAgn34KDGzxddlWYUe4K
	AbPRbssUibPRnd/H9bWbiuIPR2gFhOOIbrBaDGHE5C8I/1JHULHKYVGeUrHC36Qv1SsfJPWysWAwU
	pZqXU1K0fk1sPOXmAwyZnZ059JdxTar/gK7Y09DYG6t+dXDMuV4cWAM38Mfit6k/9WoOCz2QnAZVK
	e8wntHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2pr-00000000spW-0nCl;
	Thu, 25 Jan 2024 16:44:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2p3-00000000s9u-2VB3
	for ath11k@lists.infradead.org;
	Thu, 25 Jan 2024 16:43:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B511C62262;
	Thu, 25 Jan 2024 16:43:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E96C43390;
	Thu, 25 Jan 2024 16:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706201004;
	bh=q2idK8n/E6MaATBa7r34B0Wjj8fT6oqpM5c7h4sKBUM=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZwB2xaio3PdSa/qTT/NuJ1TAWYgSKAwVyK8dhP1WB0vtuQHsN/9Ki7qQjGSWQ03K7
	 AxpNRDzh6QhlPBxzYWbT/Z55oP7GCX7YTSSj+Dqsab0WrFX26l7sHvFrC/DdOO3BtM
	 xhxe8BTraXG3PZNJy1eISHDRFqwDR7l7DMz7wzxCC35taV/JpXq3CQDVz76TPVeQMo
	 oXXeGpC9j3bZ2nDh0gX6DAO/XBLSNatVZDSXh6vsM01Qdt7RQxngW/DAA7uFtsnj9h
	 3p73PRy42KTd6kLvd/7Y1gZEqwHtvcipGo/ANEcaFtc2cOuX9td/7YqAWg75so0oQy
	 T+p26i8S94t4Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/4] wifi: ath11k: remove invalid peer create logic
References: <20240123025700.2929-1-quic_bqiang@quicinc.com>
	<20240123025700.2929-2-quic_bqiang@quicinc.com>
	<bb75794e-e475-4736-9dcd-a4c9e9633e8c@quicinc.com>
Date: Thu, 25 Jan 2024 18:43:21 +0200
In-Reply-To: <bb75794e-e475-4736-9dcd-a4c9e9633e8c@quicinc.com> (Jeff
	Johnson's message of "Tue, 23 Jan 2024 18:05:23 -0800")
Message-ID: <874jf11hzq.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_084326_197799_71A39BCD 
X-CRM114-Status: UNSURE (   9.89  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 1/22/2024 6:56 PM, Baochen Qiang wrote:
>> In ath11k_mac_op_assign_vif_chanctx(), there is a logic to
>> create peer using ar->mac_addr for a STA vdev. This is invalid
>> because a STA vdev should have a peer created using AP's
>> MAC address. Besides, if we run into that logic, it means a peer
>> has already been created earlier, we should not create it again.
>> So remove it.
>> 
>> This is found during code review.
>> 
>> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>> Tested-on: WCN6855 hw2.1 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
>> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
>> 
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/mac.c | 16 ----------------
>
> My Qualcomm Innovation Center copyright checker reports:
> drivers/net/wireless/ath/ath11k/mac.c copyright missing 2024
>
> Kalle can fix this in the pending branch

Thanks, I added 2024.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

