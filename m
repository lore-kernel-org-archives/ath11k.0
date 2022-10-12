Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C93C4332F
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9JYLNLGPg8iEnHEq6mYrnAZH/wX7YB/t7Y+N/rgSW7w=; b=M61+0lO8bBGL+4
	DPcCIxsB9RdTjQh8Q4iFK9n3qhX+xrg6zQhRStx6o1JPvjWaXHW2Oj1kDpT1sBQ/tTf+r7sGaexUH
	SKxHpKhDqE2yOgs2V69XNmfkAWdm9U2WGens2V3eSiY2QlpkkLrgPDLAxUnMqy0zDxBCu5fiToilk
	jPuQMPCROHZEpn06QqaQui3PHZD2t9iHP00aDpXGs95xSJgVHLsiATg30lKr7TBVufahBobxB7Z8z
	TxMjzOhOTJAkrXTAeTVUd2AMB1cGQ/m+qXonN5Z4xmr8mN3B+5HtUVWVst3cdb15kSnFrKVT0LgJa
	AyOydCo3hYv1S3aMfqww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVQF-0074Ji-U5; Wed, 12 Oct 2022 06:40:55 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVQC-0074IQ-Ee
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:40:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E9CB0B8197E;
	Wed, 12 Oct 2022 06:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B739BC433B5;
	Wed, 12 Oct 2022 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556849;
	bh=xwJ1C/ciPsPwu3x1Vfv0XWcrHHmo/rCtbUjdAczdcH0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=q2zliXVXXm5LuFTtySM1n8EXKCT3v2F6yiZLrc9KVDYyVdRnI+pa7RDyxZFmDl4FI
	 C4mjGJ9svLFC0mBrVb3yrTZuuYoS2f/F8aQOZlJTBIGjxE2jmT4RqOjbLfX08BIBjP
	 QKv2RRo4+qUGbO0Chev/CdKOFEKyGb+GPkm+5z1lhpuswS/q8kEG9o1WRHWjopqwUv
	 llWPPzzftm9Ve9wwzZnRROACZKpTnkVie2Ubkzb/nqJskCEed0ZHxfUUFTfDG97cvd
	 WPOAvs4zggEaxvpToksgKb81yeLXQM+J1GiAGRk5RM6e9jPOnva3xAblc/uWKJ61RD
	 4jQ4nC89OLzEQ==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath11k: suppress add interface error
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221006005842.8599-1-quic_periyasa@quicinc.com>
References: <20221006005842.8599-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166555684456.24262.12415945639167628856.kvalo@kernel.org>
Date: Wed, 12 Oct 2022 06:40:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_234052_661825_D7B4E82D 
X-CRM114-Status: UNSURE (   8.09  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> In the VIF (other than monitor type) creation request, we should not
> throw the error code when the monitor VIF creation fails, since the
> actual VIF creation succeeds. If we throw the error code from driver
> then the actual VIF creation get fail. So suppress the monitor VIF
> creation error by throwing warning message instead of error code.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.6.0.1-00760-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

638b26652b04 wifi: ath11k: suppress add interface error

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221006005842.8599-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
