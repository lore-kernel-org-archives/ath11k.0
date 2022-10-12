Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79494C4332F
	for <ath11k@archiver.kernel.org>; Wed, 12 Oct 2022 06:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uj60pQ8z5yKbCE6gtVUUk3e9/p2VAlQTcXrdoL/IS5g=; b=1voyTxumyEmtqA
	9VaajaH7h1T85AyjzQH5bK70q6XCCyK9+nZE23eOm3lV/Zs+amO8G7im/SqKbHMOxLDcYc2gIGXMy
	dtpd3Dsu+wXgYvHIRuEyPlLktVStZfQdnfm91tTaBXjJzw12cGI4Vbgh8wou3vHMcUoC+Mok9g3Bi
	puun05Kjq2l8RXAoIJwGJw8HjRfrz7hv3mhvMMAkd9rSU6huqQ0CCeAZ7aAaQ4R5HgF1SBD+BnGWj
	kOb7foF2wSPaJ4ZeeQQkYE/CIWEDf2lhFJIP8a24A14U0lL+erMoI+Jx/nGuntw02hGbkjBY6Pgqi
	tgoOqr2z66P+a+q5vfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVOx-0073V5-Kc; Wed, 12 Oct 2022 06:39:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiVOu-0073S9-FS
	for ath11k@lists.infradead.org; Wed, 12 Oct 2022 06:39:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EB586139D;
	Wed, 12 Oct 2022 06:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2915DC433C1;
	Wed, 12 Oct 2022 06:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665556771;
	bh=fMFXHr+GPfCQ+8nQzyiH7Ub/oCaoETpUDx4tv0b6SeU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ikVm1TllATOXuW0FlVvlDL1rM3JWxPjlmQ9RqCL2l8Le9XOh72z4VFvuMgTLsuASU
	 4tuf+sLaBUM5yPgpVWdtsENYVXWtZ1Zq6TpHWH1VO4dbublzkWC/9dKmYPXke0jk9l
	 MD9c5ZNlOhFJ/CTkpAqu9KdQEeQDwDawSU5mSKX2YitnWWXW9irbUm3bxqgd+ZY3Ec
	 rCUhDalk5oJX+7ABs8sv+MNw0w5/hRyNFi9KRbwAQZSoDA4Do6sAzJyB1G9nhjHBYZ
	 7T2QfyUOVBWtEREb5VTRXKWLCsYtZceR9RRXOo+CAkySStSsr3zEmEfwf5K4loFiqU
	 QoYxrOmbV6VVQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix firmware assert during bandwidth change
 for
 peer sta
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221005095430.19890-1-quic_adisi@quicinc.com>
References: <20221005095430.19890-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166555676816.24262.18337479750869695639.kvalo@kernel.org>
Date: Wed, 12 Oct 2022 06:39:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_233932_702240_E1617F9D 
X-CRM114-Status: UNSURE (   9.24  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Currently, ath11k sends peer assoc command for each peer to
> firmware when bandwidth changes. Peer assoc command is a
> bulky command and if many clients are connected, this could
> lead to firmware buffer getting overflowed leading to a firmware
> assert.
> 
> However, during bandwidth change, only phymode and bandwidth
> also can be updated by WMI set peer param command. This makes
> the overall command light when compared to peer assoc and for
> multi-client cases, firmware buffer overflow also does not
> occur.
> 
> Remove sending peer assoc command during sta bandwidth change
> and instead add sending WMI set peer param command for phymode
> and bandwidth.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: f187fe8e3bc65 ("ath11k: fix firmware crash during channel switch")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3ff51d7416ee wifi: ath11k: fix firmware assert during bandwidth change for peer sta

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221005095430.19890-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
