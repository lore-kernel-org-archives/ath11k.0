Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3A1C433EF
	for <ath11k@archiver.kernel.org>; Mon, 21 Mar 2022 10:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WaRcm55uuKAJndubWXFydw2UwYeM3ZT4eOx/0AcF33o=; b=2zy7+7DGOxrXyD
	lpYNzjxVsR2unMhzfwUKtAf96KajqY0rPR9B1fOO90mm4YIrqq0fLRzerJ0AebjI2X5luqVIDzZAP
	GlwZn/g6XZiYDHFdmvZR5NCOnqOaO7/dkLgTttn1BMEpXA4OvyAwEyZuvu6g4/thbFXLt3qaHeaiY
	LQ+Wa2XsOiO6pomLulG9lY3SyjkARc6Li9QvYYMVQnqnzaYc/tYcYaAEc3E6iAcX2j5NEjo3THrog
	Dv6ItCORuS1d1UBqcq22I31wnMvmFnWy/iF2g/4VDSIx9o5Fk+EGsjGFv92bucPizrK7ZFCZomEz7
	Lci7L8xpNXrqgI3CD1Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWEpd-007Fzw-SV; Mon, 21 Mar 2022 10:00:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWEny-007Eo6-G8
 for ath11k@lists.infradead.org; Mon, 21 Mar 2022 09:58:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B79FB81144;
 Mon, 21 Mar 2022 09:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58092C340F9;
 Mon, 21 Mar 2022 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647856704;
 bh=zJtoj0yO3R4xRKDkQWATv5LNqCMME5ZZbwS6hJ0icOg=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=ATZKuocUM5w/IOnyMbheiQiKzfztxyr854Jhen/IX+PrVj2bAwHwd+9C3wE2mfkcA
 LHFOigdeLrLWI631u4vDGlnJWK9TRsrx1YG64DsTkNNqPJPw7v4egrX6TavKtSziaA
 aatdlNuxUqwbKJ0t3pvUtc5hORUqG6TnBkpHTGZ6yoxiSjoja2qdLQrJJsXTx5cPnc
 +PnuSsfVhsLyqI4rHtznX5+PVZ7rxnHMIVHtPxsnw3iing+4Ib3IglS4wFrUJ8PJ9M
 PNx379QEkfnNFmB9RxAY/kasrcJ9gxdq/YSILM9hofWmQAWCO15tYABFXMJ3NuXOOu
 0DxRuZNki3uSg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: Add support for SAR
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220321022231.268197-1-quic_bqiang@quicinc.com>
References: <20220321022231.268197-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <164785670143.6138.10862194405307750688.kvalo@kernel.org>
Date: Mon, 21 Mar 2022 09:58:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_025826_767152_29DE7802 
X-CRM114-Status: UNSURE (   9.03  )
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

> ath11k assigns ath11k_mac_op_set_bios_sar_specs to ath11k_ops,
> and this function is called when user space application
> calls NL80211_CMD_SET_SAR_SPECS. ath11k also registers SAR
> type and frequency ranges to wiphy so user space can query
> SAR capabilities.
> 
> This feature is currently enabled for WCN6855.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-02431-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Baochen told me this depends on this patch:

https://patchwork.kernel.org/project/linux-wireless/patch/20211224085236.9064-2-quic_wgong@quicinc.com/

But that patch is already dropped so dropping this one as well.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220321022231.268197-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
