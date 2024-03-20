Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87FB3CD11BF
	for <ath11k@archiver.kernel.org>; Wed, 20 Mar 2024 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W++tzzxFBWCSPJwFNxg3BvzJsLyH7j5d1LSH5l5QINI=; b=pIWgN1mvOylkVLUk/ESkpU4go+
	fZznWNPQUaEGT2/wi3CJsNbl0sxa/jCgx8qTJO5UBc1NgNnQWGdNOdD+eqfBaoJZi2Z7XICgKUupO
	gusuCyiq2+z9RnvgBGevZMF89bAb6MroDFRqD2Wmtgex9GSFPfR78zgZBg7SqQc4xaEYLmVxgtzSB
	TjkQT80YtO0+c9zcJfPyIlqoKAmwMvDma7ZO0B/iarfkqVM4WbcRX2tasaPwRe8Mpn+ulAV4/kGZq
	1rnttcYeTX3F39LxpLOteVG66dab8OeKJi0dA8jJsFhimncDhBSHLuaAq+PBpuid7bWhpDcivMXsX
	HKeLYmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwPF-0000000HL6w-0wqJ;
	Wed, 20 Mar 2024 13:55:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmwPC-0000000HL5G-0N5C
	for ath11k@lists.infradead.org;
	Wed, 20 Mar 2024 13:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8D36060DF4;
	Wed, 20 Mar 2024 13:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D5EC433C7;
	Wed, 20 Mar 2024 13:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710942897;
	bh=dkNkQOh/hGTDH36C/RRIAKYFE7cHmZYvbi6VnYqum04=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mYXV8ApLa1bDQARvPiawF/0gxAzPKsYISzuIIglBOjgubQHXOT2yNg9gNl6rO7rGg
	 WhbugaE/TYD0jlEZaEFY+3kmwACbxZImPsABSOgP0BifpPZGkqV6V7lA1C9K87cVkI
	 ESm4FUlQBVi9rMIThCo9SFZr3rzUq9Uzubi0qS6BG5M+dvevMr/FEtvqmN10yNSxhM
	 j8O4xilxrGaITgiKLyiZXUErp+6AqnPEuTlCd2CIcTX4SM7E8o5IKUruz0RNz9gJQ5
	 RLj3lpGpsHhtZ/ZYFY3YDKnbSxFNOsGKnQmExkesuGpg5dx6MXVS1UTwyUxef1nHnT
	 XsknlfVy9oFIQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: remove duplicate definitions in wmi.h
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240314021654.304451-1-quic_kangyang@quicinc.com>
References: <20240314021654.304451-1-quic_kangyang@quicinc.com>
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_kangyang@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171094289438.3225057.14544830230083761491.kvalo@kernel.org>
Date: Wed, 20 Mar 2024 13:54:56 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_065458_253886_EB2C2745 
X-CRM114-Status: UNSURE (   4.39  )
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

Kang Yang <quic_kangyang@quicinc.com> wrote:

> There are some duplicate definitions in wmi.h, remove them.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

There was a conflict but git-am handled that automatically:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=5955a10e0a46d46216420b8d2b6c0a1c895892af

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240314021654.304451-1-quic_kangyang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


