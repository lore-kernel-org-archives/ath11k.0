Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAADC433F5
	for <ath11k@archiver.kernel.org>; Fri,  1 Apr 2022 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VlxzzYPsyjj9+f5xPucxv55m1ZJj9Ycc4cf9YAiTpHk=; b=Z7YTul0goZBPjM
	53/gkKLpIE/DLYmPzXgoaM5qqL6235iAPqW/o3eMLjrZikDj/WyQCBPk+9bfTYfSBMMnr9MTAldu1
	T45ceAXfnY+oACCM+Jf+1IqRnjApIJVZwWDVMlLdVAVLaXWi9B4CRtaLgrqlTrDyDKyzOjj4v19B+
	Rlf68l7FoMQh0BFd9yffyEIFgVnAtwbronTvrCrypD3IHRhi0NGyeLUu5vL1FHkjPs0b+nFvITuIJ
	QhgfxkBqh3Su0y/doWgG1cpFp8f02jhGDe9PNywBaSoFhTR4rH6muhTCC/j/l4mwEYVuskIW6UUIj
	W06B4H0VH4UF0GunBi3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naGNF-005caZ-IJ; Fri, 01 Apr 2022 12:27:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naGND-005cZM-G9
 for ath11k@lists.infradead.org; Fri, 01 Apr 2022 12:27:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12EE16193B;
 Fri,  1 Apr 2022 12:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2227C2BBE4;
 Fri,  1 Apr 2022 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648816046;
 bh=aCZTUsF/0PKeVvVwFbUMsyGf0qGbd++bWrbiQzReW/k=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ilBkEq+1zJD098HZ6PpSNciSBF+xQSTFwo0VvzPSMZsB5+ep43FCkpwleMQc5jpse
 lFFDt7NrjyISu7Wh5IjNC2YrIuqwCT8AHWrpYGbR5vucqh+lYhMvsw1C9ArmojZ6wP
 gWMtO5QHHGcUaeNMnlCuvc8R+kMSgdUzRGa9mTTtFgiNZU6d61C+KmsdfVOjK4VGzR
 wXjM9xvNaPUiUgjQ9Ao+lYNI7CSz1mls2NDtV+nEBtetWeElweXB/SDk1NeTnId6u9
 6U4BwZk3OGYOn4j91IBowiTQ1denmtXbrADjb1pUVTA71f/jxWqxMQpfyvFLZ6ZUxK
 12ED+veq5joaQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v4 0/2] ath11k: Add support for SAR
References: <20220401120948.1312956-1-quic_bqiang@quicinc.com>
Date: Fri, 01 Apr 2022 15:27:18 +0300
In-Reply-To: <20220401120948.1312956-1-quic_bqiang@quicinc.com> (Baochen
 Qiang's message of "Fri, 1 Apr 2022 20:09:46 +0800")
Message-ID: <87sfqxt2e1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_052727_610460_DB3E1DDE 
X-CRM114-Status: GOOD (  11.42  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> This is to add support for SAR, currently it is only enabled
> for WCN6855.
>
> v4:
>  1. rebased on latest ath.git
>  2. add my own s-o-b in Wen'spatch
>
> v3:
>  1. rebased on latest ath.git
>  2. add Wen's patch to this patch set so that
>     there is no dependency.

Thanks, threading now is correct so I assume you run git send-email only
once.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
