Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDFDC47422
	for <ath11k@archiver.kernel.org>; Thu, 25 Jan 2024 16:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkzOD/fulUKa7whNkl9ln+RqnfukefqIVWZDTC+QjkM=; b=4ko+85elHcoI7mgiyRmVswOXQ1
	kk4S0vOhyMJLSjQv9hDs9Fm0jDoqjs7ItmzMo+TCFTVNLjnvBZ+5IRUn68tS0swn7kr/JV3hXXxM4
	1Xs8tq8VMBeZ8kBetLyaFdOCmutHLAfMk9Ehzvaqdiq6PWVoWn2AnlkFUgdlufjQMYk6ASPg/PW8T
	R+CMEJUKD8K9p7SeI3hUNk7FYwEucTixEXM5OWkLFoAVTU3KlyT2MKS0wjXg1gebdeOvL+AWWpPrZ
	je21okwyktEFS5MG+ft0V9ZPrlLnzs0uMPm0TJJEM8rsVLrxzJT0YhiNHEmbvfhS3ap5Aq/mdL+Vp
	/xjZ6bBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2qs-00000000tau-0CK3;
	Thu, 25 Jan 2024 16:45:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT2pt-00000000srv-3eFd
	for ath11k@lists.infradead.org;
	Thu, 25 Jan 2024 16:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22B956217D;
	Thu, 25 Jan 2024 16:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E26C433F1;
	Thu, 25 Jan 2024 16:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706201056;
	bh=wcCNop60hgk2j5yhVDqKEmLRVykIVtyvwQqWxiqbSlk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=uaRJQtQIAbei8YJM7J6brVdZNuT0jxerVh/3uNw7N0uebStc/lyeNYQKps69RRsiI
	 0lpVfXpYU332k+xo1VdYftU7/78fzbF2Vz7jFnUVAJHfp2kF2UGKdTXikdpFSxmBAg
	 lGjgKaV6oDxAbIACztxpf3VHHXdc22cGwDb+d+bgohXYGE38x4mUs1tTlaecgcSkRr
	 GIsoTzaOK45RzrXWkKHX4TB/zCGrAfaSeYmP9I9SrQWG+zaZv7bTvgYgi0ELXe9C9p
	 5UPU3EYL1JfacgKtMxFJOS7HIWIZvLNDhu54+dEYqFptsHoCIxGyk1ZWOYqbTGLhE+
	 KQ8liHRZpCJHg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] wifi: ath11k: remove invalid peer create logic
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240123025700.2929-2-quic_bqiang@quicinc.com>
References: <20240123025700.2929-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_bqiang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170620105373.504797.9989085853141323864.kvalo@kernel.org>
Date: Thu, 25 Jan 2024 16:44:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_084418_181523_93C37B99 
X-CRM114-Status: UNSURE (   8.78  )
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

> In ath11k_mac_op_assign_vif_chanctx(), there is a logic to
> create peer using ar->mac_addr for a STA vdev. This is invalid
> because a STA vdev should have a peer created using AP's
> MAC address. Besides, if we run into that logic, it means a peer
> has already been created earlier, we should not create it again.
> So remove it.
> 
> This is found during code review.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> Tested-on: WCN6855 hw2.1 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

171203f0c409 wifi: ath11k: remove invalid peer create logic
629642fa8b25 wifi: ath11k: rename ath11k_start_vdev_delay()
ce59902e56ea wifi: ath11k: avoid forward declaration of ath11k_mac_start_vdev_delay()
9d5f28c1366f wifi: ath11k: fix connection failure due to unexpected peer delete

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240123025700.2929-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


