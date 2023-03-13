Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B5EC6FD19
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 11:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msgJ7qbyu56XbWrQ5+ZBLQemaTFBPs6GINhRkqcZpyE=; b=QGwU+3PfTv1jSy
	N9Hqf9eYr5tfe1y8v6RvK3hk3ckFon5tfrokRoO6lRVqr2xUi2K7X1614FFTd2CuwCJbsj2OYN4lg
	CNu1Bvxe6TPvks80ucGdzaOkprtUOE1eKeDcu8wysO8qewaghCVZZLaq4sp/kttb7XW4PFJHVLwTq
	LIIwXpPJjTJcH/7gOHxtsTsoNIdkt+G2oipQo1zedeoQWwr1yAINwtjagM0K5HR/cFo6+SgjzSWVZ
	qlQR8+L8YE3sxNCspHM6ZBP63Wx/0b7jw5icg5AkjSDYYrhz296uRnno9V2P24OVEhXWTNdUD+RHy
	UMoA1PPEVHss59NpLnOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgpG-005aTp-5p; Mon, 13 Mar 2023 11:58:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbgoZ-005a8i-Nn
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 11:58:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D774D61214;
	Mon, 13 Mar 2023 11:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D52C433EF;
	Mon, 13 Mar 2023 11:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678708684;
	bh=Ha+uIvMW2/aH+2RENi0pSqMhBNN0v4raq7eSuJJCzDg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=HBjkqun+WSCebGwLAXx7PyQI9o/dP+6thfamDb6RszxlD/Mg609tNorCCtkjqc4eg
	 XsO7xMxFJkvShfoFO6pvqXvQ0/cpIDaMZxcQ5qvejpSji4me1xquP5ECzWCB6OY89i
	 7xOcvBq/XXdh1fVNHddLJaML7l8Hu0L3mAzSbvD+nWtB8v80vGVYMkWxPj/FKQCwsN
	 p75fod5vYXyoBBr8wMutm0mlBHhoU2/1hAP9S6v1J2w2AS7874iI/1a19dglbKDo1h
	 760MD8PVIr5RtaXzntVlsYOXOYiYUfTvepnbHQUcvC+bTcuhoAgSGcX6JMrNdvoQGX
	 yRxY0w4NVljzQ==
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] wifi: ath11k: use proper regulatory reference for
 bands
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230110121024.14051-2-quic_adisi@quicinc.com>
References: <20230110121024.14051-2-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167870868163.13654.11725738349567591401.kvalo@kernel.org>
Date: Mon, 13 Mar 2023 11:58:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_045807_852708_E113A435 
X-CRM114-Status: UNSURE (   6.91  )
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

> Currently, during regulatory event, 2 GHz/5 GHz is referred
> to as 2G/5G including variable names. However, there is no
> such entity as 2G or 5G.
> 
> Re-name such occurences to its proper name. No functional changes.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

25e289e1f52e wifi: ath11k: use proper regulatory reference for bands
91fa00fa6922 wifi: ath11k: add support to parse new WMI event for 6 GHz
e238e62ba886 wifi: ath11k: add debug prints in regulatory WMI event processing

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230110121024.14051-2-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
