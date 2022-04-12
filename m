Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D034C433FE
	for <ath11k@archiver.kernel.org>; Tue, 12 Apr 2022 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5QqDSNA41U/OZDQbvNHFhIJbN/UVuntfSXPj5EjvpU=; b=xSOUSoThjUY/u2
	ZWibIlDyMBNM14kc5Y6k3JSdNjvb5Eo5AEHVIIoNq8Ph9QqhnfyyoA9/9WeqHYk4arCv9Lw7vcBtK
	hFCzUG5FIIOzcHnq2anu7u6BYU43YjLmynh4dYVycKdJRm16f5XOALT2fvbWNkszUSJwrkUXQ8z5X
	01YXschKgIZsZD0fK7Tf8vFKidGVhJAgETEJiWvgKf4Xv4TD8Up6W3DRc3BUmbOrCAlrWZa578S8h
	OtSdjSyZcuVQ4AbVI68dnIIjBagWHk3F6XJpr7DlkY9hxeJnYRg0G8WuvBnj+0ArAZLYRTAASuBT6
	/Mni6Hb9zIMoLPeOG5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGKB-00ESyM-3b; Tue, 12 Apr 2022 13:12:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neGK8-00ESxD-PL
 for ath11k@lists.infradead.org; Tue, 12 Apr 2022 13:12:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 26794619D0;
 Tue, 12 Apr 2022 13:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC7EC385B3;
 Tue, 12 Apr 2022 13:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649769168;
 bh=/vmu44weNRIQQXno9KBtiVr3WCW3XhcLvkMQI6ma3p4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=qPMhMA/1nt5PjdyYlYofPIkLDrgS/GxzukEvqNUNEwWUpRZ5hWJCWF0HqRZNmUCR4
 OP+KEPXV6Pw36hLg/1TmF1zG2oe+uWulYFfpOdgeecwZBHuz18W8tNH5orLFViooxK
 kl+4i9AdEwZvTNGoyuG3qEk9WiXgxr6M9EhLawNV5WuM4G+0mt4aiYaqBdGeqsMd6G
 3YMFHdUGLHBgN3k3kth1+3ChUZNTEmRTP3RWdVkFdkTyS1+2u15D7c2CSICtdlIKie
 +3S5uPxnmYfuN3vCY0WFGwuvMMvMnpGhqeIdAd5Qhk/GmHlR3uzrSjzwqt7eJbvRHl
 VYNHN2612HCfw==
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: Fix spelling mistake "reseting" ->
 "resetting"
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220407102820.613881-1-colin.i.king@gmail.com>
References: <20220407102820.613881-1-colin.i.king@gmail.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164976916384.15500.12618442954054836491.kvalo@kernel.org>
Date: Tue, 12 Apr 2022 13:12:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_061248_998705_4B0C34EC 
X-CRM114-Status: UNSURE (   6.14  )
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

Colin Ian King <colin.i.king@gmail.com> wrote:

> There is a spelling mistake in an ath11k_warn message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

405342ebea2a ath11k: Fix spelling mistake "reseting" -> "resetting"

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220407102820.613881-1-colin.i.king@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
