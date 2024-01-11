Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0E5C4707B
	for <ath11k@archiver.kernel.org>; Thu, 11 Jan 2024 20:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNaW/uC0E+YSjKP4dY7lLZD1SZQ/j6uAjNWM02lGn1U=; b=BXqBieOI1Uhmp040G9s+s4h9e9
	skZjyhruVdWhjQnLus/mjEwwlbN58pqAMTMuhkumYyqAq4Xkt5ocyJbWFxQv1y9cL5As9v3JPf1bo
	PeslDMPzDm8H+5nOjs/pFZguBrQpxi1mtMTGsPeE4+wLT2FKI+MXHCEmUgw4nnS5XehD9Pay9x4dN
	gXkIngWV0by5TNTplE2uLyUzqSKWsETv2iKv5u5ecyjeNoPB9S81Xj1/IwKso2WrHXesVCjnfS8HD
	1q7r3Od4tOoetdz5X4ZfLvkW/lKRm9F5tggy0RSiwKR21UArFjddNGLhyylFj2jrKWuh5Ovg9/Bho
	+p5xxoMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1op-001BZ5-2b;
	Thu, 11 Jan 2024 20:38:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rO1on-001BYf-04
	for ath11k@lists.infradead.org;
	Thu, 11 Jan 2024 20:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 35302CE20A4;
	Thu, 11 Jan 2024 20:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C69C433C7;
	Thu, 11 Jan 2024 20:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705005502;
	bh=vRdDgyRsKnxPzHcxYChrexN1fX13hfnOre1Td9jWPyQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=b6CkQIbTgKAhRreXZ+7U1VAXvND4zt17FJ+ZqBB8uKtZWXd2K2gsAHcViyIyR2z+n
	 iKwj8O3wzVNaMS1/MQ1nTPBbfznk9vWx0TVe7a0HwmAojy9awL+WlKnyLPup0+oTsY
	 URfmJgUXtiQ0emFNf/hdGcYx3n6e9jV1XJOSx5C13BrvZILqS1qm8SKGffKCfXQt4F
	 B94UF33vIvtrYm2yODExGokP18swJw0dh8m4z1E+84U+40bAcSoPNFICTyjqAUEuW2
	 Q+FreuuTNehA0Gu2zFVg2NYBDcx2C1SEu0qtpSDD98kXbyGFd4mG0OiG+gJdvX7FWW
	 tIjonWzhiLmsA==
From: Kalle Valo <kvalo@kernel.org>
To: benjamin@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,  lenb@kernel.org,  Benjamin Berg
 <benjamin.berg@intel.com>,
    ath11k@lists.infradead.org
Subject: Re: [PATCH] wifi: ath11k: rely on mac80211 debugfs handling for vif
References: <20240111170629.1257217-1-benjamin@sipsolutions.net>
Date: Thu, 11 Jan 2024 22:38:19 +0200
In-Reply-To: <20240111170629.1257217-1-benjamin@sipsolutions.net>
	(benjamin@sipsolutions.net's message of "Thu, 11 Jan 2024 18:06:29
	+0100")
Message-ID: <877ckfip1g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_123825_234829_C246710F 
X-CRM114-Status: UNSURE (   7.56  )
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

benjamin@sipsolutions.net writes:

> From: Benjamin Berg <benjamin.berg@intel.com>
>
> mac80211 started to delete debugfs entries in certain cases, causing a
> conflict between ath11k also trying to delete them later on. Fix this by
> relying on mac80211 to delete the entries when appropriate and adding
> them from the vif_add_debugfs handler.
>
> Fixes: 0a3d898ee9a8 ("wifi: mac80211: add/remove driver debugfs entries as appropriate")
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=218364
> Signed-off-by: Benjamin Berg <benjamin.berg@intel.com>

Adding ath11k list so that the whole team sees this.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

