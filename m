Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D36C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:39:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D329760F4A
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D329760F4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+SWs2PeCAw4G12/V6A7XNjdgfQH4hUYkz0UPHSry6fU=; b=R3CVhK4+LoO1yD
	2z/vtKMFPCO7vhzj9hm3D7OUMmI5YYTVly5yWlpokpN8aYRhanSZLBwbW9k+GE0JCUxcqrKWPHTmy
	HTpLvuPft3gkJ4ffZjMIe+lEY16Dg9c5LNBnZCxHHYqEmxE8suzO9dP94/eJIElY9URRLXpQVabKS
	1w3Fmvkqqfsv40JxIkrknXb29Atf0YNm8/+TKo8I3p8jfKYAcsNSdW+JLHna3Xk4sjAjCgphgvhtX
	TDIo/Nub1/zkmlROBglShng7hmev425JVl05agdFe46iWnlEllUvSKfn5Et9kWeYZ7gLKyAypOcuw
	KD7n01JJ5gDdI+jneI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQnrJ-00AkB2-Dk; Thu, 16 Sep 2021 09:39:09 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQnrE-00Ak7S-AF
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 09:39:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631785145; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=/XIv/JwR/8MBOs5Mjxl5g+qjB2vxEn+SijivttCIYMA=;
 b=H4sj7/4KTTAAE9XJMGetdVBrt3/8KVDkw0cAzaDm8/SYH3WDEYarzbk4nT4zsLYX2hSOydar
 f6xgOur59uSwFWsB/+bgn+PviZTsJZMMS4UmqNZLeKgGoBpOuCPeoNbXQlQLKSU1rbBhkAyV
 HPDijDZS9trs9SBCzWgQnj8aUm8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6143109ed914b05182125041 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 09:38:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9377FC43460; Thu, 16 Sep 2021 09:38:37 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 99B9FC4338F;
 Thu, 16 Sep 2021 09:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 99B9FC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <seevalam@codeaurora.org>,
 Miles Hu <milehu@codeaurora.org>,
 Vasanthakumar Thiagarajan <vthiagar@codeaurora.org>
Subject: Re: [PATCH 3/3] ath11k: monitor mode clean up to use separate APIs
References: <20210721162053.46290-1-jouni@codeaurora.org>
 <20210721162053.46290-4-jouni@codeaurora.org>
 <87sfy4zwum.fsf@codeaurora.org>
Date: Thu, 16 Sep 2021 12:38:33 +0300
In-Reply-To: <87sfy4zwum.fsf@codeaurora.org> (Kalle Valo's message of "Thu, 16
 Sep 2021 12:35:45 +0300")
Message-ID: <87o88szwpy.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_023905_984393_83A122C2 
X-CRM114-Status: GOOD (  13.62  )
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

Kalle Valo <kvalo@codeaurora.org> writes:

> Jouni Malinen <jouni@codeaurora.org> writes:
>
>> From: Seevalamuthu Mariappan <seevalam@codeaurora.org>
>>
>> If monitor interface is enabled in co-exist mode, only local traffic are
>> captured. It's caused by missing monitor vdev in co-exist mode. So,
>> monitor mode clean up is done with separate Monitor APIs. For this,
>> introduce monitor_started and monitor_vdev_created boolean flags.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01725-QCAHKSWPL_SILICONZ-1
>
> Seevalamuthu, in upstream IPQ8074 doesn't even support monitor mode:
>
> static const struct ath11k_hw_params ath11k_hw_params[] = {
> 	{
> 		.hw_rev = ATH11K_HW_IPQ8074,
> 		.name = "ipq8074 hw2.0",
> ...
> 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
> 					BIT(NL80211_IFTYPE_AP) |
> 					BIT(NL80211_IFTYPE_MESH_POINT),
>
> So I wonder how did you test this? Is this something which is only
> tested on ancient QSDK kernels and not with upstream kernels?

Actually, ignore that. I forgot that there was a separate boolean for
the monitor mode:

		.supports_monitor = true,

Sorry for the noise.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
