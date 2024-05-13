Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 048C0C25B78
	for <ath11k@archiver.kernel.org>; Mon, 13 May 2024 14:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9ASFD6yS68xHp783qwDwDmdSJ1IQOrMbQgxXcfnjK4=; b=XWwPR8LVd2ILTUdvkzDSSHAg0Z
	EPxhY9OC9tELZh0yBozWJXv5DqLPtssAOGfQ+gWBXHRdAmli0y6Z5zWj5dbeO8D2Ka+PBlnIa/tFt
	7oNOOTSBwe137WJY29Ar09lj7gjRhMAGVdErevXUmIrFmXWWVncvTprOKm/gWNozAHErK3GrgehW+
	9xNGd2kXdVj4XPKXqb/BpQvc5z0JdtSzN9z7TOSEWZSqZeSqofj0mm4UwoTe4SmSye5vF+XnvB7Zs
	7fZY5uU8V52UHs1tS17A8N08tU+uXlEDrzn0Wu5j7jHDQol1fLz7WZVRCH+x3ASVDmmbVgSKK0Rqx
	dhh7IEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WRO-0000000D8xm-2vIE;
	Mon, 13 May 2024 14:14:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WRM-0000000D8xA-0Mfl
	for ath11k@lists.infradead.org;
	Mon, 13 May 2024 14:14:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 33CB6CE0EB2;
	Mon, 13 May 2024 14:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FDCC32782;
	Mon, 13 May 2024 14:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609626;
	bh=enFo1Q6sy9LPBkEPmc/Y7IiWPlpY3AWCf3OHewvllx8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CIynacKMN88+mWnmzA2waduskLXgnxRPXIlGw4eCZfy2gEtl80l9h099oNKqcFc2C
	 WG+wYeUkGc14MoRa/ZnQKCsuAMDqtbEwk84MPHBMZEPtL3jAElTWR8HmQw4zagq0dO
	 RHmYsG/ehzMbUKnBH98YJrWqOLkSh25HoAZvUpZ2UdhgkijPpRjpOLJWlGbxFfmAFK
	 mWbPPtGbyu+evzS9gHzJlrSaOyp+7Npq4IeEJrxWjlIw70Z50byRcC3VVZ7pwar3cc
	 dUsh6xamq7ankTtbiseOLN92TH0jhH+qFGV8njCHCJfdbCOTDL3cJNSrFcSo9U4R9f
	 gcXJyKfHfnMqg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: fix misspelling of "dma" in
 num_rxmda_per_pdev
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240504-ath11k-num_rxmda_per_pdev-v1-1-7f97bced8495@quicinc.com>
References: <20240504-ath11k-num_rxmda_per_pdev-v1-1-7f97bced8495@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560962350.1690511.13501217225200268236.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:13:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071408_316309_5A454B2D 
X-CRM114-Status: UNSURE (   5.11  )
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

> The ath11k_hw_params member num_rxmda_per_pdev contains a misspelling
> of "dma" so fix it.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a6efa4ea0613 wifi: ath11k: fix misspelling of "dma" in num_rxmda_per_pdev

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240504-ath11k-num_rxmda_per_pdev-v1-1-7f97bced8495@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


