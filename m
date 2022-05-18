Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B6BC433EF
	for <ath11k@archiver.kernel.org>; Wed, 18 May 2022 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HhCvfF4/xN6I+CNGuaKqNJu/v+s5VbVy8TdAX4Gay/w=; b=i0jLcb3bOAgTr7
	3fCX6ONWEeQeec0QkEohok3Nz5iuV615dyLmQZJ9U6RccK65/Q20ZgCrgB1buwvEay9Cq+mm4O859
	n0E0gmJVKNhKTnv16JxhwSJNDxuhJjGUCjb7r7Az2+oLWaBu12S+JTITNLYkc9wK2tXfBP3n259Ms
	TMKV/R2ux7jqE66AWNzvHFnd6RhEhKln0lzOCPF4XzSeVUijHClFwLCkqbGDr+IyJD8jez1iy2oKD
	TACMegr9c843O7n1xQbsiPgYTLC430rJjmq1pHjhSj+ZFlKRXuZlPAZqbYV/MqjbPtHW4srDnsvZc
	y8aTSUAZusW6rdflxmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrDzo-00037j-Pk; Wed, 18 May 2022 07:21:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrDzl-00036f-La
 for ath11k@lists.infradead.org; Wed, 18 May 2022 07:21:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DF5D760FF8;
 Wed, 18 May 2022 07:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAD9C385A5;
 Wed, 18 May 2022 07:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652858480;
 bh=Z2Hthqp8KamMwaRyOnQgeWg8sKO8QHlR39SF4zKnXc4=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=nGZxLw/nb7pTaCGz5xDXtFkANXc7mb2cwz2A7XO0Wy57+RabREGGiM5RRSn5mLl/J
 FL+7390d9tF1niOyIMVnO3S8rB9I1xoYzw/p+58sQttVtFWeZFaMDWKrpa2J0nyhFq
 cPbpQLBnk/zwGOovIjiw0jyWz2f1IwOBciTzWJA59VJOk+VJyhxYhckmYGshhwChMG
 mitv8g8ayQhIdlF7tMX3MGcRg+DfaJkZGuakcdP6sgDNSOyyCNwrGLFdj5aSA7qioq
 vg376YiDQvlIceWdTPYs/Pa4rNP8dqMWqN5kAApXUH5SrVzSVArM+WE6o7vsI2jWKm
 JgMTyUmiQXc7Q==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix pointer dereferenced before checking
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <1652671437-20235-1-git-send-email-baihaowen@meizu.com>
References: <1652671437-20235-1-git-send-email-baihaowen@meizu.com>
To: Haowen Bai <baihaowen@meizu.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, Haowen Bai <baihaowen@meizu.com>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165285847598.17755.2700505085056283549.kvalo@kernel.org>
Date: Wed, 18 May 2022 07:21:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_002121_790305_C52A76E0 
X-CRM114-Status: UNSURE (   8.03  )
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

Haowen Bai <baihaowen@meizu.com> wrote:

> The pointer sspec is dereferencing pointer sar before sar is being
> null checked. Fix this by assigning sar->sub_specs to sspec only if
> sar is not NULL, otherwise just NULL. The code has checked sar whether
> it is NULL or not as below, but use before checking.
> 
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

I prefer Baochen's version:

https://patchwork.kernel.org/project/linux-wireless/patch/20220517004844.2412660-1-quic_bqiang@quicinc.com/

Patch set to Superseded.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1652671437-20235-1-git-send-email-baihaowen@meizu.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
