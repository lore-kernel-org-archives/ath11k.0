Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 462F9C7EE29
	for <ath11k@archiver.kernel.org>; Fri,  9 Jun 2023 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qhNtBLUmCOhFNx/uq+y2nwRLS5nxpnBRZBT4JxAVWbQ=; b=g0LoHTRknSueZR
	K/b7oeW+PSDB82wKal1gPaHvR1Dt1h3MqRv2f8qVUzHrKHGJ4zaYwY4GKiDnE4uMP+xbbRH0nJg+f
	RZuetAj/qF7Szzd1bamfc4B1WvHVMZIFeXnyd7B3KBEl8LYRds6BM6nqrq83fvLIFC7pVGxDqkjAc
	YHycbMGnPz5XHWPuiUJ8+SP2VzdwJ6VAq7SIVEbmIa3YQIYUyazs1N2gQYyKKQOzRRgapC4ySRdyG
	1r+qBQ4Y1ALvX6f9+zApH5QnAZUOjK9DoylItY63LKr/rfqildeY6o8cegWfdEAcO9cQfpomSL06t
	RyPqwco475bISGwtROGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEv-00D8g9-2S;
	Fri, 09 Jun 2023 13:33:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7cEt-00D8fr-0P
	for ath11k@lists.infradead.org;
	Fri, 09 Jun 2023 13:33:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5F8365198;
	Fri,  9 Jun 2023 13:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CB9C433EF;
	Fri,  9 Jun 2023 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686317594;
	bh=7BwFbeazrEVoJL4FmncCiczT3/uCanGLr7VBtUGZT1Y=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dRtqaGI9SFaRhiwDihIPHXVkljRYdS4Ar+76dpUAejON5DOIgCHZDk38PWkBehEwg
	 ++XEeO3J8ue/Tog6CiIrvngZv912JqPStruqF1C3JD3RQftV3/SQP1dU+OsxcAio8y
	 XXeQklV9B7yERGR6rdSoKtz3iksnPOzejqCqxTIeXNCVxtm6QORmY0BtBRWboGnvbK
	 q/sxosiGmNft2u22bkpaR89932ux9uZMw3Dr03U9zipV7JE3ZljZ3klTpSB6Z5cnRT
	 hnRcw25lAkfso++29pnZpP5c1idLEMnxrnRBAKDYQLL34qlQxexqhzCF8J7A8FeduI
	 hVHnBOwBe8mhw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: delete the timer rx_replenish_retry during
 rmmod
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1685355238-3282-1-git-send-email-quic_haric@quicinc.com>
References: <1685355238-3282-1-git-send-email-quic_haric@quicinc.com>
To: Hari Chandrakanthan <quic_haric@quicinc.com>
Cc: <quic_kvalo@quicinc.com>, <ath11k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>,
 Hari Chandrakanthan <quic_haric@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168631759075.7235.15045413984427960673.kvalo@kernel.org>
Date: Fri,  9 Jun 2023 13:33:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_063315_230338_10B3F81D 
X-CRM114-Status: UNSURE (   8.41  )
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

Hari Chandrakanthan <quic_haric@quicinc.com> wrote:

> The rx_replenish_retry timer is initialized in ath12k_core_alloc() when ath12k
> module is loaded.  But rx_replenish_retry timer is not deleted anywhere in the
> code.  It is supposed to be deleted when ath12k module is removed/unloaded.
> 
> Delete the timer rx_replenish_retry in ath12k_core_free().
> 
> Found during code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e2d1f005d3fb wifi: ath12k: delete the timer rx_replenish_retry during rmmod

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1685355238-3282-1-git-send-email-quic_haric@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
