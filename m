Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0295CC433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C186C61B66
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C186C61B66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCCHhxUzPs50bFfBKRTu3IxC7rhBeAlnVdSdhJ309Vw=; b=oyGslU78FT14kx
	wJFj9q6ONlxvd2j516AFNwBdcueGS38u/n5w6YvT4rGPJ9NhpdIqDi6f95xGaAoq56SIJlUok+Mdl
	teEWKSAw1dCN9UWruOdnjIgO1aZmKp4Of4mOVuXM/oO55m9a4HVikGpa7GF35GwAy5XWqmkHkbXy5
	7Ik/fK9o2V5BV4SJXQPVYhIH6Orj9WSoNzHTQ4SQuZC8tLNc1n9X7KPL3cUFTC5MEuq6uzfaX/34r
	o1EJsKuirThDxFV8SGnJnY4UyKwEk8DnOR+KkGk3awAxgVZFnJqIkWNaW/NcHOKK/ODdi098CQv3J
	Pl68OkdSSWbF6zvGfv6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFOC-003nom-V0; Wed, 17 Nov 2021 07:29:52 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFO8-003n3X-TL
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:29:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134188; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZTB3DGghBHlj4adoWTnW1txeicALz4uMJz/+2sc1k1E=;
 b=jefqvEJEHHohaDYgCj/9Gl7Dn79TEaF0Clp7/7FUWFCYUhymB/xxVtdM3VrV0Y2vk58gn6lH
 9jioT0wm0VCjmYP9H5e0z5qPdptI21BSkOff4YpoiN3wwWp13+kxsMduphQZQHWpq295vzlr
 0bmYIQmkz9Vv0hp9xYDPAsbqQns=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6194af6c1e1d2f5233b50695 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:29:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 649E8C43616; Wed, 17 Nov 2021 07:29:48 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0D8B5C4338F;
 Wed, 17 Nov 2021 07:29:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 0D8B5C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: add trace log support
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
References: <1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713417889.31320.8189579342269015463.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:29:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232949_100984_D603FCBC 
X-CRM114-Status: UNSURE (   6.63  )
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

Venkateswara Naralasetty <quic_vnaralas@quicinc.com> wrote:

> This change is to add trace log support for,
>         * WMI events
>         * WMI commands
>         * ath11k_dbg messages
>         * ath11k_dbg_dump messages
>         * ath11k_log_info messages
>         * ath11k_log_warn messages
>         * ath11k_log_err messages
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.5.0.1-00652-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

fb12305aff12 ath11k: add trace log support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1636439755-30419-1-git-send-email-quic_vnaralas@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
