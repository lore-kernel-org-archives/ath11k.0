Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF26AC25B75
	for <ath11k@archiver.kernel.org>; Thu, 23 May 2024 12:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS8NGmRKPyHVeqoNrF/0pqKzSE8vUptW/3HTmYxN59g=; b=wh2xs9eVaRnsAFWII/9vyAvHce
	EsIGZaabSxVQMQmm+9Vis/xr/4AXzJP8UE+0A3zC2l4UfwnbJpablAKxnBSJ7HauNcVJVMQMg/mi+
	zT9NQ8ciYfFAQFzgb1LNM2SH42W5KyLbrI7H8iDX4/RcnFJIjm5bBwQPpLS/RRY/9T8LC+hSrdeuZ
	hcN6OX9qtwVrXJJhDovimw64aXmmZoQfjrx4JZ185vyn2N/tzcchakeM5UUJkw9z1sRVEisE6v9zP
	GgjaXBCXOc4vgOBoDBmNLoU5ST8rHUyXvPPEmvQ8FJvR6d0n4F26ps2E5uXjDPYXWevHac5GmY4qB
	zi0coecg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7rh-00000006Eae-2TIw;
	Thu, 23 May 2024 12:48:13 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA7re-00000006Ea9-1fc0
	for ath11k@lists.infradead.org;
	Thu, 23 May 2024 12:48:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 499BFCE1717;
	Thu, 23 May 2024 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86F49C2BD10;
	Thu, 23 May 2024 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716468486;
	bh=mw3AjiCutiW5+eW1CEA3+1A3NI+qqQKSV7bBWw+3fjY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=b1TppuyfHaDkLG+zR2kEdUMzGxX7W6VLxyicvyEaietYeTmVXKCxmrNFYPYnScRN5
	 vjJ/lyjEo7xU+Dx1v+LP4LXgW1PK+TYHtNRuamyM0VMNm7YMGzwV8GPRl5752HLoUl
	 FwQAxtZ0n43T3rYwhNR8eRax+YnrPBkM0vZ/R+tvpAlxTVltVNiOM6RDuvp6i5+L7X
	 UngRfLRK2P1NCbOH8hLT/6/4o+B+ALR2bZGRvWYXwYFlmtMcCdGqH9QExE6O1/OqKy
	 UQ0DNSZW9jNKCLb+s8dc23EDaNCD8K1Z61AGhdTVKblztCBw1XBS3CbnzR4nsQBKE9
	 LbNBOgSvbJ9jg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath11k: move power type check to ASSOC stage
 when
 connecting to 6 GHz AP
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240424064019.4847-1-quic_bqiang@quicinc.com>
References: <20240424064019.4847-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171646848396.213015.14022235573584346331.kvalo@kernel.org>
Date: Thu, 23 May 2024 12:48:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_054810_668075_CBB77BAF 
X-CRM114-Status: UNSURE (   8.23  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

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
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-current branch of ath.git, thanks.

6e16782d6b4a wifi: ath11k: move power type check to ASSOC stage when connecting to 6 GHz AP

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240424064019.4847-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


