Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8864EC25B7C
	for <ath11k@archiver.kernel.org>; Wed, 29 May 2024 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5DY5VBqnaP1+zmlO4vFQmsBoqdjB46/NYNztLHSlWIQ=; b=0FKkYLWmCrPPQhPHrmzcKVNnz2
	3NetRwGQ2n+WPYUU3z7g2ONTfUd8E8PmtdK0qdEx0T7ldu5BHakZ2voS9QgxKQhjW2GZfYfJg8NOi
	fGjjaPPpdVQmopUg9oS7SaHGoLOtzHmzDPPyBbY+U+sjJzbWmslrz8PsaWF9J1HJ1qvQ/j9I1DN2i
	Gag+oTLpX2wsyIRi+jnCUdy2rvMrkYtO+DYsupP7IRSpT0x51y/4oON0EP7/ofXa9xGnuIJzIB+2f
	ewoSIaz3+VM1ptOMcmdl0QhsxeqtWtmxTjk4JpcbPG3rrw0T4dqpTDnfB3xt+BGI/nZnSbsr4I6ze
	q0nbw8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFFL-00000003ZFx-3xV9;
	Wed, 29 May 2024 09:05:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCFFI-00000003ZFD-1ZyC
	for ath11k@lists.infradead.org;
	Wed, 29 May 2024 09:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B462E62767;
	Wed, 29 May 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC59C32781;
	Wed, 29 May 2024 09:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716973519;
	bh=MF0KhYNWSAZG1I9Dmuy4u1xpG22i7yS/OTYbcgXjtUc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sHgFWB+jK6Mvf5fBRRP2YexDHRG46SwFx/WaZZC8meVL8vEQ7zFnK+0esw1SdHEIU
	 KXJtATpUGyx6irx5acjwsE/117kpgCJw8eXTAqbR/SKLcvgiKcS5PapqOKVtzFOEKs
	 vE+8uy1U+c4Zl0PI9/mRgcPaLRp2jTIKPEfOQWfE16Y0TdK6WfgYAnA2/Amk8+GSUS
	 osYolyNlMo1X8SzQE26TZpLuJCyKN6TUI9wF+A1fbvwBb87eu1wzfQHSKm2jZpUDWU
	 dGtMv0pBblc396LJgPEYmp9EaXg/qUmk5yNXtzw0Udggvma+xH1CXwRbZnP3t/Qxi/
	 NVmVVIAWeXJsg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] dt-bindings: net: wireless: ath11k: Drop
 "qcom,ipq8074-wcss-pil" from example
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240528134610.4075204-1-robh@kernel.org>
References: <20240528134610.4075204-1-robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, ath11k@lists.infradead.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171697351470.2158278.1110328163301153386.kvalo@kernel.org>
Date: Wed, 29 May 2024 09:05:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_020520_563793_2BE41790 
X-CRM114-Status: UNSURE (   6.43  )
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

"Rob Herring (Arm)" <robh@kernel.org> wrote:

> Convention for examples is to only show what's covered by the binding,
> so drop the provider "qcom,ipq8074-wcss-pil". It is also not documented
> by a schema which caused a warning.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I'll take this to our ath.git tree, ok?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240528134610.4075204-1-robh@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


