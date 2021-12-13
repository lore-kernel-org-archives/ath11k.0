Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BF0C433F5
	for <ath11k@archiver.kernel.org>; Mon, 13 Dec 2021 10:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZAI4pIU5DFbvDnOEe3VQ/b4LO7k7+MGCLSBM4eBDIM=; b=ecgBwiYESl5Gnj
	8wctTDHQFBWJtF7qH1T5pd3gkFproNxQ5iGzfDrKGPQhpWZIHtjk3uMoi6HBQLXRWt/8gLsKniO4L
	B9Uge/a3A4dN3f86yreyKofEkqkc/ueUBqzVkfy85lkG0pNjt0J0ngy6FGPer2vYaaWjnz5kp+wve
	WJwihtD4v4vZ2R04uclrhKPqcscKVmzMwrCbX6FcNzwFezmshW8YuQHykV7rRQlrBoDjazfOQy38P
	BVEBDyhvthj8tdSKJ9C7QY7YML7s4/XbiVLErmSul0bDDnRq2dPb0xKYq9a6ZBq3yPEV5M38LO/sd
	Q2nI1sNinP9Asjl3QU9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwiJ4-008uAu-UG; Mon, 13 Dec 2021 10:11:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwhvQ-008jod-6l
 for ath11k@lists.infradead.org; Mon, 13 Dec 2021 09:47:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5BCEB80E23;
 Mon, 13 Dec 2021 09:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBD7C341C8;
 Mon, 13 Dec 2021 09:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639388833;
 bh=8QlZsUgUz+MDqRFw1w/g6ysUSt3CDw1rJaN60QZatOw=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=cWBKru2xHo1icdrtfd4ZqxTyE7O3JomIvahvkb/nOuhTfWKUZwHcFWZEo/RYcilIp
 Y28Aw1xA1+E58gB44XJS3lnpLqAMpi2K+6HTmRLgY+KoY/6ht0RIEfN859Vg5NVL4c
 HEinVoEs2A/L+dM8mXTK7nw1ZVagIXR3xRxexEDnXyya7QnWZQhdjdRdO6Sp8iAKyc
 uIn/aIEcwzgwJAEVO/aNg/kRgbb1b5UNnZpNHNY1BPVCt9h3A3tR6Xw3B3QACYVMhg
 GQCZIfFUZcdMBeiUbVKJ1z+s3976XJXGfmt9LS4To5ZSWqXXSEI0NavQIomvOoVFeQ
 RN1uaNgnv+RZg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: support MAC address randomization in scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1638948007-9609-1-git-send-email-quic_cjhuang@quicinc.com>
References: <1638948007-9609-1-git-send-email-quic_cjhuang@quicinc.com>
To: Carl Huang <quic_cjhuang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163938883112.20609.15311677258587032214.kvalo@kernel.org>
Date: Mon, 13 Dec 2021 09:47:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_014716_465809_DDBE342F 
X-CRM114-Status: UNSURE (   6.95  )
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

Carl Huang <quic_cjhuang@quicinc.com> wrote:

> The driver reports NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR capability
> to upper layer based on the service bit firmware reported. Driver
> sets the spoofed flag in scan_ctrl_flag to firmware if upper layer
> has enabled this feature in scan request.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9cbd7fc9be82 ath11k: support MAC address randomization in scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1638948007-9609-1-git-send-email-quic_cjhuang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
