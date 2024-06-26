Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1483CC27C4F
	for <ath11k@archiver.kernel.org>; Wed, 26 Jun 2024 17:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0inzyR6kKMOrplT9qQESDgpLLY2B1KA+9TnttMNTZg4=; b=MdAiWOqd49oclVAm2aaEvNf9Wf
	6cOQnRd0JSqL0tomwRbOA+i7L9bv30OO5fZGY8Dra4lU5/4MQq22zVVDotq4F6r0vzB2X7PeSoErB
	h/RlG4Xde15KA6l1m0VTKCCE9P37zd/7UYqugNdWOaMCzDbFg7Z9vzI0jp6LL9TOLkBsXGzfVRitr
	e/hjrTa+EevPoDTlrM4Tsnz836MfOzaGeJIPc6y99vM5XThtbIIvp/tBjbAhEGaxF7JoJzdSAsaXV
	9oVS+qY5x5NOYeoeEd2+ozgQrXDBldAXrM3c9mjixeh1Rxj4FDIZ0+UTIVBfQKD8ig4NA336tEj+N
	7Ao43amA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWYu-00000007mts-2l7H;
	Wed, 26 Jun 2024 17:36:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWYq-00000007msl-44zU;
	Wed, 26 Jun 2024 17:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFFE061C30;
	Wed, 26 Jun 2024 17:35:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591C8C116B1;
	Wed, 26 Jun 2024 17:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719423359;
	bh=+zFF2pFopV5MhEOzrR6fFFjz0JFWtPlVmvBLhTX+n10=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JTdWv3w5rwWuw/BrxvcUrS9MCAkb2TPoZT10zN+CaepIf8i/OmfW/Gay9EET+/Vcg
	 7F4DO/Lt0AyBOv84YCsXdweKHEu0AXa5PnvKAi1TYo2/d73BihBRXIZWYuRTg4SxxR
	 rKeiMFfGkMz8vDkP0jqmi1YHNWnLdPVQtpmsFTHdzARJEwVi+fYTp1R/wL2HJMjOTH
	 pla4j8aDCLiMd9Ee42vM5KdrkYPi87AxQE3AgLky5zsA/fejN1J1MrmLQmYAxM0pN7
	 l5dW5hFtIBzde9gwUcWXykzepMLQDco7PbU/JVCu5zeIqTq+lCQrjNoJTQHlB39DdE
	 h4P6/YYjq0pHQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH wireless] MAINTAINERS: wifi: update ath.git location
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240626102632.1554485-1-kvalo@kernel.org>
References: <20240626102632.1554485-1-kvalo@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171942335638.1803120.11955784309369789042.kvalo@kernel.org>
Date: Wed, 26 Jun 2024 17:35:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_103601_122509_C8938716 
X-CRM114-Status: UNSURE (   5.85  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> ath.git tree has moved to a new location. The old location will be an alias to
> the new location and will work at least until end of 2024, but best to update
> git trees already now.
> 
> Signed-off-by: Kalle Valo <kvalo@kernel.org>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Patch applied to wireless.git, thanks.

c40ff9b662d0 MAINTAINERS: wifi: update ath.git location

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240626102632.1554485-1-kvalo@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


