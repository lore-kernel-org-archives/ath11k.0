Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7ABEE14D3
	for <ath11k@archiver.kernel.org>; Thu,  7 Sep 2023 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDahJsDRS5llbeIO2QOK9rdoE21lfXHImq9TIXaowmo=; b=hHW5X6e0BA6kmU
	uYeH2bxRXts93U6lG6f5Qqm9r2BxV5a1XnhCVbvycN/CBilJaRf2+uLA/r21UgMakDZXelQZ7MvMZ
	ieS9aMXuUf+k7JJ2JyjdUU1vVcp8+fqSBMQe3cvBX/LrSng4MxFWr9fiwEk9g/hfyF0iUPvd0y0B6
	KnsnXSZNNKHW3xbt25yzMJrK4V9+Rg6jb7+Bd/k0rvKILajGy6c7/4dUalfIdLsLCGSiH/sYj3y35
	jZ+wV/IALZSR1tqheVbZyr7gmTTpHXnB/84Lsc16SDkD5S8zdSwS/9g3IFEYt43sCDNSVKozUq5YK
	6gMflYszRnbhrV/bZfNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qe7km-00BN0a-1A;
	Thu, 07 Sep 2023 05:40:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qe7kj-00BN06-1G
	for ath11k@lists.infradead.org;
	Thu, 07 Sep 2023 05:40:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C5DFBB81B8C;
	Thu,  7 Sep 2023 05:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A587FC433C7;
	Thu,  7 Sep 2023 05:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694065226;
	bh=I9zsuRYmffLM0EYhWrlnzmHtKFkhLwFCNBVhQmDXsJs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=iBaty8r33cok/YqIQZWOr5yRQ6tst6vd7I2uqVwccJ13r0uai89ZTo6AhqAbh/RbO
	 ZUOqoQOVQtIuQaOJQ+4CYoEkmx7ziKVOaM6IgUe1iHioeaCet+Mlf8fXg1ilU4nPdW
	 CIfvTDoEO2BOUKIEVNj/YuZOdbIHP8habNYYzu9DRO6dhS4BvGmIQ7s90K1qmSWUDl
	 x9R817kkWdt+T57887mLWevuBIFmfuj7diAt9dyf6ong2jq9iM8kAr6z5f/krH+ds8
	 uMrWRyEvGKfJr8f8NhQZfcw9FyaqvKz+TQmH5QHwi4ihVOxhIxLcB3JkkRx+DF4LHx
	 FtvbcSlpZV6tA==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath11k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2] wifi: ath11k: fix boot failure with one MSI vector
References: <20230907015606.16297-1-quic_bqiang@quicinc.com>
	<ecdcae51-6f31-43f9-a7fd-299f20777263@quicinc.com>
Date: Thu, 07 Sep 2023 08:40:23 +0300
In-Reply-To: <ecdcae51-6f31-43f9-a7fd-299f20777263@quicinc.com> (Jeff
	Johnson's message of "Wed, 6 Sep 2023 22:06:33 -0700")
Message-ID: <871qfaee2g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_224029_578046_58FD10EB 
X-CRM114-Status: GOOD (  11.18  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 9/6/2023 6:56 PM, Baochen Qiang wrote:
>> Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
>> PCI common code") breaks with one MSI vector because it moves
>> affinity setting after IRQ request, see below log:
>> [ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control
>> response completion, polling..
>> [ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
>> [ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
>> [ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110
>> The detail is, if do affinity request after IRQ activated,
>> which is done in request_irq(), kernel caches that request and
>> returns success directly. Later when a subsequent MHI interrupt is
>> fired, kernel will do the real affinity setting work, as a result,
>> changs the MSI vector. However at that time host has configured
>> old vector to hardware, so host never receives CE or DP interrupts.
>> Fix it by setting affinity before registering MHI controller
>> where host is, for the first time, doing IRQ request.
>> Tested-on: WCN6855 hw2.0 PCI
>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>
> Tested-on: WCN6855 hw2.1 PCI
> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-01160-QCAMSLSWPLZ-1

I can fix that in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
