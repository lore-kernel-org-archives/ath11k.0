Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41968C27C53
	for <ath11k@archiver.kernel.org>; Wed, 19 Jun 2024 14:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehOIS4CVpwHqOwKQcFtxkINszly7Y6E3PxLwWFvxnvA=; b=HqoREYtldPgKZVX34m/w3CotSv
	MswFr36QZ8P/jLdNV+Pk8hOeh+ZnEz1OoIDLhKxmvKxiZuv1LIu8c4SNztOs61O0hKXYZlM+JsdVP
	2TIMslgpQV29fqgG3VpxnMFee/q1nlnBv7jNBAmAc9TYbEFVYCAc/cxQiCaTZK9ZNFUKfh0tMje9S
	t1pXvGdJcyK5fwxpiSyYJD9sGADpeS0dRV6THGCV6zO9ke1PRKkyOfvWimB8bCX9FmI8JercpWzX7
	9epQPZIZKJ/qGK9haV3GNTCSp2hbdAKtu1E60unfpYCU5Paj/Kg5AIotW/DQhL2Iz/Ck9QQvcqbwo
	U+H013HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvra-00000001PMP-44M1;
	Wed, 19 Jun 2024 14:00:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvrL-00000001PKI-3eDN
	for ath11k@lists.infradead.org;
	Wed, 19 Jun 2024 14:00:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7472C61C06;
	Wed, 19 Jun 2024 14:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B9AC2BBFC;
	Wed, 19 Jun 2024 14:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718805622;
	bh=n+YNzpWU7EqoHXf4jXkEv4zoHXbpTG8VTVOb1pLg/gU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cWGXuOxBERxyQugmXDPdDQGEKwJqahtLfbmDW05qbE6rb2EweuWF3DGrCZlN22oWi
	 fv/DiYujYFJ1raLjXVSMNpFe0BXwn7q9TzhJhFA6Xd3fMR4FVhHiXIuqc1Dc7WW8S6
	 0flPcLzXN8lAzn4fVOinMGZVmkSpc4WozZznEQ+ogmhNFdwA5RBuL8KkFHMJDcQqzc
	 cxkgYsXqu/HYxP+ykDSUjhnkMlTfDqJK4fr13VZHLNMTu9XzVcWkGnyRIiYIYU4IVo
	 3S+0RuHVtPhqJ0vqFYLFT6vCeCv4bx8tqbeCLZz/HKv5KKSK3llsQxDRTx23I+Nf3e
	 XrA5W+lLtwBjg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath11k: modify the calculation of the average
 signal
 strength in station mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240309121129.5379-1-quic_lingbok@quicinc.com>
References: <20240309121129.5379-1-quic_lingbok@quicinc.com>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_lingbok@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880561937.581414.6854820032353365399.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 14:00:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_070036_646733_6DD2792B 
X-CRM114-Status: UNSURE (   7.57  )
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

Lingbo Kong <quic_lingbok@quicinc.com> wrote:

> Currently, the calculation of the average signal strength in station mode
> is incorrect.
> 
> This is because before calculating the average signal strength, ath11k need
> to determine whether the hardware and firmware support db2dbm, if the
> hardware and firmware support db2dbm, do not need to add noise floor,
> otherwise, need to add noise floor.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

aadeee47e9d7 wifi: ath11k: modify the calculation of the average signal strength in station mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240309121129.5379-1-quic_lingbok@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


