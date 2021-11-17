Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A59AC433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:33:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A24D62F90
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A24D62F90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZzroqZdGtiSszH0DbJ4v0e5L1YZoudKxWVV1jqIW2s=; b=UCPJhDX57oZ/ue
	dqsEEXYCms88JyzcZTg4UtcT4z7ot6HQ+yEbiASsVhJPua/4/fIGCQgBPjSej3n1R/XrEWPSmH+O/
	BnwHofQfmSMtuDBte+CCx/Q+2lGHE4xMkjPALIAKFZ//P+yzDsaIQVWGS+NyejMsz0yHMvfO1Sx+G
	kt5dFCZpUC6y+F7IssN/ULeds0X+9tNwu3AyyMlOFHYD6gkNduQqEV1mjOZh6xxBBXxnWzPnkzwPr
	p4UsbMo1F1QiPSbIV2Q1+19HgCnbduOjBYFJx/X6E2ad162VlaYgNlr2da5r21OhUKlf+YY/0a38b
	onA5lKzWGDD0Alzv7mig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFRF-003omv-3U; Wed, 17 Nov 2021 07:33:01 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFRC-003om7-Ez
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:32:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134378; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=A5Oll31t88OvjOfeFNp9bH5UDfepo9hrBwl2bYIFdEs=;
 b=xiSKxY8cCSbR5j4LXz9F8OnN0ltMp8dJQxq3xr7gOu25E0lj/ir7YTo6qXOzAUeaL//OWAsF
 PkXLVHx5CkXwX9bUHa5rahXAFyKbEAFR+j+75r/u239Lv63BTZnFX5U0qgO3ETyOZMkqpgZe
 hRqGvf3u2We8I2ZSNFaNWA/1Zrk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 6194b0291e1d2f5233b676b8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:32:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7645C4360C; Wed, 17 Nov 2021 07:32:57 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 27225C4338F;
 Wed, 17 Nov 2021 07:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 27225C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: clear the keys properly via DISABLE_KEY
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211115100441.33771-1-sven@narfation.org>
References: <20211115100441.33771-1-sven@narfation.org>
To: Sven Eckelmann <sven@narfation.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Karthikeyan Kathirvel <kathirve@codeaurora.org>,
 Sven Eckelmann <sven@narfation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713437291.31320.11796327341306662079.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:32:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_233258_584122_2FB96603 
X-CRM114-Status: UNSURE (   8.29  )
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

Sven Eckelmann <sven@narfation.org> wrote:

> DISABLE_KEY sets the key_len to 0, firmware will not delete the keys if
> key_len is 0. Changing from security mode to open mode will cause mcast
> to be still encrypted without vdev restart.
> 
> Set the proper key_len for DISABLE_KEY cmd to clear the keys in
> firmware.
> 
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.5.0.1-01100-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Reported-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Karthikeyan Kathirvel <kathirve@codeaurora.org>
> [sven@narfation.org: split into separate patches, clean up commit message]
> Signed-off-by: Sven Eckelmann <sven@narfation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

436a4e886598 ath11k: clear the keys properly via DISABLE_KEY
64bc3aa02ae7 ath11k: reset RSN/WPA present state for open BSS

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211115100441.33771-1-sven@narfation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
