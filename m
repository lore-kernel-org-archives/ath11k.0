Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F122C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 10:02:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F66860EB6
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 10:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F66860EB6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8UdDbJJSKoKv8+N8OxA3NabWtpAP7bRuIdfYzthjp8=; b=llWDCRKUH6STaO
	HNMDs8hW3CX/s1GmpT7IFywOmJOJEf3JHpJKhI3e5n11Dwe5KjWPVKNLzvw+Yq41ZNQ+/tW5Q5Mcr
	NjhbWWDPrk3jlVhpc4S4M0P4CCrYc+ktA5GJHLn0QzmWgcbwLj98K+7A6sNcpUmX0Em3AZHgLb90m
	dqB18+upzSqpIcVF8vqoJybsSFcDQufOD88kVnQ0jfxR/NZkDzOwdmX77jk8Lc4C3iDC7sZcHqnEr
	myZzEQQ38+vebi73Vdw4+Hq3ok5IM1S3QEnXGvM2rP1rupmSmcYBPTGIWHw1XHc6hBwLeUgiTVWDZ
	Pdi+fmVrIKYor0SxZ6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQoDj-00AoL3-Ka; Thu, 16 Sep 2021 10:02:19 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQoDf-00AoKE-4j
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 10:02:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631786537; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=8e7o0uD19m0JH0RLYxasicySgpEqt6t3RqCtcKR3flc=;
 b=YdsyDblZ07524/EiRgZaXsk6CJyEqQmr7DjDL/tUg4sgu84Oeon7Y5cQM4MbGPckVK/beFFi
 FnDJPQP2e1aeA6laqBQVHkLwZkp+gfvBxcrbsUldMDFKM2anzlqFPGEcwAbJo6XItZZb6L04
 Ki3gwNFSqn2aWGi7MVcgrpaWAk0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61431623ec62f57c9a23c5dd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 10:02:11
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98C57C4360C; Thu, 16 Sep 2021 10:02:10 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F7FDC4338F;
 Thu, 16 Sep 2021 10:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0F7FDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>
Subject: Re: [PATCH 2/3] ath11k: change return buffer manager for QCA6390
References: <20210914163726.38604-1-jouni@codeaurora.org>
 <20210914163726.38604-2-jouni@codeaurora.org>
Date: Thu, 16 Sep 2021 13:02:04 +0300
In-Reply-To: <20210914163726.38604-2-jouni@codeaurora.org> (Jouni Malinen's
 message of "Tue, 14 Sep 2021 19:37:25 +0300")
Message-ID: <87ilz0zvmr.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_030217_585736_D26E35CF 
X-CRM114-Status: UNSURE (   8.28  )
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

Jouni Malinen <jouni@codeaurora.org> writes:

> From: Baochen Qiang <bqiang@codeaurora.org>
>
> QCA6390 firmware uses HAL_RX_BUF_RBM_SW1_BM, not HAL_RX_BUF_RBM_SW3_BM.
>
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>

There were checkpatch warnings, I fixex them in the pending branch:

drivers/net/wireless/ath/ath11k/dp.c:825: line length of 97 exceeds 90 columns
drivers/net/wireless/ath/ath11k/hal_rx.c:375: line length of 95 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:3073: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:3083: line length of 94 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:3472: line length of 100 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:5104: line length of 93 exceeds 90 columns
drivers/net/wireless/ath/ath11k/dp_rx.c:5109: line length of 93 exceeds 90 columns

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
