Return-Path: <SRS0=85K5=O7=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D395DC433F5
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:24:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86DE7603E7
	for <ath11k@archiver.kernel.org>; Mon, 11 Oct 2021 06:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86DE7603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MWOvrAYPVvn8k60asUNju/CS9QQpEPuUp59UXsiqtA=; b=x5zfzUVkmPA4mR
	hIoRB3nXds5F7YsjRM9FcbsOmksDR5zqFVVAZphijlSXgOj/vd3iXVpZrt02f2UsUv2QGKY/fLRr1
	si86xmDiU1CnWEiYjWxQSG/vv5npLC/GhpaohZ/dcnZHHOYmV97uj09jop9JIKrxoFl0dNC5drrdf
	frze2GU7NOgGjsqSwtmPatJK4EW6fQMK3rKM0Kt4YiYxvSzvDbHJqGMQCfCTmHKdizFXfj8sBL1j8
	YCncUWCsUurVdTs7bWT3LEbXnuknVK39WSvHXFPS1x4qKOsv5UkhLjY6y0BBycNqjYEquYs6wzKOy
	htoHlOf4qSnohJWkf1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZojr-007vqS-6F; Mon, 11 Oct 2021 06:24:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZojd-007voj-Me
 for ath11k@lists.infradead.org; Mon, 11 Oct 2021 06:24:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633933480; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=h7IfVo+dSWcnAR0NKGiUy+LkFKcRh55dCDpcuLc57fY=;
 b=EBussgIUILEH/ozlThpFM9XIXjczDmofbP6gfGW4RhngDTvUEsm4m5JKGEZNyMyrZFzw4cuF
 a+6Oo9mc2kwO13IOgntfBOYHoXp+aTsiPIG6sqDWTbbpGG0U49r2p9OzgxiZqjIkPUT3zxIg
 L8s/817+Eg12VKcMbZcG87y040g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6163d8894ccc4cf2c79a1076 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Oct 2021 06:24:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 54A80C4338F; Mon, 11 Oct 2021 06:24:09 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D369C4338F;
 Mon, 11 Oct 2021 06:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5D369C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath11k: Remove redundant assignment to variable
 fw_size
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211006105529.1011239-1-colin.king@canonical.com>
References: <20211006105529.1011239-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Anilkumar Kolli <akolli@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163393344268.20318.10512441412282046693.kvalo@codeaurora.org>
Date: Mon, 11 Oct 2021 06:24:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_232440_501491_2E51DB65 
X-CRM114-Status: UNSURE (   7.39  )
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

Colin King <colin.king@canonical.com> wrote:

> Variable fw_size is being assigned a value that is never read and
> being re-assigned a new value in the next statement. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 336e7b53c82f ("ath11k: clean up BDF download functions")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

4f50bdfb4e5f ath11k: Remove redundant assignment to variable fw_size

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211006105529.1011239-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
