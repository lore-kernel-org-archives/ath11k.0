Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04064C433F5
	for <ath11k@archiver.kernel.org>; Tue,  1 Feb 2022 11:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ahGqkuErZ+avo7tHN4887c9I3jtaZUooti5CZ7axSuY=; b=AZftMHQQDYT666
	PotZAhVlXh4EZibBQ0HH0eaY9TKtvZzmAn0Gx1Ss12Q9N8srMSyPUhvdfAqI8UjLkzDuS5de3/9eQ
	sJom1ClgUartgCVpb5JJsDDvDMEGkfKV9aRYGCBaYezwQP/gH6gCdZRqVwXoWWfIJk7j4P9dsXFYu
	Z7k4tjNr5UjEvIWsPyxV8JeeSDNxPw19zZNAZhR/GQNFwRz51/pinhjl/4dA2bySe91T2HRyfI6OK
	Uhypi9hb9rZBskDcDCmAgMnEevw4i9HHg+Xt1hDTW9odfcKcoXUrXoXy08Na9qhZOZm6kIVNt5JA/
	p9Xgp0ljCnVHSVWjot/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEr4y-00Bohq-VF; Tue, 01 Feb 2022 11:12:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEr4w-00BogF-LK
 for ath11k@lists.infradead.org; Tue, 01 Feb 2022 11:12:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 57C1F614B0;
 Tue,  1 Feb 2022 11:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F189EC340EB;
 Tue,  1 Feb 2022 11:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643713914;
 bh=kLHEZwxJCrInxikeCNY6kKv105duD8h5Jo90LH778UM=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=VUrjamPcp4KBIUUA1qqkdOopMjOfS3MFSM+SnjSYmZg3g1ia4xVNS/Vf3ZNqhBnYi
 LO8/ecVe6inUagzkEVYI9dcdWDPGPGr75xjrrc7iW6Cdt5MOsRwVE3Hod7Aatu1bqg
 S+COQyBCxlYmX/XykLYPZ5UwpX29yZn/Q5Z/Gxq9AW7V1Epnm+d9B9+YRsQwJFsDDF
 Gtl97ySL9Cyc42CA2s5Ihbf/++K921cKj4tPLJYlsi+VJQ1Vh+gtuaf7+GbHmt1Jt2
 b/8UXSHM4gnRZ/yJPmTa7qkc+8xI8UgNFNYslX0yz+RkQdkKFnTLgDh+h7mOFL69Hb
 05FjHgD0NbhDQ==
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt: bindings: net: add bindings to add WoW support for
 WCN6750
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1643261093-12400-2-git-send-email-quic_mpubbise@quicinc.com>
References: <1643261093-12400-2-git-send-email-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164371391232.32371.14261682315173244748.kvalo@kernel.org>
Date: Tue,  1 Feb 2022 11:11:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_031206_770542_7C4238D6 
X-CRM114-Status: UNSURE (   7.67  )
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

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Add required bindings to support WoW (Wake on Wireless) for
> WCN6750 used by ATH11K driver.
> 
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>

Please resend once all dependencies are in ath tree.

2 patches set to Changes Requested.

12726278 [1/2] dt: bindings: net: add bindings to add WoW support for WCN6750
12726277 [2/2] ath11k: Add WoW support for WCN6750

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1643261093-12400-2-git-send-email-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
