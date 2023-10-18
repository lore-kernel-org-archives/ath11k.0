Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC20CDB47E
	for <ath11k@archiver.kernel.org>; Wed, 18 Oct 2023 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2g9GxC7ygm14EvfVdJYxtY8wnKTSd1V+N060JCfVoGU=; b=ywJ/gDNEyLL+wg
	D9DBWEkrC2gWILhWODUxYfF5FJef+qoEeSskU8TWsBQoWw7Sczq6PIfS9hh1ze646Zx6Jaj0Cr3yw
	+sYGo4sQ0dzkDeKiA7dgDKQtaWRZReeLpmFfA9uQe/TfZwNnhj5yDXeD1KjfuoM1sMxaVcCEeEfro
	7WvU88haSLjw7J/ABgxU1UGSd/GKmHvSlUXYUHbzLrvrO5NLvmhCnRPXoo7Os6P9AUC2YyvvgZwRg
	lq0R1MyaI2AtebTG9bQ3hdbZm5ZH7mb5vT2+uWpsSrIx+LQsnH0TtjeHUs1me+rzBB7boO1NiyMnr
	jruPyUj+Hg2F276AuPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1v9-00E9GM-1X;
	Wed, 18 Oct 2023 08:28:51 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt1v6-00E9FT-2l
	for ath11k@lists.infradead.org;
	Wed, 18 Oct 2023 08:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 54740B81BF3;
	Wed, 18 Oct 2023 08:28:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C7AC433C8;
	Wed, 18 Oct 2023 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697617726;
	bh=v5UHIdxwmYituZm5VELfBrx/aD0CnXn++nmORWapCTo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WIntCHgUvaC/Y48RIKYl/z3/eCT2JVB6mDyv5P+Kt/kVRc+8uulOasO35hnMI1/1D
	 SCF6Q21ZiI8BfwXxEdmnrbqn8rl9hCBcqqbQJveyvTRx0BT5zFHVIgJBtxmNdMrzvw
	 TWUcIZ3pTLKGD561E1MXWPfzbxuFkQ9bYnEB4ZLqYwmi/zWIukJDrBYQiVDxrMiOu9
	 nZ4sLSfZ7aMYFSKiK9gUiSZtn46GmejsNgjJ+d9rrpWNmlC8Z8VB5oD5jMTO5mPyHs
	 ujpEip5ONCLepD1AtYv5FciZRsbjjkmMiSCNSayy08jaVVmPu3a3snTBsxDhaRkEuu
	 qhsy8Eq6t9PEQ==
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: wireless: ath11k: Use
 device_get_match_data()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231009172923.2457844-11-robh@kernel.org>
References: <20231009172923.2457844-11-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169761772362.48072.11114311849759116023.kvalo@kernel.org>
Date: Wed, 18 Oct 2023 08:28:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_012849_036155_BEB2A1DA 
X-CRM114-Status: UNSURE (   5.32  )
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

Rob Herring <robh@kernel.org> wrote:

> Use preferred device_get_match_data() instead of of_match_device() to
> get the driver match data. With this, adjust the includes to explicitly
> include the correct headers.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9d2c23d21aa4 wifi: ath11k: Use device_get_match_data()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231009172923.2457844-11-robh@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
