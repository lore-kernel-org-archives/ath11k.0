Return-Path: <SRS0=jp2b=P5=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06356C433EF
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 12:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBF16611AD
	for <ath11k@archiver.kernel.org>; Wed, 10 Nov 2021 12:41:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BBF16611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sDZHbFjvVGsnjk8Fx3D/0ruxfF7WqCyfqeUCWrg0ho=; b=KegJPUpL1Azc1T
	aKc/sVnY1Xoc6GvcKqTRuba2DV7Pt4cV23BJn32GOM2IBQ0qrlBz27SOuFFQdIO95bt4lBzHBfwA2
	tuiotZs7LKdmfb/YdA/2foKFNNNKbJMQxkwxdTmOFxPhtdx77dAxkUCmc0ud6HwmPDife7G+h2y5E
	m9aKq8nDDzLvkkpDlJDwc8MH95+bccefiUvJEZnG+u1wR8bqa1c5U7EBi0tGMOjU/sLFSu/hjbT3Z
	0yfsPtCAQNDAJmxTOIkamOPWu0Ws+DrYAivouHlsCMakdkbZPaZQdHCmyf+mHT+5GufgYw2Cxoc+g
	526va2mgV37xfLrhxpHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkmus-005SuF-Hm; Wed, 10 Nov 2021 12:41:26 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkmul-005SrZ-Kn
 for ath11k@lists.infradead.org; Wed, 10 Nov 2021 12:41:24 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636548083; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=71jw/lvo7olzfBamJSKGYUkIRP6+OiLdjF2zXGUMSzE=;
 b=la/3eRG9eQMWRk9OaRfb9FgNIj4U6d7h/8WFJdTdphLNkPtoVHoLUYtFaIib0bPg0kW1Yq3j
 x9PoGpqIz9LMzGlnYNHvtaqFTc223F+/0OIiS8kq5vvJQ+Vj+wrBaAKkAfqp1KhtIaa+5nIc
 QVKNBWb4oaQ7bz211HL27W2UBNc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 618bbdd6335d9047e17e6e1e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Nov 2021 12:40:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A248FC43460; Wed, 10 Nov 2021 12:40:54 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D745C4360D;
 Wed, 10 Nov 2021 12:40:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2D745C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/2] ath11k: convert ath11k_wmi_pdev_set_ps_mode() to
 use enum wmi_sta_ps_mode
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211108123826.8463-1-kvalo@codeaurora.org>
References: <20211108123826.8463-1-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163654804727.31349.15237326190281352213.kvalo@codeaurora.org>
Date: Wed, 10 Nov 2021 12:40:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_044123_510005_B54D1A0E 
X-CRM114-Status: UNSURE (   8.13  )
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

Kalle Valo <kvalo@codeaurora.org> wrote:

> It's more descriptive to use the actual enum used by the firmware instead of a
> boolean so change ath11k_wmi_pdev_set_ps_mode() to use a boolean.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

af3d89649bb6 ath11k: convert ath11k_wmi_pdev_set_ps_mode() to use enum wmi_sta_ps_mode
b2beffa7d9a6 ath11k: enable 802.11 power save mode in station mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211108123826.8463-1-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
