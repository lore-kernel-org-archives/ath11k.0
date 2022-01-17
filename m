Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE95DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 17 Jan 2022 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8gvxXqkASM4LqxCBwTsErG+xbVYK38wqcek7U9LJ1JI=; b=2xSDx5cnqe4Mjx
	6NLUP4v8NAllS9Ky8HASelrbtH+vh0tRLf6aSyQKBOenPWV1/EX/fZ3bNUCiWvMkoQ8Kmldem9Hvu
	e6M5ZjCcHWcEdm4S+Ll3MGre8YHWFWrXYjC146V0oUjS+sbXsxpdVIKL3MVjVSdw+BMU2zW+AtCvt
	h1BszoHa4zwctbLPT7tur2w6GIl/0yWEqC/KDWhlMFsNPuZ3ThzVgbf4AjO63KsWQT/Mpyec/mIVV
	IASZDEt6Gv/eaSwPl264xmVLEcNpmj5RbVETi3sjjg1f3aV9cqzTROlkf+5visEstc17wuaoIj5Uk
	P7pPZaOHQduOKXmKSzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9RLT-00EvvV-S6; Mon, 17 Jan 2022 12:42:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9RLR-00Evv1-Mw
 for ath11k@lists.infradead.org; Mon, 17 Jan 2022 12:42:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F1C16111A;
 Mon, 17 Jan 2022 12:42:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E111CC36AE7;
 Mon, 17 Jan 2022 12:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642423364;
 bh=G7ZxgDzPO+AOO9hsFvL6frkTOmYVsqtDIRGxHHQd1r0=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Kft+4HzViN+bc+gOyhuSYWxn+3AWSAaCYDq09SRV0vpZF7fFjcOtG8gkC6sYY54iQ
 5X7GY2gsB2SUpazFCfOJaXWmwnornHFm/N76O+x7n81X0dFpS/a8Sf2wHAhYO4Odg9
 k/5Z/qd7cKhE/1Jj31OJEbn2XJgngeMoh8+P1+gmHH6/hQYUk5qhyitJXA2gzkkEaO
 6bIdtsbnZSdCkcj48coq+00VIOMgwlqBRfz2Iir6qrTdZM5UC8Qe4EQV00QwSJSGUg
 HJIzQpI0PXJz8DX/fSwCyI8GMCKezwSoPtbwQPQnhX305hqph1FCGMUlrO0eBBBOLy
 vMxBC1YZKvt5w==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Reconfigure hardware rate for WCN6855 after
 vdev is started
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220112025400.2222-1-quic_bqiang@quicinc.com>
References: <20220112025400.2222-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164242336225.27899.2887641873424992546.kvalo@kernel.org>
Date: Mon, 17 Jan 2022 12:42:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_044245_828954_1F6CC2BD 
X-CRM114-Status: UNSURE (   8.66  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> There is an issue that WCN6855 tries to connect to an AP using
> a hardware rate of 1Mb/s , even though the AP has announced
> expected rates as [24, 36, 48, 54] in Probe Response frame.
> 
> The reason is that WCN6855 firmware clears hardware rate info
> of management frames when vdev starts and uses 1Mb/s as default.
> To solve it, reconfigure the rate after vdev is started.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

dc7ff75690ea ath11k: Reconfigure hardware rate for WCN6855 after vdev is started

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220112025400.2222-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
