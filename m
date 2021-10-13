Return-Path: <SRS0=CdPh=PB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D961C433F5
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 01:01:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2984B60232
	for <ath11k@archiver.kernel.org>; Wed, 13 Oct 2021 01:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2984B60232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7O7l7embTgms/vqqYTuYupN9TA3QNimYlD8DL+xqiE=; b=GdHgiOzJtrykYk3odbSWdd9FWq
	2ZaLEgdPwWFOdWre4edfQvY6hWdRsY0u/PxOLmytAlTkESBGJwGxqup8SJGaim7H/Y66NyingZZTS
	HeaQZoZ7df4UyPzTE1E5bqPcYljMyTiExg3ZQJnaEReXx+zvQ5aNSgytozsHK/MY4NZwGlwFJIKLk
	5yPXZrdgy64DK2FTtm5xR51u+ntWhMMiSW3gfHVLFEfJQqg2w+j5uiX7anRhaPpPKdUmOXbe5oCx6
	uLmKpCecrZ7N2bMKZuA+yebiR8BbYprv9GUjcY6HFRgwTTMdZRVM7BypKBRfoQbPtrR0gaomgGE+W
	iZL3zqHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maSdt-00ETpL-59; Wed, 13 Oct 2021 01:01:13 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maSZg-00ERMY-3Z
 for ath11k@lists.infradead.org; Wed, 13 Oct 2021 00:56:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634086614; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=igjm5jXtoy86exgUy+EDwN/KU7zckKC40j49aJU47ZQ=;
 b=OX7zHurGojanS6rVBbFnZ/AwDR/l4yRUH3HpkHMxbs4CQlGwqMAQaGYc84XxPWMbXBQsGCvb
 xKCWx0nDNxSLeBgYjk0HSqmrB96fCGDdcCcXl26zpLHw4wbD7/3yrbqRnfvuj6RTq6w5n4EL
 nMjq1sRBtQt1pPNP86tfu8e07w4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61662ec4ab9da96e64a356bb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 00:56:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A824CC04513; Wed, 13 Oct 2021 00:56:35 +0000 (UTC)
Received: from [192.168.1.132] (c-24-4-33-213.hsd1.ca.comcast.net
 [24.4.33.213])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jjohnson)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9469C0091E
 for <ath11k@lists.infradead.org>; Wed, 13 Oct 2021 00:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org B9469C0091E
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <66577d4d-5269-2e26-9b73-6a5643a5cede@codeaurora.org>
Date: Tue, 12 Oct 2021 17:56:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Subject: Re: [PATCH 3/3] ath11k: add synchronization operation between
 reconfigure of mac80211 and ath11k_base
Content-Language: en-US
To: ath11k@lists.infradead.org
References: <20211011081938.30327-1-wgong@codeaurora.org>
 <20211011081938.30327-4-wgong@codeaurora.org>
From: Jeff Johnson <jjohnson@codeaurora.org>
In-Reply-To: <20211011081938.30327-4-wgong@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_175655_056093_8BB2373B 
X-CRM114-Status: UNSURE (   9.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/11/2021 1:19 AM, Wen Gong wrote:
> ieee80211_reconfig() of mac80211 is the main function for recovery of
> each ieee80211_hw and ath11k, and ath11k_core_reconfigure_on_crash()
> is the main function for recovery of ath11k_base, it has more than
> one ieee80211_hw and ath11k for each ath11k_base, so it need to add
> synchronization between them, otherwise it has many issue.
> 
> For example, when ath11k_core_reconfigure_on_crash() is not complete,
> mac80211 send a hw scan request to ath11k, it leads firmware crash,
> because firmware has not been initilized at that moment, firmware

nit: s/initilized/initialized/


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
