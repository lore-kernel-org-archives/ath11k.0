Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2F4C10DC2
	for <ath11k@archiver.kernel.org>; Thu, 30 Nov 2023 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lafE3ZU3nQeoWaO4gxeTiZES74CsYxCpPz/wX7FslpY=; b=NpOoV+CxW4L4GoYs8TEdYBkgrB
	0et6LUHc6xWl1vx8rBe1KYfi+jYXn7cdFg7AeZ6wgmMw66lmp0rz6XoiU5pBJCVvfoqV4vgBh3cIA
	0u1mziCuZSIDeAguduJUCBcq20GI30i5cJEdAoEnxg3gfE2GlQ0DsGl/3R5/K/dvmLtUyOSFW5Nzs
	2RPbCAngSe0fXF9lzP87U2d9ks3fhY65PHWDgKKVa8wQ4OL7w6MjUw33jMJTNSdvqcUBmdkvRiRDd
	ZfldC9+3iJQzBAgzjn7ZtPj44wlNn2H3OidY8qg2V+JShDue43IgHkUGoMV3ndUuM+xXQK0ciag3V
	jdJiY5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kR6-00BSLE-35;
	Thu, 30 Nov 2023 17:02:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8kR2-00BSKa-2y;
	Thu, 30 Nov 2023 17:02:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F29E5B81C0D;
	Thu, 30 Nov 2023 17:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93413C433C7;
	Thu, 30 Nov 2023 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701363761;
	bh=kO+tnUITBtUkmCBdvTfQ2GZDs3tBiJ+5QDKUMcdiWiQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HsKOulHiEFMsie379PAyzTppAf+fKQ5a7JnlnEyQRPoYOR1P8kumyu09/gj56nDPh
	 gAIs7ZXgxCNAkStlAxaa9F0ZSwrGktOEZJcb5TUmUsUohCwMcQPk0mlhTZkl74fX4E
	 zzNfHcioHZbu+mo28SbXBZK8i8pdMKoH8HXkswu1sc8eG2YlDoHBWCQ2CA6QpJfjXV
	 NB7CJK023lMTfw2idbwJ0yDa8YX+qJFLAjBpdEfD0op4CsYn7yVps/2ufWBTqj7JjW
	 IdI4OEEnEExiV1Ma4P7BIEJHRrglU0W8ltn3mKw6TzGktIsKSvuj9RPENFvCt3u3Dl
	 m8A+YYeDNl9yQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/4] wifi: ath10k: remove ath10k_htc_record::pauload[]
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231127-flexarray-htc_record-v1-1-6be1f36126fd@quicinc.com>
References: <20231127-flexarray-htc_record-v1-1-6be1f36126fd@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
 <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170136375770.1435047.461679171270420722.kvalo@kernel.org>
Date: Thu, 30 Nov 2023 17:02:39 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_090245_482584_306AEB3A 
X-CRM114-Status: UNSURE (   6.00  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> The misspelled pauload member of struct ath10k_htc_record is unused,
> so remove it.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

c7876faa91ab wifi: ath10k: remove ath10k_htc_record::pauload[]
7b4df59fced0 wifi: ath10k: Use DECLARE_FLEX_ARRAY() for ath10k_htc_record
f20eb4cb9324 wifi: ath11k: remove ath11k_htc_record::pauload[]

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231127-flexarray-htc_record-v1-1-6be1f36126fd@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


