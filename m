Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0059C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Feb 2022 10:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UofS5SOrBRqDpki0wOvL/ea9q4cqyMydp6lfa+yF6w0=; b=oJCzQ/2CtMWdk0
	PqGXAZwSP+baPGaQAKq/T/v0Z1E+6uzd8vo/nx5rMlihqSJnRRCxFRDSVNAJ6R2gUB8XquACTZe/x
	2kJT7nW+/+Q9AUf0zTI+jG85GylNGPmHdGwX20XXTI3GIhsCrZcQs8x1vFizikVNxhfheIYV4bFOz
	RACO7OlvreB3mW/JcOB/ZH0JmBom5uLlevJEVwSwmyZBcYx77MR8QBlZYXLI6LBp3tE5oHc8/O0B4
	QH36wKzU3GShswEvLjtA1h5Smiy0moQHN/jjCU2KQbV3x5Dn8z99UOqw0CSQG9NU/pGGU7VUr2dig
	Rc7N32t/c4d6oZ1CODxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM6Ie-0057oX-06; Mon, 21 Feb 2022 10:52:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM5vD-004vNx-HK
 for ath11k@lists.infradead.org; Mon, 21 Feb 2022 10:28:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DDF95B80F10;
 Mon, 21 Feb 2022 10:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AF5C340E9;
 Mon, 21 Feb 2022 10:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645439275;
 bh=QoDql9tYlW8GV7mtDaOUYo+Yma7AQ017sPcM/GxlMJc=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=JuNAu8JeTu7SVX6ztbfjj4TDCDbK7pXAQFqTtd+Ml2pdELEdzqlUDbRYrryf3O0HO
 CqDVDHEGIkGvQcsqSmtauodhGzYKSzJlSZ9oN1GQYyMb7d0J62ZSDqjie+aElnygJG
 Rt3hlzfeUx9NnHbHpCaH0Unm5ospKh5Tm+Ubr3VBY1RNbgNPmMb7EN5QGrkba5dJmP
 uiJBwNBZgLw+3leKM+xl1yfILrsb4y55Ntr3EQtTZWhRzspO3vzZUArJX15oNVmDOI
 6ntiowre9fUDty1AF+EVEgIuYgBGOR6qRRf6EJxV7EzeDMZbAd9dNOKLD98hlgU2RA
 c2A6RSI5Z3HzQ==
MIME-Version: 1.0
Subject: Re: [PATCHv2] ath11k: Invalidate cached reo ring entry before
 accessing it
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1645000354-32558-1-git-send-email-quic_ramess@quicinc.com>
References: <1645000354-32558-1-git-send-email-quic_ramess@quicinc.com>
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rameshkumar Sundaram <quic_ramess@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164543927154.26423.3128388488663976690.kvalo@kernel.org>
Date: Mon, 21 Feb 2022 10:27:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_022759_971436_CBD4ACB5 
X-CRM114-Status: UNSURE (   9.88  )
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

Rameshkumar Sundaram <quic_ramess@quicinc.com> wrote:

> REO2SW ring descriptor is currently allocated in cacheable memory.
> While reaping reo ring entries on second trial after updating head
> pointer, first entry is not invalidated before accessing it.
> 
> This results in host reaping and using cached descriptor which is
> already overwritten in memory by DMA device (HW).
> Since the contents of descriptor(buffer id, peer info and other information
> bits) are outdated host throws errors like below while parsing corresponding
> MSDU's and drops them.
> 
> [347712.048904] ath11k_pci 0004:01:00.0: msdu_done bit in attention is not set
> [349173.355503] ath11k_pci 0004:01:00.0: frame rx with invalid buf_id 962
> 
> Move the try_again: label above  ath11k_hal_srng_access_begin()
> so that first entry will be invalidated and prefetched.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6452f0a3d565 ("ath11k: allocate dst ring descriptors from cacheable memory")
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

f2180ccb52b5 ath11k: Invalidate cached reo ring entry before accessing it

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1645000354-32558-1-git-send-email-quic_ramess@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
