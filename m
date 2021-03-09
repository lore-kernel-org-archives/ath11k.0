Return-Path: <SRS0=mtRf=IH=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22733C433E0
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:02:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA406513A
	for <ath11k@archiver.kernel.org>; Tue,  9 Mar 2021 11:02:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA406513A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hL/3XMC/bcuDMgehOSwT3eNLZCp8itBOqnywOG2oSgc=; b=eFjsAhpfr44Zn9c8sjuO14r58
	9mzLFbZ0VVIkqo0M12VsG17NRee1gKVBaqdoRfQRRIpS3Kpi3jZ12SSB2yURYqpLum/9QlseisloK
	H4o5WHVrKoSh5xEh/N3chJfftGsQgo6Z8qNXWULY5zZqDgSK4K4+gtHRC1ePJhU7PJEA5/L4YjrxP
	Gec6Sm2f3mjGKweM+B+GA2BvFli3uqoaYqbU8Z5ujcutQHr/WSsB4o2VskwIuHGMuHRb6EhzsyxFI
	+DaXlbS45+4wtMofc5oE9PQVPcZqhUJ/o7dhTNIMOIO6p9kx1n+2Qbq5Fau/BA2I7zChuGpf6QxlQ
	jUA/LPYWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJa7l-004Fek-NV; Tue, 09 Mar 2021 11:02:01 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJa7e-004Fdk-6S
 for ath11k@lists.infradead.org; Tue, 09 Mar 2021 11:01:59 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615287716; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=mBSXofREaKzvR+6Hh7n1KKj4BbAqDDH/xii/W7+fGbo=;
 b=VCxXb69VVdBaMHKONzGcPgOb8U9zu8nx7+deS+cAoDwbM7xYqh68TzCwYhK3UqszyBkP2/vi
 DwOj1mkkeQoNOChVsJJi4rGPDiwcLfonOeU2f+17jMGtpTiCUpM6lxuroWneMOc/gxJ3vnkd
 DFplGsAF4rS1o7z58fPqD5yXZjQ=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 604755902a5e6d1bfa897fc3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 11:01:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A15F4C433CA; Tue,  9 Mar 2021 11:01:36 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 411B5C433C6;
 Tue,  9 Mar 2021 11:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 411B5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Update signal filled flag during sta_statistics
 drv op
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210224090241.3098-1-srirrama@codeaurora.org>
References: <20210224090241.3098-1-srirrama@codeaurora.org>
To: Sriram R <srirrama@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sriram R <srirrama@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210309110136.A15F4C433CA@smtp.codeaurora.org>
Date: Tue,  9 Mar 2021 11:01:36 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_110157_093806_A73B715C 
X-CRM114-Status: UNSURE (   7.33  )
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

Sriram R <srirrama@codeaurora.org> wrote:

> Currently, though the peer rssi information is updated to station dump
> from driver sta_statistics mac op, the info doesn't get updated
> since the NL80211_STA_INFO_SIGNAL filled flag is not set in station
> info. Hence update this flag while filling the rssi info.
> 
> Tested on: IPQ8074 WLAN.HK.2.1.0.1-01213-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sriram R <srirrama@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f277eb0500b4 ath11k: Update signal filled flag during sta_statistics drv op

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210224090241.3098-1-srirrama@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
