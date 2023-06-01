Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FA6C77B7A
	for <ath11k@archiver.kernel.org>; Thu,  1 Jun 2023 10:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7roO0rLNYorBhLjD8H44Q/2Uf0j+u6HejyPCs03CveQ=; b=crovSdd2NF12q4
	NgNuld1FqkYO+RdBGhgkIXMqdwvqz7yaHQhIEDk/TdCD6bNb9ZdFd5wrfUoZVF2syV6pj6eeoSvlh
	z5sKH42mEe8IRdxkunGLr431/fpvtAd6XlfwwNNEqGLlgNAUUkE7PAgVeqYg7YNaEd+C+K7lm4Vg4
	d8W4eeSgFX6p+XYiF7LPFevd7KH8JwR2Ouukl4QEbac9/UjukLGn5FVW4IVwQpmVeuSbjuGEM0cGR
	IXucI7n/cOqr1tFw/b4PAYhKCmwYgc/i3CuDAQXlQwoc4YQbg+pziKCpAnKXXmHUOkhoGejGx12ss
	0IK8/ZX1ckW+cqUj+PPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4faD-0032H9-34;
	Thu, 01 Jun 2023 10:31:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4faB-0032Ea-1X
	for ath11k@lists.infradead.org;
	Thu, 01 Jun 2023 10:31:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08CEA63016;
	Thu,  1 Jun 2023 10:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C1D3C4339E;
	Thu,  1 Jun 2023 10:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685615462;
	bh=d0fuOG/QASBwSsrWcPuJdodt8L54UCvAIEmtMbErH8Y=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=rrmGUkQ27JcFPLQ/YuHxcBnL+050wDKX+clrbzJJ9XrjFUT1r9yruDtE31scNg4Rk
	 gIBlOKCLKVL7Ks34fWeqaGp+C0jP7dfyXJAbQKr2t3fSUmsw1daYudONbtW82Yl/Qb
	 HEhavW2z6zI5/hlgaQ84ci1kvZNRmPugNxM+BHAIABgj+CwjdFkUJUVgkm1Jon1qI4
	 Dg+zLfB5SaevAHKdtSW+AV/88Vw7+TIcjsVYLqYpSB7K6qvASKZ1BFDU52/kTGmoMV
	 jNpoxaoae1TJnJg4msN8phKqvvgiFAtohIFFit88l4ELx11kny2u6eswL9Ca//qjot
	 vcyWAZMvpdoHg==
MIME-Version: 1.0
Subject: Re: [PATCH v4 1/4] wifi: ath11k: remove unused function
 ath11k_tm_event_wmi
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230517135934.16408-2-quic_rajkbhag@quicinc.com>
References: <20230517135934.16408-2-quic_rajkbhag@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Govindaraj Saminathan <quic_gsaminat@quicinc.com>,
 Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168561545941.17301.10017481813934877130.kvalo@kernel.org>
Date: Thu,  1 Jun 2023 10:31:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_033103_559049_F4F47445 
X-CRM114-Status: UNSURE (   8.27  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> wrote:

> The function ath11k_tm_event_wmi() is only defined and it is not used
> anywhere. Hence remove the unused.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Govindaraj Saminathan <quic_gsaminat@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

86f85575a3f6 wifi: ath11k: remove unused function ath11k_tm_event_wmi()
b43310e44edc wifi: ath11k: factory test mode support
8aeba427296b wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230517135934.16408-2-quic_rajkbhag@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
