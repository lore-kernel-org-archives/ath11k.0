Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F5CCDB46E
	for <ath11k@archiver.kernel.org>; Thu, 12 Oct 2023 16:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GBy9+qN457MG/uDc3cSKPFeZR85qEYMH27W2AE31s8=; b=uvYWDEWwD552KM
	vBFzYNGpBIsI0lqB4wihArj9M0qP6mBrpMZdL37as19M6yY8e5XZpSN5QsczKdQ3guLSBUiHWbPTZ
	RDZwnxZmLnE0sUTluVJi6p5632ZbIWQKoXSSE4gw948OoW7zPZRaqGE/Bn8oacc0yaZtWyGK+6LTX
	BlI3y0xdKKphhY22lF5odXz/fbOQa9EgGMNNZt3X8zMpy59TpMSFZ28K8fH6BHP6MhZgjCPKNxqKp
	5X8AGWdbSJenguj8uH8o1BJ7tJMVdzWqG/rg6v68P2Kcau3/LefNAp7RH3UPoFcC6guxSdzrKxXub
	1WBmLSPaPAFb5bFVKMOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyB9-001M5Z-0E;
	Thu, 12 Oct 2023 16:04:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyB6-001M3d-06
	for ath11k@lists.infradead.org;
	Thu, 12 Oct 2023 16:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B8DBACE2997
	for <ath11k@lists.infradead.org>; Thu, 12 Oct 2023 16:04:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1B49C433C7;
	Thu, 12 Oct 2023 16:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126682;
	bh=0a8q07czlG6HQ5qQfZp5nEWDBqfgNcc/HJ7dGSCrRW4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=lJEgfKi0fgm90QstBoW3qr7+5m0jzyM3B2PD5yZerbXZqUDiKPm+XKjX2YHhx/7SG
	 rO5EOHg7+nOQ6oYntvtGvsno/zbnAYjqVl8zbnbyP5QYOthdMGccoaqUrkjQgCtHkw
	 B7ZSsNiquH7NJyvwiaH6ov9zZnQq4PvHv282aMSCqZSPBLHMHj28/Ku/k+uyyA29F8
	 uRkv8l5vSH6xpDR1JlgbP59GgIy4xQtDKE9B6NgGj+7LJVsk2ShcjPt2OoZyR1U2XY
	 JF5X2MNMHbHCQUwNljwDi/5zsEt24nw0EdV2zzZoAlEtkWJAlZlfzijAw8ixtRza1m
	 j+DWIt1I3yrkQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: ath11k_debugfs_register(): fix
 format-truncation warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231010062250.2580951-1-kvalo@kernel.org>
References: <20231010062250.2580951-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712667989.3501995.4611783426919308415.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:04:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090448_263388_56BC1BB4 
X-CRM114-Status: UNSURE (   6.03  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> In v6.6-rc4 with GCC 13.2 I see a new warning:
> 
> drivers/net/wireless/ath/ath11k/debugfs.c: In function 'ath11k_debugfs_register':
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:51: error: '%d' directive output may be truncated writing between 1 and 3 bytes into a region of size 2 [-Werror=format-truncation=]
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:48: note: directive argument in the range [0, 255]
> drivers/net/wireless/ath/ath11k/debugfs.c:1597:9: note: 'snprintf' output between 5 and 7 bytes into a destination of size 5
> 
> Increase the size of pdev_name to 10 bytes to make sure there's enough room for
> the string. Also change the format to '%u' as ar->pdev_idx is u8.
> 
> Compile tested only.
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a47111663491 wifi: ath11k: ath11k_debugfs_register(): fix format-truncation warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231010062250.2580951-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
