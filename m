Return-Path: <SRS0=1e+W=HU=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26534C433E0
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:00:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B33264E2E
	for <ath11k@archiver.kernel.org>; Thu, 18 Feb 2021 06:00:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B33264E2E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oq1FIyDiojc+oMp5/+LvFHgPYZtcN6QuixXdZc6OFJQ=; b=ond4qdn4ftLrS0ezQKVjiXIQ8
	pOpmfBjgKErRpgBTIQfsqgZIOvBDlzCGsEh1PvQJHfQjaIEhtwK5az+3T6fZOtLCRKmy7TU4R8ZbW
	h2VnlOhysopTZJtriuyL7lSEaxMWjkChF4FXXPKHLZDNJ4N9D37ko8Q0z1KZHbvB3LHec0Jp7rFto
	umsOTNjcpZ1kpTuSDBdKF6sY/yYG48xInyEaMqhRhLHXSLbIlWu7SlByCriO34YEvqhje5kym6pHz
	PEy3USpcbXA58PAHLVwBqnrmdNIuOjVjnE4G14V2y6Mvld/Xb5OrJAQ+yFA4M7qKxsD2NY+am1+9z
	Pd2+V87YQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCcMY-0005Dr-QJ; Thu, 18 Feb 2021 06:00:30 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCcMW-0005DS-4S
 for ath11k@lists.infradead.org; Thu, 18 Feb 2021 06:00:29 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613628026; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=kbmqQ+rrzKPwhcJLQHPBo8hn1qn/ROLkdbr/KDtl24k=;
 b=UV8vHVfiYK5YHFpOdmNX8Qp+/DO3dD28WPIZtenVGHGuTU2ZPd6js/arfBCfa1c55YlubJvz
 Uo7/QMiKt4h+lSGTgkqGuBG35XOCZG208C9EoyRIg/G1VHjX5e1u1CrzLR9Tmv5hhkkz27y0
 QNp1V7pmkW48WTpYA+emviOJTpE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 602e026597484ee2ac05124c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 18 Feb 2021 06:00:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1231FC433C6; Thu, 18 Feb 2021 06:00:05 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CBD4C433CA;
 Thu, 18 Feb 2021 06:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CBD4C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Fix sounding dimension config in HE cap
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1613460136-7170-1-git-send-email-lavaks@codeaurora.org>
References: <1613460136-7170-1-git-send-email-lavaks@codeaurora.org>
To: Lavanya Suresh <lavaks@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210218060005.1231FC433C6@smtp.codeaurora.org>
Date: Thu, 18 Feb 2021 06:00:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210218_010028_280253_EE0BC2FA 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: Lavanya Suresh <lavaks@codeaurora.org>, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Lavanya Suresh <lavaks@codeaurora.org> wrote:

> Number of Sounding dimensions config received from firmware for
> bandwidth above 80MHz is cleared, and proper value is not set again.
> So not resetting it to accept the config from firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01689-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Lavanya Suresh <lavaks@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

096b625fab8f ath11k: Fix sounding dimension config in HE cap

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1613460136-7170-1-git-send-email-lavaks@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
