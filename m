Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3064C7619A
	for <ath11k@archiver.kernel.org>; Wed, 12 Apr 2023 09:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/l9sVVs4kdJ0VxNSNUvYa7Wda9NoAhTFvmYzgXQ0o6k=; b=WVPlYalL2+GZmM
	+OQF0FuHyyI1g+A3dZUlgHfyfLluwH6wc3IQNrsGzcxMrrzREZnoZ1cs0/J5Z2UsMASKNkewkMYmS
	eKBS9lHG5mOcs/WcDKlUkeNrk0XPyZy7zlj2PNcWkoaMYhm4SH0GooyuM38ob0T2el8Vbkk1KAqR/
	8KSiNcCSpG1Ae9pPUW6owz/NCJqT3w09f4bta+G4NUpGfy088XtHCKuZzi1k9cQCHqp0w0SRkEbfz
	7dfWMiNr7O1Ew1uqP5XMgj8trVwgROsQBG+KQGMajOmx2M+X6KrvuN07cI7U1w13+Ew/iu2SlEx9V
	jPKIuifBF/A+M5Z3jCyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXFp-002Ugy-1P;
	Wed, 12 Apr 2023 09:59:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmXFm-002UgA-2Q
	for ath11k@lists.infradead.org;
	Wed, 12 Apr 2023 09:59:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 52E3762AF9;
	Wed, 12 Apr 2023 09:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDFBAC433EF;
	Wed, 12 Apr 2023 09:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681293541;
	bh=DkbdkJrCIGKo6sV6b92AMSs4dyTp3F0mcGn6aU5aGz0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Kmc8KbfDorBPScEa8DazjKwdSUc4LEMuOO5/q6m5ssC3xMf5tk5qyQCaUgL5QGEEF
	 C1C9qPE+kYZGDAj8VBzMa2BIUS4cxnW54MpZGo8Ml/gDDO9LHmo1hU/1sG7VfO2/ee
	 GYwS4bvRcbTlJ4DC0S7JW2kzZT9u7/QbaqH00aVgYeID0+wmMF56+FY8RfATnmXP74
	 iVIVZKeT4PiNfogmYMLOFnIWzP/aESORb8JBl6g4Y7goV09a4KLDq1a814KvTH62GW
	 FSgmcjVDDBxKxi6bEyQ+E4zp73eYAR1DvYgLKzmqz+qJ/qBz6BU+IPU30lXGSh8fnN
	 lWbyrV8oG/yGw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath11k: fix rssi station dump not updated in
 QCN9074
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230320110312.20639-1-quic_ppranees@quicinc.com>
References: <20230320110312.20639-1-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168129353877.14673.14171521280937840187.kvalo@kernel.org>
Date: Wed, 12 Apr 2023 09:59:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_025902_821207_D40226B2 
X-CRM114-Status: UNSURE (   7.04  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> In QCN9074, station dump signal values display default value which
> is -95 dbm, since there is firmware header change for HAL_RX_MPDU_START
> between QCN9074 and IPQ8074 which cause wrong peer_id fetch from msdu.
> Fix this by updating hal_rx_mpdu_info with corresponding QCN9074 tlv
> format.
> 
> Tested-on: QCN9074 hw1.0 PCI WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01695-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

031ffa6c2cd3 wifi: ath11k: fix rssi station dump not updated in QCN9074

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230320110312.20639-1-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
