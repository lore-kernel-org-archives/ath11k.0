Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FDEC433F5
	for <ath11k@archiver.kernel.org>; Wed, 23 Mar 2022 08:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9aMpLz9EFoljiZxHkePsWaNcw4th7Wn6/7smAV64x4=; b=2OPYGJpf7ruQ0l
	o5wrajKq5QF3VyYgBbVv5kDTW3jVfsq/+n0z/VsuKigKkdezdWT/E41dja9sblpilLEj7LdHjzvCU
	EiUo16Pj36jd37fuIlhzet9REEzAjMtsQS+V4dsPki/zue5jqYo5ieYFH2Y/5kJX055BbgAGjzEql
	WTFcy2BMR+Aj6qfdYOgZJFe1KVCQDmZ3ReWBsoXqseh0KFYvODpGQXrbNRep4baA0frJ5tll5g2Gq
	guUjcKgAhPq3rpNDl0+3hiyVeTlGmlOqRc8gb7gEnZWl0h0VTyhp1v/zZjwZsW9zDjHFsOB9RNJYO
	FhPYNZ3drTzSvUgvDVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWwjP-00D9pA-Hi; Wed, 23 Mar 2022 08:52:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWwjM-00D9oS-O4
 for ath11k@lists.infradead.org; Wed, 23 Mar 2022 08:52:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 5FCE7CE1F47;
 Wed, 23 Mar 2022 08:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C1E6C340E8;
 Wed, 23 Mar 2022 08:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648025551;
 bh=YjWHIZTg6PjTiotVPBCLS3wghluBjBFTrsWS2433muE=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=p8oZgQdsBzrWpgckjFumesIw/6mqqBhkQRbMXsFLnDgnelVf3S/j9pt4JezdaZ7VG
 40T5MWW1KZkHc5mqDVzFivZhHsM7JyEqF0dixWcFShTrLDxYi5Ky4EMyOYzovMH5x1
 DJqIwMvmJJGtvthSHLuOhiptUgyq3Dj5yJMMv75pOUuz4NXKSlqjDC8IFXD2xbgX8h
 W5o7lukjHXkhorhutfINUq+6I+1RqL1K+rdfq4Ltc2MYlmFfNiPuhiGCPXRTmNlEiz
 jU9OKjewn5+kIDLTPFjw4l9h8yM8ysoK4htMGLAN3ei/EHCIzSSSgtCZC2yKTpG2lp
 2IayRTMG7RzWQ==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: acquire ab->base_lock in unassign when finding the
 peer by addr
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220314215253.92658-1-dossche.niels@gmail.com>
References: <20220314215253.92658-1-dossche.niels@gmail.com>
To: Niels Dossche <dossche.niels@gmail.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Carl Huang <cjhuang@codeaurora.org>, Niels Dossche <dossche.niels@gmail.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164802554371.545.14175354051813428443.kvalo@kernel.org>
Date: Wed, 23 Mar 2022 08:52:30 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_015237_000783_8CC23D7D 
X-CRM114-Status: GOOD (  13.35  )
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

Niels Dossche <dossche.niels@gmail.com> wrote:

> ath11k_peer_find_by_addr states via lockdep that ab->base_lock must be
> held when calling that function in order to protect the list. All
> callers except ath11k_mac_op_unassign_vif_chanctx have that lock
> acquired when calling ath11k_peer_find_by_addr. That lock is also not
> transitively held by a path towards ath11k_mac_op_unassign_vif_chanctx.
> The solution is to acquire the lock when calling
> ath11k_peer_find_by_addr inside ath11k_mac_op_unassign_vif_chanctx.
> 
> I am currently working on a static analyser to detect missing locks and
> this was a reported case. I manually verified the report by looking at
> the code, but I do not have real hardware so this is compile tested
> only.
> 
> Fixes: 701e48a43e15 ("ath11k: add packet log support for QCA6390")
> Signed-off-by: Niels Dossche <dossche.niels@gmail.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2db80f93869d ath11k: acquire ab->base_lock in unassign when finding the peer by addr

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220314215253.92658-1-dossche.niels@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
