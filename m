Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543E1C04FFE
	for <ath11k@archiver.kernel.org>; Sat, 11 May 2024 09:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+WycB2YAsjO+E5DYvt4MDUNnl4ND7Nk5SQa0ZLYKYwo=; b=rS6OS94nfeIHW8kyPdOTDMP+MH
	R4oXecpKtvu7ls5zbNELcu+sLkiSGz5pTFnZDAeFWp45sA5NVrBZNU8iLptaOOb8TmiBDcVCYFsuA
	RB6At3B2x/w2LyOQAsmSQ9LconJ0KGmRu1VdZsK92QNuV3lBOoSiQgPwhivFQ5969DHIJ6sCIqzlb
	a3H4H/WS6+cN9vnFCDANRAXtFTNS/31Uczg9uI9RS5S8/PUlVW7zQZTccoXYm9t+aedvKDmeBhHI+
	0Zu4nXV8TbqCFf0Ku3qEZuDob9VLFTKyW5H9TRtyMd2SDDPLUzaXqffAhpxiNQcnt2blWU7MBJ4rB
	a3q4f+Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5jRH-00000007fU3-3TRv;
	Sat, 11 May 2024 09:54:47 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5jRE-00000007fSx-13I0
	for ath11k@lists.infradead.org;
	Sat, 11 May 2024 09:54:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C825ECE0500;
	Sat, 11 May 2024 09:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A08C2BBFC;
	Sat, 11 May 2024 09:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715421277;
	bh=ZQQRlOIbe5G3/XXT9O32i9R08P6Fbwe16RrU6g6dlrA=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=SCWiW1bLFKC0bFGAcGB+g9dUz4zN0VElcdHdlKb+t+nEHHLZCQfzR129GzFjvg9VZ
	 R00GatA/AfK55ay5Z07rywf0nEmCi20P0arjv8F+wLoE1+1tlr1uPQongkMSxuPxqw
	 f2mVJhmyPI03e4iQAdC6FwDChg+yFimLjO8j/WthYOA+XY6Nj7ew428xpPJRyS+I92
	 BZW+rTjO1JsA4OPTmOM3CN47KZtvIUrcFmOh2LlW8Dd3HC3YChE1NIrr6Hrp7CBBXz
	 E5zK6yVEWrxXbY8QHXkaWfOT9qJgucLkDELvtlmZyvBLbjDLpCvQlXE/jBbiL5kDkG
	 xmqedPriZsqtw==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
    regressions@lists.linux.dev
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when connecting to 6 GHz AP
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
Date: Sat, 11 May 2024 12:54:33 +0300
In-Reply-To: <20240424064019.4847-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Wed, 24 Apr 2024 14:40:19 +0800")
Message-ID: <87wmo0k71i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240511_025444_496378_E9ADD5B3 
X-CRM114-Status: GOOD (  10.39  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> With commit bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> ath11k fails to connect to 6 GHz AP.
>
> This is because currently ath11k checks AP's power type in
> ath11k_mac_op_assign_vif_chanctx() which would be called in AUTH stage.
> However with above commit power type is not available until ASSOC stage.
> As a result power type check fails and therefore connection fails.
>
> Fix this by moving power type check to ASSOC stage, also move regulatory
> rules update there because it depends on power type.
>
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>
> Fixes: bc8a0fac8677 ("wifi: mac80211: don't set bss_conf in parsing")
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Oh, this fell through the cracks. Commit bc8a0fac8677 was introduced in
v6.9-rc1 so I should have sent this to v6.9 but it's too late now. I'll
need to queue this for v6.10 via wireless tree.

Adding the regression also to regzbot:

#regzbot introduced: bc8a0fac8677
#regzbot title: ath11k: connection to 6 GHz AP fails

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

