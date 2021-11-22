Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B446C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbCdVi7nC0cdhGhT1f26zt1G/uwdjzRxibGMZjr3jyI=; b=2MSQuuhTYUL4qP
	lOD1TSYhpORscOquysT0nsvDsWL5Joc1TEo19Ag4uvyuRkKGcTuDVnzCeVMViOp42CXvIezUstOas
	4eVwOt2+1tQU9pwXnM1AUQBjTB//p8t2z93n7jFaluBoT6RjbtxXtbU1bYoy3VocZC7UkomoiUtUM
	gmDOk3tNtrPKUZhbPCA+zn/myUZ+E6ST+JsTFHpgIarmuB4aygfrpDnBO0vBR+u0Gni5KVRzovZya
	dl7jcUT3F5rR0Jz/WwqwMazLa4yJKzsv/aLj9g0+3JXmEHKH01VUXJZihThYdIfiRbtgZ67T8F62B
	i4BtqTJvBl+325qOR95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAQE-00Gsz6-Cg; Mon, 22 Nov 2021 14:35:54 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAQ9-00GsxU-94
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:35:53 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591749; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=oDco1W0yo0ZflzwxdmHUbxk06U3HPk3Nol4h3voQ7lI=;
 b=QHJkb9UPCfZAKNmfcznJc373bP23Plo3wHSNBRfmj4teGu+QPS0Pmu8g6BEEbAfoQDO8QXU1
 PsammGqKy9PQ9NPCRFD0AlSZCdbR1YrjSo9qpbTwYNSbHKZTuLJBVD2CrwWH9WBvQyhesWT2
 YD/kj+umJ/+NBiUoV0qRktOwXIg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 619baac3bebfa3d4d54bc080 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:35:47
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 933EAC4360D; Mon, 22 Nov 2021 14:35:47 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EF9F7C4338F;
 Mon, 22 Nov 2021 14:35:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EF9F7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix mon status ring rx tlv processing
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1637249433-10316-1-git-send-email-akolli@codeaurora.org>
References: <1637249433-10316-1-git-send-email-akolli@codeaurora.org>
To: Anilkumar Kolli <akolli@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Anilkumar Kolli <akolli@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163759174403.17469.952754430187601558.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 14:35:47 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063549_453218_08E3DED1 
X-CRM114-Status: UNSURE (   7.96  )
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

Anilkumar Kolli <akolli@codeaurora.org> wrote:

> In HE monitor capture, HAL_TLV_STATUS_PPDU_DONE is received
> on processing multiple skb. Do not clear the ppdu_info
> till the HAL_TLV_STATUS_PPDU_DONE is received.
> 
> This fixes below warning and packet drops in monitor mode.
>  "Rate marked as an HE rate but data is invalid: MCS: 6, NSS: 0"
>  WARNING: at
>  PC is at ieee80211_rx_napi+0x624/0x840 [mac80211]
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01693-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Anilkumar Kolli <akolli@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

09f16f7390f3 ath11k: Fix mon status ring rx tlv processing

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1637249433-10316-1-git-send-email-akolli@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
