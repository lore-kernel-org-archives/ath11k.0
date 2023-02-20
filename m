Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C93C64EC7
	for <ath11k@archiver.kernel.org>; Mon, 20 Feb 2023 08:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2zv6zGucNA3GQ65qmBz2mccb/67ltepc55SgYJIMyk=; b=l/ACI7I1TdTVbQ
	Dc1AWWcQNaTpQNHyTrZkakXhs9xxcINdg350sxeyF/yUvY/BkMzEyI4yDVXD4LXDCazLgZoozNWCD
	3I2o2ipDmyY5+PK17AD6sKuBF5tKAgCP1bnNLeaGOImYjnBTWEzQyoJ6yUvUuxnrxaJ85ufqf2Kgz
	/jQsqn1aWwk0Y2sy3f9uc4qd9VCl4/bKd5j7I4getGi0OVcUvRijRdHjTO3565LDMbNa/wcn0zkuX
	dJBG4EuCAfAsZxjbDRFyOX1zcgQQBgX/EuPSF0PSWcA1j07kB6sDO/6BUAfN0mz40bz8piCcp/wHj
	1kEC3jEtusPdQVHKWpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1fB-003Lk7-Js; Mon, 20 Feb 2023 08:36:45 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU1f7-003LiS-Tf
	for ath11k@lists.infradead.org; Mon, 20 Feb 2023 08:36:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44FFFB80B17;
	Mon, 20 Feb 2023 08:36:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80690C433D2;
	Mon, 20 Feb 2023 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676882199;
	bh=6ah7BdSO+tiUwm6vSd2FwhQJjPrl/h1EVnNH5HO1Zhw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=ROHZ0F5P9TL1cGfwqMf9rE0ronn86Z256q4dA0Dbd1TwWfsXTEKlcypktwacDKFK1
	 rNHJoJ05rKzfDFMX0DHKLVCXyfzh6gp1vQJKfzPT2xbjJWxkPeeljldIvuj47vgimr
	 o+vA32wAhYxYBJ1Hr3HKcwWwEUQM76LKqS0GGd4ohKnlkMjlIGY+d2t1QCpe2vNN56
	 nPtTxUwINZKKusEnKfxl+/EJw8tDlV7Fh+I9F9m6i/3QJnpMvtRXRGisfpPsWuloFd
	 aSvqS4WboryF9e7LHFEMGHBxf0o/6C2Ixe+YeLOdS+TaAAxtmtELqfl9WNDtOv3nSL
	 Y75QED5E38mQw==
MIME-Version: 1.0
Subject: Re: [PATCH -next] wifi: ath11k: fix return value check in
 ath11k_ahb_probe()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230217030031.4021289-1-yangyingliang@huawei.com>
References: <20230217030031.4021289-1-yangyingliang@huawei.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
 <quic_kathirve@quicinc.com>, <quic_srirrama@quicinc.com>,
 <yangyingliang@huawei.com>, <liwei391@huawei.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167688219531.14547.9485021806959510839.kvalo@kernel.org>
Date: Mon, 20 Feb 2023 08:36:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_003642_548434_D44AA58D 
X-CRM114-Status: UNSURE (   7.46  )
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

Yang Yingliang <yangyingliang@huawei.com> wrote:

> ioremap() returns NULL pointer not PTR_ERR() when it fails,
> so replace the IS_ERR() check with NULL pointer check.
> 
> Fixes: b42b3678c91f ("wifi: ath11k: remap ce register space for IPQ5018")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

342fcde9d914 wifi: ath11k: fix return value check in ath11k_ahb_probe()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230217030031.4021289-1-yangyingliang@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
