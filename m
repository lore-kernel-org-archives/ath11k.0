Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB17C433EF
	for <ath11k@archiver.kernel.org>; Tue, 14 Dec 2021 06:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5uTHyCXs3BsnosRehxgeyglbSFHJ7gPxilo350KMvK4=; b=cjmIGJfjopGjKz
	qBjdY3Cnq5gL7ItXcJ6ms+4JlCcmyqfvIMR8dvuCCl5B+hdlYGexwqrq1HGxfhjQVoX/ID606/XPS
	/vytpOuaFziowEmZ1lQpyY3GQ8E1rjEfFXdHlhE1MPsCPVQzyb2qihGivF/Wcp6sl+WJcsgxAsMd0
	Q5hsm51+pGEzczF689cRxrEN0y6pNqgnCTUvJmck7DN1KZz112941Lw0t+gP3KnE8o79jghUwX5yM
	EOigYETaOXTfGr4RgpD09jcKpCYTPc4BwJOsd/76wdQOADwqjdzztML4EtZQ8jBE6f28JbP+7/oz5
	WpSWwFdpeNnAzEDcTmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx0tJ-00Chvt-Fy; Tue, 14 Dec 2021 06:02:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx0tG-00Chtz-GW
 for ath11k@lists.infradead.org; Tue, 14 Dec 2021 06:02:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42B15612AC;
 Tue, 14 Dec 2021 06:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB2DFC34604;
 Tue, 14 Dec 2021 06:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639461734;
 bh=Oq5F1xHhWQuZdW7GcGz5FwKlog+bk0yd8vL+ePHpJJ4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=tXvyQZkCcSalVqCzkdwWo3wNvFc34NsOSSgePKISQ3XtY7koXbk7dCcf6JkuVGG4v
 PpeleWiLti4NoptanODNt6iIaC0B8hkGPov1b9ReOmmJAguG/qhcyTJ/IN+xLN9xGT
 GgAhXd+A3hZcygSqfr3IIRrmFEY8gC3EYgVrd+dsoyRUtkgZq2d/wXhPZWK/Y4LXHV
 wVNBHlrNrw34oNFQi1ceSO3g43JGdiO0dFCyihFtY3mF14dp9i9PkNsoAEu3LgBdnk
 IsL/nA9gvhGQyrkS1tebRNzOv/a4HfBYUjRpCxfinIfumbLferTnAaSvbTuoiUQXFM
 H0PIeG9vIgKOg==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/17] ath11k: Use memset_startat() for clearing queue
 descriptors
References: <20211213223331.135412-1-keescook@chromium.org>
 <20211213223331.135412-9-keescook@chromium.org>
Date: Tue, 14 Dec 2021 08:02:07 +0200
In-Reply-To: <20211213223331.135412-9-keescook@chromium.org> (Kees Cook's
 message of "Mon, 13 Dec 2021 14:33:22 -0800")
Message-ID: <87v8zriv1c.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_220218_623960_FFD043AA 
X-CRM114-Status: GOOD (  10.74  )
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

Kees Cook <keescook@chromium.org> writes:

> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memset(), avoid intentionally writing across
> neighboring fields.
>
> Use memset_startat() so memset() doesn't get confused about writing
> beyond the destination member that is intended to be the starting point
> of zeroing through the end of the struct. Additionally split up a later
> field-spanning memset() so that memset() can reason about the size.
>
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: ath11k@lists.infradead.org
> Cc: linux-wireless@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

What's the plan for this patch? I would like to take this via my ath
tree to avoid conflicts.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
