Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DACFC433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:31:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1855F60240
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1855F60240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbEXgfWlgaU7c/KG8+UE29td1V5G63Y/ngK5OyYP84Y=; b=QvPaMdwUQDl5Qc
	5lcwGfRKrKj6qPRxMNX/Av7VOdjYhrmVAhLtLomo5wpYjeSFxcOyJ+vzXnmhuXL6qjGbX0yLFF+kV
	hjgxBxz7d3UYQoieoG/ZMuc23324+hcUbRWZyOEClB6/a6HNARrlbleKOFXcSZP794+UWtKf1OBNA
	8cfI0yl3DRoMEgqxOME+36rP8adXxnQRrh7jNGOFBP+/Smrlkl8L2NmYUEx+fCGaHVrWzGQYPyoeT
	vbWTm363XDA7cnroiJtJHOq7iwMTpIt5kQGFG3iTm85LsGdR8N6C3KoIKurXceom9dS+T8+ilGkxA
	NjlbRB2asflDOOOVcAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZoqJ-007wfI-4H; Mon, 11 Oct 2021 06:31:23 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZoq0-007wa5-6a
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 06:31:22 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633933872; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=KWMSxBBJ77ruyqX/eaeHAYx8elbKGfvcMfxh+YL+ZL4=;
 b=EOYyZc7+RvddOlAe8xfKT7+4bdsm756CbzMzcyj2yEbUnNDvW/FWeq0Is2QxypRW+xpfnug/
 xz6hyJWPR63qQYhHOKrbTpH+1aGmRPvWk7y6ElelZrGuLvB2X+P16tsWYk6toaupDjskFFiI
 aCeTxTZbX5hCNgX14XKUvgsTORs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6163da154ccc4cf2c7a09ee0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 06:30:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BD77EC43460; Mon, 11 Oct 2021 06:30:44 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 54F7FC4338F;
 Mon, 11 Oct 2021 06:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 54F7FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Baochen Qiang <bqiang@codeaurora.org>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH] ath11k: Advertise PLATFORM_CAP_PCIE_GLOBAL_RESET in qmi
 msg
References: <20211011055602.77342-1-bqiang@codeaurora.org>
Date: Mon, 11 Oct 2021 09:30:39 +0300
In-Reply-To: <20211011055602.77342-1-bqiang@codeaurora.org> (Baochen Qiang's
 message of "Mon, 11 Oct 2021 13:56:02 +0800")
Message-ID: <87v9243wfk.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_233121_262173_DA2E6976 
X-CRM114-Status: UNSURE (   6.86  )
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

Baochen Qiang <bqiang@codeaurora.org> writes:

> Inform firmware that host is capable of triggering a global reset.
> This is requested by firmware team.

Why?

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/submittingpatches#answer_to_why

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
