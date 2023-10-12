Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B002FCDB46E
	for <ath11k@archiver.kernel.org>; Thu, 12 Oct 2023 16:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9h1r3mlQYPosdv/H7vfnYgMwBgRloDIIlVqGi8Xd6Mk=; b=a5aKvepFf+X3Zy
	Xs9JQoqLZvGfr9smTDzOs8mvV+A9ehxnkOPCvUU1Pcc7CFVaJmFMfPPU6oXqAzotffvUV5oDgeOzf
	xgfk0Ac2fydPJ27wCRPvedQA81aJOo4k9CfXMgek5GhoQQ2ik+f9z4By5aUvTKr9/fzH/RiWy/jYK
	AklifpDpDRRixXYwUaD5HFdIYjgXWLE/sJ9kc92iOOXtVq5n3sBKAFxM632BM25wbBDIXL4Igty/R
	QOJMvm1RaTlBMKvbTgzCm4RnSx4rHnO/CmkiaH/J/CL2u0Fi3ZqHgW1sDFn/6rhrzkxSqUdq0FIZj
	VAQXQ6/mRHhDQuT4X0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyED-001MZN-0n;
	Thu, 12 Oct 2023 16:08:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyEB-001MYp-0j
	for ath11k@lists.infradead.org;
	Thu, 12 Oct 2023 16:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D940BB82399;
	Thu, 12 Oct 2023 16:07:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0CDC433C8;
	Thu, 12 Oct 2023 16:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126877;
	bh=6ENE6DkC6NwZYLerRQYJIEfjH4f0qJlAvrCx99RM68w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=RF4FUB63xnf6DJqAQLZwvC1v4od6qWgdBIzKk2HqThd+cPfXalik7qFILDF66KTe6
	 Nk94ju6wIaq9HTAf7DlE5gE/U45+MT7kTIP/1iPzXCBsLMI62EUVigFlQ+UQ4z4Lbz
	 r8wsjbCkWHzGJf2cE482QaQrBVHath9H62VehULjxNPwA3rBcD6+Crt5/dn/+gYYZI
	 bI2MB/YpwVV0WzEaKMVFHPSJbXxe4Quk/EZiPSOF2s7ptTFlIAVNIr4RFLtdkDP0bo
	 qdEWDKNxigEYMB86S8FiVS0ZjGuo+HQ7MegvBJ6idQiPzqPUS7D3zEja5taTDVggm+
	 wIJxtnH6zVk5Q==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: Remove unused struct ath11k_htc_frame
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231009-ath11k_htc_frame-v1-1-81d405b7a195@quicinc.com>
References: <20231009-ath11k_htc_frame-v1-1-81d405b7a195@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712687405.3501995.7242632853921809220.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:07:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090759_403926_0F6F957B 
X-CRM114-Status: UNSURE (   5.25  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> struct ath11k_htc_frame is unused, and since it illogically contains
> two consecutive flexible arrays, it could never be used, so remove it.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

480d230bef0e wifi: ath11k: Remove unused struct ath11k_htc_frame

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231009-ath11k_htc_frame-v1-1-81d405b7a195@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
