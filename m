Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5FCC3DA42
	for <ath11k@archiver.kernel.org>; Wed, 10 Jul 2024 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9mJkUPt4UJ3Y4ns7HzhFquauADMdAVRbeVW9YGGaYiI=; b=oxOpXkmmItsW7kUipE7u5FHcoc
	3BlgM/BfwNNOv1++kNtElrlvGsR0rSS37ZgKMpTtUmy4PQGJ7F2H6vVSU3sJQGe9Jezlb1QSf00r2
	VXOsD/BG0UaBgeqLPds4R2hVzQQxxVQml++GBiSZhQ5HY3v8nqVxxI2evYHO9VVmkgv7wK+bgOjQH
	MrbRBXrpjAShRcUTpE99+FcYDMfJ808FDqL38yhFpL1dWoeNcvME/BCE/e/yueeLEK0CCnTqurCMv
	OOZazVwsVvp2RRpq+OWOivBsQ0XUCW2X9sL91EuKyT9Y+FNCvWWyTi1TVYFuDfWmyAb5IoYfCciWt
	9aAULbxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8D-0000000B8cX-05b4;
	Wed, 10 Jul 2024 16:25:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRa8A-0000000B8cB-0VVb
	for ath11k@lists.infradead.org;
	Wed, 10 Jul 2024 16:25:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6444761A47;
	Wed, 10 Jul 2024 16:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA77C32781;
	Wed, 10 Jul 2024 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720628721;
	bh=I89m5qBk5w3SDf6qsuZSZrcga7EqvfjuLokGSkIuM7E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=L+g+T2M+WYqA26K1VE/ll5FF9JdGR9goUO4OLDh3kImzxIqs4IW+qtmxIVxJjX5aI
	 DkBLhgvJl0j4yZVhdSj6m9w5XukdjUNObSpHuTyQtAQ7EP8XWUcteRXZONlFViOhc2
	 q46W+cndtzRbHrhA3HUTgJkhXz+irQS5uIcySnPLGcava0gc5QC1tiD6bOFK8xNqgc
	 kcZm5lp/P6jsE3CbZ/Mv5h9BFDhvwVIXeY0XaHD4Ucvw1VKClUaNwQ6vHDCowAN7Uc
	 cNaWDj0GWW9eZageoy0zrquDhodNcgITxt+CGrV64Q6bFgcrAnrNSv/0abwZbjYdgL
	 yDLY7OahgWuRA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] wifi: ath11k: use work queue to process beacon tx event
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240626053543.1946-1-quic_kangyang@quicinc.com>
References: <20240626053543.1946-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <172062871821.1204645.1268185092465319877.kvalo@kernel.org>
Date: Wed, 10 Jul 2024 16:25:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_092522_249067_A8E6B9D9 
X-CRM114-Status: UNSURE (   8.96  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> Commit 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> from Feb 28, 2024 (linux-next), leads to the following Smatch static
> checker warning:
> 
> drivers/net/wireless/ath/ath11k/wmi.c:1742 ath11k_wmi_p2p_go_bcn_ie()
> warn: sleeping in atomic context
> 
> The reason is that ath11k_bcn_tx_status_event() will directly call might
> sleep function ath11k_wmi_cmd_send() during RCU read-side critical
> sections. The call trace is like:
> 
> ath11k_bcn_tx_status_event()
> -> rcu_read_lock()
> -> ath11k_mac_bcn_tx_event()
>         -> ath11k_mac_setup_bcn_tmpl()
>         ……
>                 -> ath11k_wmi_bcn_tmpl()
>                         -> ath11k_wmi_cmd_send()
> -> rcu_read_unlock()
> 
> Commit 886433a98425 ("ath11k: add support for BSS color change") added the
> ath11k_mac_bcn_tx_event(), commit 01e782c89108 ("ath11k: fix warning
> of RCU usage for ath11k_mac_get_arvif_by_vdev_id()") added the RCU lock
> to avoid warning but also introduced this BUG.
> 
> Use work queue to avoid directly calling ath11k_mac_bcn_tx_event()
> during RCU critical sections. No need to worry about the deletion of vif
> because cancel_work_sync() will drop the work if it doesn't start or
> block vif deletion until the running work is done.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
> 
> Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/2d277abd-5e7b-4da0-80e0-52bd96337f6e@moroto.mountain/
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

177b49dbf9c1 wifi: ath11k: use work queue to process beacon tx event

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240626053543.1946-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


