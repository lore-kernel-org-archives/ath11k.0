Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAACC433EF
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44C2460EE9
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 15:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 44C2460EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srZw+2/CioKj+sJTFRRck65tx8tF80m+z9frbRfjnh0=; b=fLu8jkMkkuf7Gd
	7ShivctA/l+sdSnJBORMIxpa70gK3oaaYes6vZQ+pWTb2+EgtmpeYYAIyutB9YvaXy4js4VHTmkb/
	vArl+hnsqQ4oRnjjQ/RFnp8OYFrzogN8qkwuyR20CgvwaVgziRHGBnwKHJrPt7nU3roTIXY0Ii45M
	4x0O4irOsbw94hPorBoysMJrFra23ZusJwWb6mLsr1ZL3WEoQsAdFKyATYV2BjhwCklk80Q5NtcDs
	IbE+RGGX6FOLwQz3W7zAcGbBP/oulxWRNMi5YFlmxCXZLsuWZ2H4xDAZfBMMMRCebmPWENqCBpBe2
	alzOfrCanNXC5oS/1SuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZwym-009twc-GG; Mon, 11 Oct 2021 15:12:40 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZwyj-009toz-LF
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 15:12:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633965158; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=rLw0Nidxv9drcthQF27TyTS9/snTstSvn5auCq+I7KY=;
 b=dJ7rVSotyCmOMWijo1Xgz/o1j+4+e33uBUMdVLXqCyeBlj+oU3a1XIaFzgC7yu12kxw5IMNb
 jY2c0wmKsxf+k7MAmLYClsqLk2s4fm/B7JAaFw/IPW5rPWI4Z9dVLwxPkB9UEVj7n+AgcSra
 1Q4wSVhgOquUi0rU8ajAG+DOa8k=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6164546222fe3a98e5a50020 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 15:12:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0F88EC43460; Mon, 11 Oct 2021 15:12:34 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3B343C4338F;
 Mon, 11 Oct 2021 15:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3B343C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] ath11k: Change number of TCL rings to one for QCA6390
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210914163726.38604-1-jouni@codeaurora.org>
References: <20210914163726.38604-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163396515009.19083.4788837030344465834.kvalo@codeaurora.org>
Date: Mon, 11 Oct 2021 15:12:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_081238_157356_8636E87B 
X-CRM114-Status: UNSURE (   7.98  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Some targets, QCA6390 for example, use only one TCL ring, it is better to
> initialize only one ring and leave others untouched for such targets.
> 
> This is a theoretical fix found during code review, no visible impact.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

31582373a4a8 ath11k: Change number of TCL rings to one for QCA6390

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210914163726.38604-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
