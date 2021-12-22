Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF61C4332F
	for <ath11k@archiver.kernel.org>; Wed, 22 Dec 2021 05:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBzpGXVU55Sr1TZtKp+Bv1UrcR6nX/gzIeidiWGYQio=; b=ACdqP5P6o+0/k5
	8bRwC3Pq1ohyudh8vrAAtj4s9aawtPvwcfxXYXpvJ1/duWHihtUw2oQtPjFtUewu81ThukMM/8RJV
	8aiV55vKtWgkdghuNlfpOaLlg5mZ3RKOxtyh+K8JC7AAx1TMrVey3HBak5B34vS2aAWlBbCTljiTE
	koNtLn0MZ4houdcujH/bznApS5crdL2eHblE3k4KpGDbdClfyv90dp0xVCI5DAMJkVhvwxetGKW+y
	UfQeSVpsXBZYCuFQhkguHBuoBBlfjdlIO+4bsqGoBpeg6/VOwsYCQFwXOKwbesQpBslBHz9e8WM9H
	GVSwkE3Ix59yMZQE8P6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzubk-009HW7-5a; Wed, 22 Dec 2021 05:56:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzubh-009HVn-O6
 for ath11k@lists.infradead.org; Wed, 22 Dec 2021 05:56:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 482B2617EB;
 Wed, 22 Dec 2021 05:56:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AE69C36AE5;
 Wed, 22 Dec 2021 05:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640152568;
 bh=cyCADuhN6VA0Ec892gswnFOQNtzdUG7PQdTXJYthN9s=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=fKWxZJR7Iwpj6QLIt4pVH22h8WM5P4xcTXLVr16r1n4VjBjBsa6eN51MP1Jf+uT8r
 NldzEtK/aJfnb6P6bPBB68p5bvzUqY3CXYMV+6BwRw88kc9dzEyYLo7ufceT2p+t/l
 auIgIEh0+CKlTC2VwDNGFrJQ2oYVtZNepgNrQWyaBT/GF1mX5WQbjjD57r4ygZjysv
 qOWd9XAA0l4IMRXXQ0k+gtP7Y/HSYMsqZ3rUEGA6tO9MTLRtvz/t/mk9g0hLx0QFKp
 19hTq/DeUkgB7+uRc/nX7nFBWEc0YJBVBqfqyU+4Y4yBo34p6xMsRMPvXVanJwsSk2
 LTQcHKXtC865w==
From: Kalle Valo <kvalo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, pkshih@realtek.com,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] codel: remove unnecessary sock.h include
References: <20211221193941.3805147-1-kuba@kernel.org>
Date: Wed, 22 Dec 2021 07:56:05 +0200
In-Reply-To: <20211221193941.3805147-1-kuba@kernel.org> (Jakub Kicinski's
 message of "Tue, 21 Dec 2021 11:39:40 -0800")
Message-ID: <87sful2ney.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_215609_869258_104C71B1 
X-CRM114-Status: GOOD (  12.85  )
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

Jakub Kicinski <kuba@kernel.org> writes:

> Since sock.h is modified relatively often (60 times in the last
> 12 months) it seems worthwhile to decrease the incremental build
> work.
>
> CoDel's header includes net/inet_ecn.h which in turn includes net/sock.h.
> codel.h is itself included by mac80211 which is included by much of
> the WiFi stack and drivers. Removing the net/inet_ecn.h include from
> CoDel breaks the dependecy between WiFi and sock.h.
>
> Commit d068ca2ae2e6 ("codel: split into multiple files") moved all
> the code which actually needs ECN helpers out to net/codel_impl.h,
> the include can be moved there as well.
>
> This decreases the incremental build size after touching sock.h
> from 4999 objects to 4051 objects.
>
> Fix unmasked missing includes in WiFi drivers.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: kvalo@kernel.org
> CC: pkshih@realtek.com
> CC: ath11k@lists.infradead.org
> CC: linux-wireless@vger.kernel.org
> ---
>  drivers/net/wireless/ath/ath11k/debugfs.c  | 2 ++
>  drivers/net/wireless/realtek/rtw89/core.c  | 2 ++
>  drivers/net/wireless/realtek/rtw89/debug.c | 2 ++

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
